using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;

namespace importer
{
    class Program
    {
        static void Main(string[] args)
        {

            string[] allLines = File.ReadAllLines(@"kmllist.csv");

            var query = from line in allLines
                        let data = line.Split(',')
                        select new
                        {
                            Url = data[0]
                        };

            foreach (var item in query.ToList())
            {
                string url = item.Url;
                string strResult = "";

                WebResponse objResponse;
                WebRequest objRequest = System.Net.HttpWebRequest.Create(url);

                objResponse = objRequest.GetResponse();

                using (StreamReader sr = new StreamReader(objResponse.GetResponseStream()))
                {
                    strResult = sr.ReadToEnd();
                    // Close and clean up the StreamReader
                    sr.Close();
                }

                // Display results to a webpage
                Console.WriteLine(url + " done;");
            }

         
          
        }
    }
}
