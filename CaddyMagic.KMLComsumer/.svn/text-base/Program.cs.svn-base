using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using CaddyMagic.Domain;
using System.Xml;
using System.IO;
using System.Text.RegularExpressions;
using CaddyMagic.Data;
using SharpArch.Data.NHibernate;
using CaddyMagic.Data.Repository;

namespace CaddyMagic.KMLComsumer
{
    class Program
    {
      

        static void Main(string[] args)
        {
            GolfCourseRepository repo = new GolfCourseRepository();
                Repository<FeatureType> fRepo = new Repository<FeatureType>();
          
            var Kml = XDocument.Load("BridlingtonLinks.kml");
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
                int count = 1;
                  while (count <  19)
                  {
	                    if( fName.Contains("Hole " + count.ToString())){
                            holeNo = count;
                            break;
                        }
	                
                      count = count + 1;
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
                    feature.featuretype = fRepo.Get(1);
                }
                  else if( fName.Contains("Middle of Green")){
                    feature.featuretype = fRepo.Get(5);
                }
                  else if( fName.Contains("bunker")){
                    feature.featuretype = fRepo.Get(4);
                }

              else if( fName.Contains("water")){
                    feature.featuretype = fRepo.Get(6);
                }
                else{
                  featureValid = false;
              }

                if(featureValid)
                {
                string coordinates = f.Descendants().Where(x=>x.Name.LocalName =="coordinates").First().Value;

                string[] longlat = coordinates.Split(",".ToCharArray());

                feature.latitude = Decimal.Parse(longlat[0]);
                feature.longitude = Decimal.Parse(longlat[1]);

                feature.hole = h;
                h.features.Add(feature);
                    
                }

                }
                
            }
            
        }

    }
