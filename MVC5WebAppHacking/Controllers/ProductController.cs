using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplicationHack1.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        //public ActionResult Index()
        //{
        //    //return View();
        //    //return "this is my default action";
        //    return Json(new { id = 0, title = "Paint pots", description = "pots full of paint", price = 3.95 }, JsonRequestBehavior.AllowGet);
        //}
        public string Index()
        {
            //return View();
            //return "this is my default action";
            //return "<pre>[{\"id\":0,\"title\":\"Paint pots\",\"description\":\"pots full of paint\",\"price\":3.95}]</pre>";
            return "[{\"id\":0,\"title\":\"Paint pots\",\"description\":\"pots full of paint\",\"price\":3.95},{\"id\":1,\"title\":\"Christmas Bells\",\"description\":\"bells that jingle jangle jingle\",\"price\":5.55},{\"id\":2,\"title\":\"Hanukah Latkes\",\"description\":\"Potato Pancakes, a tasty treat. \",\"price\":6.50}]";
        }
        public string FcukOff()
        {
            //return View();
            return "this is my fcuk off action";
        }
        public ActionResult Json()
        {
            //return Json(new {foo="bar", baz="Blech"});
            //return Json(new { foo = "bar", baz = "Blech" },JsonRequestBehavior.AllowGet);
            return Json(new { id = 0, title = "Paint pots", description="pots full of paint", price=3.95}, JsonRequestBehavior.AllowGet);
            //return js
       
        }
        public String JsonString()
        {
            //return Json(new {foo="bar", baz="Blech"});
            //return Json(new { foo = "bar", baz = "Blech" },JsonRequestBehavior.AllowGet);
            return "<pre>[{\"id\":0,\"title\":\"Paint pots\",\"description\":\"pots full of paint\",\"price\":3.95}]</pre>";
        }
    }
}