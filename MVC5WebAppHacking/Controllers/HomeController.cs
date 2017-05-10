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
            ClassLibraryHack.StupidMath stupidMath = new ClassLibraryHack.StupidMath();
            //ViewBag.Message = "Your application description page.  This is the viewbag";
            ViewBag.Message = "Your application description page.  This is the viewbag :: " + stupidMath.Puke() + " :: " + stupidMath.DivideTwoDumbIntegers(45,9) + " :: ";


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
            int ClaimId = 1263589;
            int UserId = 5664498;  //scroce
            int DomainId = 54321;
            int TimeZoneId = 12;
            int LocaleId = 13;
            int ApplicationId = 30;
            WebApplicationHack1.net.intelliclaim.webservices.LossNotice LN = new WebApplicationHack1.net.intelliclaim.webservices.LossNotice();

            //XSLT LossNotice Bullshit
            //string crapola = LN.GetLossNotice(UserId, DomainId, TimeZoneId, LocaleId, ApplicationId, ClaimId, "C:\\CEI\\TFS\\Claimslink\\DEV\\ICWebServices\\Branding\\Default\\LossNotice.xslt");
            //string crapola = LN.GetLossNotice(UserId, DomainId, TimeZoneId, LocaleId, ApplicationId, ClaimId, "C:\\git\\MVC5WebAppHacking\\MVC5WebAppHacking\\CEICrap\\xslt\\Branding\\Default\\LossNotice.xslt");
            //string crapola = LN.GetLossNotice(UserId, DomainId, TimeZoneId, LocaleId, ApplicationId, ClaimId, string.Empty);
            



            ViewBag.Message = "Crapola";
            //ViewBag.Crapola = crapola;

            return View();
        }
        


    }
}