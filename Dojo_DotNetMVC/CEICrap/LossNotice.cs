using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplicationHack1.CEICrap
{
    public class LossNotice
    {
        //Gets the FNOL and the FNOL Header from the LossNotice Web Service
        static public string GetFNOL(int userID, int domainID, int timeZoneID, int localeID, int applicationID, int claimID, Claim myClaim, out string FNOLHeader)
        {
            string FNOL = string.Empty;
            FNOLHeader = string.Empty;
            try
            {
                WebApplicationHack1.net.intelliclaim.webservices.LossNotice ln = new WebApplicationHack1.net.intelliclaim.webservices.LossNotice();
                //FNOL = ln.GetLossNoticeAll(userID, domainID, timeZoneID, localeID, applicationID, claimID, GetCoBrandingDirectory(myClaim, domainID, applicationID), myClaim.ClaimEmployee.Name.DisplayName(), out FNOLHeader);
                FNOL = ln.GetLossNoticeAll(userID, domainID, timeZoneID, localeID, applicationID, claimID, GetCoBrandingDirectory(myClaim, domainID, applicationID), "Freddie Mercury", out FNOLHeader);
            }
            catch (System.Web.Services.Protocols.SoapException exSoap)
            {
                //GenericException.LogException(exSoap.InnerException, exSoap.Message);
                //throw new GenericException(exSoap.InnerException);
            }
            catch (Exception ex) { throw ex; }

            return FNOL;
        }
        static private string GetCoBrandingDirectory(Claim myClaim, int domainID, int applicationID)
        {
            string returnValue = string.Empty;

            try
            {
                //returnValue = myClaim.OrganizationRules[new RuleAccessor(200015, domainID, applicationID)].Params[0].ParamValue;
                return "some directory in the form c\\crapola\\stupidstuff\\etc\\etc\\etc";
            }
            catch
            {
                //do nothing
            }

            return returnValue;
        }
    }
    //Gets the cobranding directly, if none available return a zero-length string

    public class Claim
    {
        public Claim() {

         
        }
    }
}