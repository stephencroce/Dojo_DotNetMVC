using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

using StackExchange.Profiling;

namespace WebApplicationHack1
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            MiniProfiler.Settings.Results_Authorize = IsUserAllowedToSeeMiniProfilerUI;
            MiniProfiler.Settings.Results_List_Authorize = IsUserAllowedToSeeMiniProfilerUI;

        }
        protected void Application_BeginRequest()
        {
            if (Request.IsLocal)
            {
                //MiniProfiler.Start();
            }
        }
        protected void Application_EndRequest()
        {
            //MiniProfiler.Stop();
        }
        private bool IsUserAllowedToSeeMiniProfilerUI(HttpRequest httpRequest)
        {
            //// Implement your own logic for who 
            //// should be able to access ~/mini-profiler-resources/results-index
            //var principal = httpRequest.RequestContext.HttpContext.User;
            //return principal.IsInRole("Developer");
            return true;
        }
    }
}
