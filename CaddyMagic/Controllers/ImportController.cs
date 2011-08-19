using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CaddyMagic.Data.Repository;
using CaddyMagic.Domain;
using System.Xml.Linq;
using SharpArch.Data.NHibernate;
using System.Net;
using System.Configuration;
using System.IO;
using System.Xml;

namespace CaddyMagic.Web.Controllers
{
    public class ImportController : Controller
    {
        //
        // GET: /Import/
        //[AcceptVerbs(HttpVerbs.Get)]
        //public ActionResult ImportKML()
        //{

        //}

       //[AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ImportKML(string KMLUrl)
        {
            GolfCourseRepository repo = new GolfCourseRepository();
            Repository<FeatureType> fRepo = new Repository<FeatureType>();

            var Kml = XDocument.Load(KMLUrl); //Server.MapPath("../kml/BridlingtonLinks.kml"));
            var name = Kml.Descendants().Where(x => x.Name.LocalName == "name").First().Value;
            var features = (from h in Kml.Descendants().Elements().Where(x => x.Name.LocalName == "Placemark") select h).ToList();
            GolfCourse gc = new GolfCourse();
            gc.name = name;
            foreach (var f in features)
            {

                Feature feature = new Feature();
                var featureValid = true;

                int fType = 0;
                string fName = f.Descendants().Where(x=>x.Name.LocalName =="name").First().Value ;
                Hole h = null;

                 int holeNo = 0;
                int count = 18;
                  while (count >  0)
                  {
	                    if( fName.Contains("Hole " + count.ToString())){
                            holeNo = count;
                            break;
                        }
	                
                      count = count - 1;
                  }
               
                if (holeNo == 0)
                {
                    featureValid = false;
                }
                else
                {
                     h = gc.holes.FirstOrDefault(x=>x.holeNumber==holeNo);
                    if (h == null)
                    {
                        h = new Hole() { holeNumber = holeNo, strokeIndex =0};
                        gc.AddHole(h);
                    }
                }



                if( fName.Contains("Tee")){
                    feature.featuretypeID = 1;
                    feature.featuretype = fRepo.Get(1);
                }
                  else if( fName.Contains("Middle of Green")){
                    feature.featuretypeID = 5;
                    feature.featuretype = fRepo.Get(5);
                }
                  else if( fName.Contains("bunker")){
                    feature.featuretypeID = 4;
                    feature.featuretype = fRepo.Get(4);
                }

              else if( fName.Contains("water")){

                    feature.featuretypeID = 6;
                    feature.featuretype = fRepo.Get(6);

                 
                }
                else{
                  featureValid = false;
              }

                if(featureValid)
                {
                string coordinates = f.Descendants().Where(x=>x.Name.LocalName =="coordinates").First().Value;

                string[] longlat = coordinates.Split(",".ToCharArray());

                Random rnd = new Random();


                feature.longitude = Decimal.Parse(longlat[0]);
                feature.latitude = Decimal.Parse(longlat[1]);

                feature.hole = h;
                
                    // don't add multiple tees or greens or too many features in general...
                    var teeCount = h.features.Where(x=>x.featuretypeID == 1).ToList().Count() ;
                    var greenCount = h.features.Where(x=>x.featuretypeID == 5).ToList().Count();
                    var thisTypeCount = h.features.Where(x => x.featuretypeID == feature.featuretypeID).ToList().Count();
                      

                    if((feature.featuretypeID ==1) )
                    {
                        if (teeCount == 0)
                        {
                            h.features.Add(feature);
                        }
                    }
                    else if ((feature.featuretypeID == 5))
                    {
                        if (greenCount == 0)
                        {
                            h.features.Add(feature);
                        }
                    }
                    else if (thisTypeCount <3)
                    {
                        h.features.Add(feature);
                    }
                    
                }

                }

            gc.longitude = gc.holes[0].features.Single(x => x.featuretypeID == 1).longitude;
            gc.latitude = gc.holes[0].features.Single(x => x.featuretypeID == 1).latitude;

                gc.area = GetGeoCodeData(gc.longitude, gc.latitude);
                repo.SaveOrUpdate(gc);
                return View();
            }


        private string GetGeoCodeData(decimal Longitude, decimal Latitide)
        {

            //Initialisation, we use localhost, change if appliable
            HttpWebRequest WebReq = (HttpWebRequest)WebRequest.Create("http://maps.google.com/maps/geo?output=xml&sensor=true_or_false&key=" + ConfigurationManager.AppSettings.Get("gMapKey") + "&q=" + Latitide + "," + Longitude);
            //Our method is post, otherwise the buffer (postvars) would be useless
            WebReq.Method = "GET";
            //We use form contentType, for the postvars.
            WebReq.ContentType = "application/x-www-form-urlencoded";


            //Now we write, and afterwards, we close. Closing is always important!

            //Get the response handle, we have no true response yet!
            HttpWebResponse WebResp = (HttpWebResponse)WebReq.GetResponse();
            ////Let's show some information about the response
            //Console.WriteLine(WebResp.StatusCode);
            //Console.WriteLine(WebResp.Server);

            //Now, we read the response (the string), and output it.
            Stream Answer = WebResp.GetResponseStream();
            StreamReader _Answer = new StreamReader(Answer);

            try
            {
                XmlDocument xml = new XmlDocument();
                String xmlResponse = _Answer.ReadToEnd();
                xml.LoadXml(xmlResponse);

                return xml.ChildNodes[1].ChildNodes[0].ChildNodes[2].ChildNodes[0].InnerText;

            }
            finally
            {
                _Answer.Close();
            }



        } 
        }



    }

