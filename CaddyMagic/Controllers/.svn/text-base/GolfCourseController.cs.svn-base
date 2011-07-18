using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using CaddyMagic.Domain;
using System.Text;
using System.Net;
using System.IO;
using System.Xml;
using SharpArch.Data.NHibernate;
using System.Configuration;
using CaddyMagic.Data.Repository;
using System.ComponentModel;


namespace CaddyMagic.Web.Controllers
{
    public class GolfCourseController : Controller
    {

       
       public ActionResult NewCoursesSide()
        {
            GolfCourseRepository repo = new GolfCourseRepository();

          
             ViewData.Model=  repo.AllCourses(1, 3);
            //show all mapped courses...
            return View();
        }

        // GET: /Course/1054
        public ActionResult Index([DefaultValue(1)]int pageNumber)
        {
            GolfCourseRepository repo = new GolfCourseRepository();
        

            ViewData["courses"] = repo.AllCourses(pageNumber, 10);
            ViewData["NumCourses"] = repo.CourseCount();
            //show all mapped courses...
            return View();
        }

        public ActionResult Create()
        {
            return View();
        }

        public ActionResult AddHole(int courseID)
        {
            List<SelectListItem> ddOptions = new List<SelectListItem>();
            Repository<GolfCourse> repo = new Repository<GolfCourse>();
            //List<int> possiblHoles= new List<int>{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18};
            //foreach (var h in repo.Get(courseID).holes)
            //{
            //    possiblHoles.Remove(h.Id);
            //}
            //foreach (var i in possiblHoles)
            //{
            //    ddOptions.Add(new SelectListItem { Value = i.ToString(), Text = "Hole " + i.ToString() });
            //}
            
            ViewData["ddHoleNumbers"] = ddOptions;
            GolfCourse gc = repo.Get(courseID);

            Hole h = new Hole();
            h.par = 4;
            h.strokeIndex = 0;
            gc.AddHole(h);

            repo.SaveOrUpdate(gc); 
            repo.DbContext.CommitChanges();

            ViewData.Model = h;
            return View();
        }

        public ActionResult EditHole(int holeId)
        {
            List<SelectListItem> ddOptions = new List<SelectListItem>();
            Repository<Hole> repo = new Repository<Hole>();
            Hole hole = repo.Get(holeId);

            if (hole.GolfCourse.approved)
            {
                throw new Exception("You cannot edit an approved course...");
            }

            List<int> possiblHoles = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 };
            foreach (var h in hole.GolfCourse.holes)
            {
                possiblHoles.Remove(h.holeNumber);
            }
            foreach (var i in possiblHoles)
            {
                ddOptions.Add(new SelectListItem { Value = i.ToString(), Text = "Hole " + i.ToString() });
            }
            System.Web.Script.Serialization.JavaScriptSerializer oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
              var feats = from c in hole.features
                    select new { longitude = c.longitude, latitude = c.latitude, featureType = c.featuretype.Name };
              string sJSON = oSerializer.Serialize(feats);

            ViewData["feats"] = sJSON;
            ViewData["ddHoleNumbers"] = ddOptions;
            ViewData.Model = hole;
            return View("AddHole", hole);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(string latitude, string longitude, string name, string description)
        {
            if( string.IsNullOrEmpty(name)){
                ViewData.ModelState.AddModelError("name","Please enter a name");
            }
            if (string.IsNullOrEmpty(latitude))
            {
                ViewData.ModelState.AddModelError("name", "Please find the club house on the map and click it");
            }

            if (!ModelState.IsValid)
                return View();

            GolfCourse gc = new GolfCourse();
            gc.name = name;
            gc.description = description;
            gc.latitude = decimal.Parse(latitude);
            gc.longitude = decimal.Parse(longitude);
            gc.area = GetGeoCodeData(decimal.Parse(longitude), decimal.Parse(latitude));
            Repository<GolfCourse> repo = new Repository<GolfCourse>();

            repo.SaveOrUpdate(gc);
            repo.DbContext.CommitChanges();
            return RedirectToAction("Edit", new { courseId = gc.Id });
        }

        public ActionResult Edit(int courseId)
        {
            Repository<GolfCourse> repo = new Repository<GolfCourse>();
            GolfCourse gc = repo.Get(courseId);

            if (gc.approved)
            {
                throw new Exception("You cannot edit an approved course...");
            }

            ViewData.Model = gc;
            return View();
        }

        // GET: /Course/
        public ActionResult View(int courseId)
        {
            Repository<GolfCourse> repo = new Repository<GolfCourse>();

    
            GolfCourse gc = repo.Get(courseId);
            ViewData.Model = gc;

            // holes dropdown
                List<SelectListItem> ddItems = new List<SelectListItem>();
                foreach (Hole h in gc.holes)
                {
                    SelectListItem i = new SelectListItem();
                    i.Text = "Hole " + h.holeNumber.ToString();
                    i.Value = h.Id.ToString();
                    ddItems.Add(i);
                }

                ViewData["HolesDropDown"] = ddItems;

            return View();
        }
				// POST: /Course/
				public ActionResult Search(string searchterm)
				{
					return View();
				}


				// GET: /Course/Download/CourseID
				public JsonResult Download(int courseId   )
				{
					// check that it's our app that's accessing thing page
					// TODO!

                    Repository<GolfCourse> repo = new Repository<GolfCourse>();

      
                      GolfCourse gc = repo.Get( courseId);
                   
                    if(gc != null)
                    {
                        List<Object> hs = new List<Object>();


                        foreach(var h in gc.holes)
                        {
                            List<Object> fs = new List<Object>();
                              foreach (var f in h.features)
                            {
                                fs.Add(new { featuretypeID = f.featuretype.Id, height = f.height, latitude = f.latitude, longitude = f.longitude });
                            }
                            hs.Add(new { holeNumber = h.holeNumber,par = h.par,strokeIndex = h.strokeIndex, features = fs });
                          
                        }

                        return Json(new { altitude = gc.altitude, description = gc.description, holes = hs,latitude= gc.latitude,longitude= gc.longitude,name= gc.name }, JsonRequestBehavior.AllowGet);
                    }

					// Send it down the wire as a JSON object...
					return Json("false");
				}


         [ObjectFilter(Param = "postdata", RootType = typeof(GolfCourse))]
          public JsonResult Upload(GolfCourse postdata  )
          {

              Repository<GolfCourse> repo = new Repository<GolfCourse>();

              Repository<FeatureType> fRepo = new Repository<FeatureType>();

              postdata.Id = 0;
              foreach (var h in postdata.holes)
              {
                  h.Id = 0;
                  h.GolfCourse = postdata;
                  foreach (var f in h.features)
                  {
                      f.hole = h;
                      f.Id = 0;
                      f.featuretype = fRepo.Get(f.featuretypeID);
                     
                  }
              }


              postdata.area = GetGeoCodeData(postdata.longitude, postdata.latitude);
              repo.SaveOrUpdate(postdata);
              repo.DbContext.CommitChanges();
             
              return Json(true);
          }

         // Cast method - thanks to type inference when calling methods it 
         // is possible to cast object to type without knowing the type name
         T Cast<T>(object obj, T type)
         {
             return (T)obj;
         }


          // POST: /Course/
          public JsonResult RemoteSearch(string searchterm)
          {
              GolfCourseRepository repo = new GolfCourseRepository();

              List<CourseDTO> gcs = repo.FindCourse(searchterm);
           

              if (gcs != null)
              {
                 
                  return Json(gcs,JsonRequestBehavior.AllowGet);
              }
              return Json(false, JsonRequestBehavior.AllowGet);
          }

          public ActionResult HoleMap(int holeID)
          {
              Repository<Hole> repo = new Repository<Hole>();
             ViewData.Model =  repo.Get(holeID);
              return View();
          }



        private string GetGeoCodeData(decimal Longitude, decimal Latitide)
        {
          
            //Initialisation, we use localhost, change if appliable
            HttpWebRequest WebReq = (HttpWebRequest)WebRequest.Create("http://maps.google.com/maps/geo?output=xml&sensor=true_or_false&key=" + ConfigurationManager.AppSettings.Get("gMapKey") + "&q=" + Latitide + "," + Longitude);
            //Our method is post, otherwise the buffer (postvars) would be useless
            WebReq.Method = "GET";
            //We use form contentType, for the postvars.
            WebReq.ContentType ="application/x-www-form-urlencoded";
  

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
                    xml.LoadXml( xmlResponse);  

                    return xml.ChildNodes[1].ChildNodes[0].ChildNodes[2].ChildNodes[0].InnerText;
                   
            }
            finally
            {
                _Answer.Close();
            }

     

        } 
            
    }



}
