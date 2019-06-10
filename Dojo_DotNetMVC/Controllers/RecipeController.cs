using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplicationHack1.Controllers
{
    public class RecipeController : Controller
    {

        // GET: Recipe
        public ActionResult Index()
        {
            var draftJson = new
            {
                total = 1,
                page = 1,
                records = 1,
                rows = new[]
      {
       new{
          id = 8,
          cell = new[]
          {
          "data1",
          "data2",
          "9/13/2010",
          }
          }
     },
            };

            return Json(draftJson, JsonRequestBehavior.AllowGet);
        }
        //public string Index()
        //{
        //    //return View();
        //    //return "this is my default action";
        //    //return "<pre>[{\"id\":0,\"title\":\"Paint pots\",\"description\":\"pots full of paint\",\"price\":3.95}]</pre>";
        //    return "[{\"id\":1,\"title\":\"Cookies\",\"description\":\"Delicious, crisp on the outside, chewy on the inside\",\"price\":3.95},{\"id\":1,\"title\":\"Christmas Bells\",\"description\":\"bells that jingle jangle jingle\",\"price\":5.55},{\"id\":2,\"title\":\"Hanukah Latkes\",\"description\":\"Potato Pancakes, a tasty treat. \",\"price\":6.50}]";
        //}
    }
}