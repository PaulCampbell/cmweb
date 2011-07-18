
using Db4objects.Db4o;
using System.Linq;
using Db4objects.Db4o.Linq;
using System.Web;
using System.IO;
using System;
using System.Collections.Generic;

namespace CaddyMagic.Web.Data
{
    
        public class SessionFactory
        {
            static ISession _current;
            //this needs to stay static - can't have more than 
            //one server on the file
            static IObjectServer _server;

            public static ISession CreateSession()
            {

                if (_server == null)
                {
                    string _dbPath = System.Configuration.ConfigurationManager
                        .ConnectionStrings["ObjectStore"].ConnectionString;

                    //check to see if this is pointing to data directory
                    //change as you need btw
                    if (_dbPath.Contains("|DataDirectory|"))
                    {

                        //we know, then, that this is a web project
                        //and HttpContext is hopefully not null...

                        _dbPath = _dbPath.Replace("|DataDirectory|", "");
                        string appDir = HttpContext.Current.Server.MapPath("~/App_Data/");
                        _dbPath = Path.Combine(appDir, _dbPath);
                    }
                    _server = Db4oFactory.OpenServer(_dbPath, 0);
                }

                return new Db4oSession(_server);
            }

            public static Db4oSession Current
            {
                get
                {
                    _current = null;
                    if (_current == null)
                        _current = CreateSession();
                    return (Db4oSession)_current;
                }
            }
        }
    }
