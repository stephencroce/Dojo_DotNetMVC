using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplicationHack1.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            
            return View();
        }

        public ActionResult About()
        {
            //System.Threading.Thread.Sleep(25000);
            ViewBag.Message = "Your application description page.  This is the viewbag";
            

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult logSearch()
        {
            ViewBag.Message = "Your logSearch.";

            return View();
        }
        public ActionResult crapola()
        {
            ViewBag.Message = "Crapola";

            return View();
        }


    }
}