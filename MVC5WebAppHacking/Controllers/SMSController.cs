using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplicationHack1.Controllers
{
    public class SMSController : Controller
    {
        // GET: SMS
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult SMSScreen(string Mode, string OrgStructureID)
        {
            //Response.Write("GAAAAAAAAAAAAAAAAAAAA" + Mode + OrgStructureID);
            return View("/Views/SMS/SMSScreen.cshtml");
        }
        public string GetRecipients()
        {
            return "[{ contactName: 'Xavier Cougat', contactType: 'Total Loss', contactPhone: '(215) 123-1234' }, { contactName: 'Jenny Jenny', contactType: 'Decision', contactPhone: '(512) 867-5309' }, { contactName: 'Johanna Farms', contactType: 'Claim', contactPhone: '(609) 987-6543' }];";
        }
        public string GetSMSAlertTypes()
        {
            return "[{ SMSTypeID: '0', SMSType: 'Assigned Shop Information', SMSMessageWording: 'CEI Shop Assigment Alert:  Re Claim 1421324 - Your 2011 Chevrolet Impala has been assigned to CollisionMax Trevose, PA 19102' }, {  SMSTypeID: '1', SMSType: 'TBD1', SMSMessageWording: 'Leverage agile frameworks to provide a robust synopsis for high level overviews.' }, { SMSTypeID: '2', SMSType: 'TBD2', SMSMessageWording: 'Bring to the table win-win survival strategies to ensure proactive domination.' }];";
        }
        //which one should I do?
        public ActionResult SaveSMSTextSettings()
        {
            return View();
        }
        public bool Save_SMSTextSettings()
        {
            return true;
        }
        public ActionResult SendSMSTextNow()
        {
            return View();
        }
        public bool Send_SMSTextNow()
        {
            return true;
        }

    }
}