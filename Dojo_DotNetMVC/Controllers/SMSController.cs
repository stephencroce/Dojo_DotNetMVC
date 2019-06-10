using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft;

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
        //public string GetSMSAlertTypes()
        //{
        //    return "[{ SMSTypeID: '0', SMSType: 'Assigned Shop Information', SMSMessageWording: 'CEI Shop Assigment Alert:  Re Claim 1421324 - Your 2011 Chevrolet Impala has been assigned to CollisionMax Trevose, PA 19102' }, {  SMSTypeID: '1', SMSType: 'TBD1', SMSMessageWording: 'Leverage agile frameworks to provide a robust synopsis for high level overviews.' }, { SMSTypeID: '2', SMSType: 'TBD2', SMSMessageWording: 'Bring to the table win-win survival strategies to ensure proactive domination.' }];";
        //}
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
            bool success=false;
            var randomNum = new Random();
                     
            if (randomNum.Next(1,100) % 2 !=0)
            { success = true; }

            //return View();
            //return Json(true, JsonRequestBehavior.AllowGet);
            return Json(success, JsonRequestBehavior.AllowGet);
        }
        public string Send_SMSTextNow()
        {

            return "true";
            //return false;
        }
        //yeah, I know, this is not organized correctly
        public class SMSContact
        {
            //https://aspdotnetcodehelp.wordpress.com/2015/08/08/how-to-populate-dropdownlist-from-database-using-angularjs-ng-options-attribute/
            //$scope.recipients = [{ contactName: 'Xavier Cougat', contactType: 'Total Loss', contactPhone: '(215) 123-1234' }, { contactName: 'Jenny Jenny', contactType: 'Decision', contactPhone: '(512) 867-5309' }, { contactName: 'Johanna Farms', contactType: 'Claim', contactPhone: '(609) 987-6543' }];
            public string _contactName;
            public string _contactType;
            public string _contactPhone;
            //Constructor
            public SMSContact(string contactName, string contactType, string contactPhone)
            {
                _contactName = contactName;
                _contactType = contactType;
                _contactPhone = contactPhone;
                
            }
            
        }
        //return "[{ SMSTypeID: '0', SMSType: 'Assigned Shop Information', SMSMessageWording: 'CEI Shop Assigment Alert:  Re Claim 1421324 - Your 2011 Chevrolet Impala has been assigned to CollisionMax Trevose, PA 19102' }, {  SMSTypeID: '1', SMSType: 'TBD1', SMSMessageWording: 'Leverage agile frameworks to provide a robust synopsis for high level overviews.' }, { SMSTypeID: '2', SMSType: 'TBD2', SMSMessageWording: 'Bring to the table win-win survival strategies to ensure proactive domination.' }];";
        public class SMSTextAlert
        {
            private int _SMSTypeID;
            private string _SMSType;
            private string _SMSMessageWording;
            public int SMSTypeID
            {
                get { return _SMSTypeID; }
                set { _SMSTypeID = value; }
            }
            public string SMSType
            {
                get { return _SMSType; }
                set { _SMSType = value; }
            }
            public string SMSMessageWording
            {
                get { return _SMSMessageWording; }
                set { _SMSMessageWording = value; }
            }
            //Constructor
            public SMSTextAlert(int SmsTypeID, string SmsType, string SmsMessageWording)
            {
                SMSTypeID = SmsTypeID;
                SMSType = SmsType;
                SMSMessageWording = SmsMessageWording;
            }
        }
        public List<SMSTextAlert> GetSMSTextAlertChoices()
        {
            //return "[{ SMSTypeID: '0', SMSType: 'Assigned Shop Information', SMSMessageWording: 'CEI Shop Assigment Alert:  Re Claim 1421324 - Your 2011 Chevrolet Impala has been assigned to CollisionMax Trevose, PA 19102' }, 
            //{  SMSTypeID: '1', SMSType: 'TBD1', SMSMessageWording: 'Leverage agile frameworks to provide a robust synopsis for high level overviews.' }, 
            //{ SMSTypeID: '2', SMSType: 'TBD2', SMSMessageWording: 'Bring to the table win-win survival strategies to ensure proactive domination.' }];";
            List<SMSTextAlert> SMSTextAlertTypes = new List<SMSTextAlert>();
            SMSTextAlert smsTextAlert1 = new SMSTextAlert(0,"Assigned Shop Information", "CEI Shop Assigment Alert:  Re Claim 1421324 - Your 1972 AMC Gremlin has been assigned to CollisionMax Trevose, PA 19102");
            SMSTextAlert smsTextAlert2 = new SMSTextAlert(1, "TBD1", "Leverage agile frameworks to provide a robust synopsis for high level overviews.");
            SMSTextAlert smsTextAlert3 = new SMSTextAlert(2, "TBD2", "Bring to the table win-win survival strategies to ensure proactive domination.");

            SMSTextAlertTypes.Add(smsTextAlert1);
            SMSTextAlertTypes.Add(smsTextAlert2);
            SMSTextAlertTypes.Add(smsTextAlert3);

            return SMSTextAlertTypes;
        }
        public ActionResult GetSMSTextAlertTypes()
        {
            //return "[{ SMSTypeID: '0', SMSType: 'Assigned Shop Information', SMSMessageWording: 'CEI Shop Assigment Alert:  Re Claim 1421324 - Your 2011 Chevrolet Impala has been assigned to CollisionMax Trevose, PA 19102' }, {  SMSTypeID: '1', SMSType: 'TBD1', SMSMessageWording: 'Leverage agile frameworks to provide a robust synopsis for high level overviews.' }, { SMSTypeID: '2', SMSType: 'TBD2', SMSMessageWording: 'Bring to the table win-win survival strategies to ensure proactive domination.' }];";
            List<SMSTextAlert> SMSTextAlertList = GetSMSTextAlertChoices();
            //return Json(new { }, JsonRequestBehavior.AllowGet);
            return Json(SMSTextAlertList, JsonRequestBehavior.AllowGet);
        }
        public List<SMSContact> GetSMSContacts()
        {
            List<SMSContact> SMSContactList = new List<SMSContact>();

            //manually new up some Contacts:
            //$scope.recipients = [{ contactName: 'Xavier Cougat', contactType: 'Total Loss', contactPhone: '(215) 123-1234' }, { contactName: 'Jenny Jenny', contactType: 'Decision', contactPhone: '(512) 867-5309' }, { contactName: 'Johanna Farms', contactType: 'Claim', contactPhone: '(609) 987-6543' }];
            var SMSContact1 = new SMSContact("Xavier Cougat", "Total Loss", "(215) 123-1234");
            var SMSContact2 = new SMSContact("Jenny Jenny", "Decision", "(512) 867-5309");
            var SMSContact3 = new SMSContact("Johanna Farms", "Claim", "(609) 987-6543");

            SMSContactList.Add(SMSContact1);
            SMSContactList.Add(SMSContact2);
            SMSContactList.Add(SMSContact3);

            return SMSContactList;

        }
        public ActionResult GetSMSContacts2()
        {
            List<SMSContact> SMSContactList = GetSMSContacts(); 
            return Json(from SMSContact contact in SMSContactList select new { contactName = contact._contactName, contactType = contact._contactType, contactPhone = contact._contactPhone }, JsonRequestBehavior.AllowGet);
        }
        public string GetSMSContactsString()
        {
            //return "[{ contactName: 'Xavier Cougatski', contactType: 'Total Loss', contactPhone: '(215) 123-1234' }, { contactName: 'Jenny Jenny', contactType: 'Decision', contactPhone: '(512) 867-5309' }, { contactName: 'Johanna Farms', contactType: 'Claim', contactPhone: '(609) 987-6543' }];";
            //return "[{ contactName: \"Xavier Cougatski\", contactType: \"Total Loss\", contactPhone: \"(215) 123-1234\" }, { contactName: \"Jenny Jenny\", contactType: \"Decision\", contactPhone: \"(512) 867-5309\" }, { contactName: \"Johanna Farms\", contactType: \"Claim\", contactPhone: \"(609) 987-6543\" }];";
            //return "[{ \"contactName\": \"Xavier Cougatski\", \"contactType\": \"Total Loss\", \"contactPhone\": \"(215) 123-1234\" }, { \"contactName\": \"Jenny Jenny\", \"contactType\": \"Decision\", \"contactPhone\": \"(512) 867-5309\" }, { \"contactName\": \"Johanna Farms\", \"contactType\": \"Claim\", \"contactPhone\": \"(609) 987-6543\" }];";
            //return "[{ \"contactName\": \"Xavier Cougatski\", \"contactType\": \"Total Loss\", \"contactPhone\": \"(215) 123-1234\" }, { \"contactName\": \"Jenny Jenny\", \"contactType\": \"Decision\", \"contactPhone\": \"(512) 867-5309\" }, { \"contactName\": \"Johanna Farms\", \"contactType\": \"Claim\", \"contactPhone\": \"(609) 987-6543\" }]";
            //return "<pre>[{ \"contactName\": \"Xavier Cougatski\", \"contactType\": \"Total Loss\", \"contactPhone\": \"(215) 123-1234\" }, { \"contactName\": \"Jenny Jenny\", \"contactType\": \"Decision\", \"contactPhone\": \"(512) 867-5309\" }, { \"contactName\": \"Johanna Farms\", \"contactType\": \"Claim\", \"contactPhone\": \"(609) 987-6543\" }]</pre>";
            return "\"contacts\":[{ \"contactName\": \"Xavier Cougatski\", \"contactType\": \"Total Loss\", \"contactPhone\": \"(215) 123-1234\" }, { \"contactName\": \"Jenny Jenny\", \"contactType\": \"Decision\", \"contactPhone\": \"(512) 867-5309\" }, { \"contactName\": \"Johanna Farms\", \"contactType\": \"Claim\", \"contactPhone\": \"(609) 987-6543\" }]";

        }
        public JsonResult stupid()
        {
            string stupid = "[{ contactName: 'Xavier Cougatski', contactType: 'Total Loss', contactPhone: '(215) 123-1234' }, { contactName: 'Jenny Jenny', contactType: 'Decision', contactPhone: '(512) 867-5309' }, { contactName: 'Johanna Farms', contactType: 'Claim', contactPhone: '(609) 987-6543' }];";
            return Json(stupid, JsonRequestBehavior.AllowGet);
        }
        //public ActionResult SMSJson()
        public JsonResult SMSJson()
        {
            //return Json(new {foo="bar", baz="Blech"});
            //return Json(new { foo = "bar", baz = "Blech" },JsonRequestBehavior.AllowGet);
           // return Json(new { contactName = "Xavier Cougatski", contactType = "Total Loss", contactPhone = "(215) 123-1234" }, JsonRequestBehavior.AllowGet);
            return Json(new { contactName = "Xavier Cougatski", contactType = "Total Loss", contactPhone = "(215) 123-1234" }, JsonRequestBehavior.DenyGet);


        }

    }
}