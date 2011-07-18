using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net.Mail;

namespace CaddyMagic.Controllers
{
	[HandleError]
	public class HomeController : Controller
	{
		public ActionResult Index()
		{
			return View();
		}

		public ActionResult About()
		{
			return View();
		}
        
        public ActionResult RangeFinder()
        {
            return View();
        }

        public ActionResult NewsAndPress()
        {
            return View();
        }

		public ActionResult Contact()
		{
			return View();
		}

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Contact(String txtSubject, String txtMessage, String txtEmail)
        {
            MailMessage mailMsg = new MailMessage();
            mailMsg.To.Add("paulgcampbell@gmail.com");

            // From
            MailAddress mailAddress = new MailAddress(txtEmail);
            mailMsg.From = mailAddress;

            // Subject and Body
            mailMsg.Subject = "CaddyMagic:" + txtSubject;
            mailMsg.Body = txtMessage;

            // Init SmtpClient and send
            SmtpClient smtpClient = new SmtpClient();
            
            smtpClient.Host = "127.0.0.1";
            smtpClient.Send(mailMsg);
           
            ViewData["MessageStatus"] = "sent";

            return View();
        }


		public ActionResult News()
		{
			return View();
		}
	}
}
