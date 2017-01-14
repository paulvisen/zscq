using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Net;
using System.IO;
using System.Xml;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
using System.Configuration;

namespace zscq
{
    public partial class SSO : System.Web.UI.Page
    {
        //CAS 身份验证 服务器地址  
        private string CASHOST = ConfigurationManager.AppSettings["CAS_HOST"];

        internal static bool CheckValidationResult(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors errors)
        {
            return true;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //添加信任服务器证书
            ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(CheckValidationResult);

            // Look for the "ticket=" after the "?" in the URL
            string AuthorisationTicket = Request.QueryString["ticket"];

            // This page is the CAS service=, but discard any query string residue
            
            string UrlToAuthenticate = Request.Url.GetLeftPart(UriPartial.Path);

            // First time through there is no ticket=, so redirect to CAS login
            if (AuthorisationTicket == null || AuthorisationTicket.Length == 0)
            {
                Session["ReturnUrl"] = Request.QueryString["ReturnUrl"];
                string SignonUrl = CASHOST + "login?" + "service=" + UrlToAuthenticate;
                Response.Redirect(SignonUrl);
                return;
            }

            // Second time (back from CAS) there is a ticket= to validate
            string ValidateSignonUrl = CASHOST + "serviceValidate?" + "ticket=" + AuthorisationTicket + "&" + "service=" + UrlToAuthenticate;
            StreamReader ValidateSignonHttpReader = new StreamReader(new WebClient().OpenRead(ValidateSignonUrl));

            string ValidateSignonResponse = ValidateSignonHttpReader.ReadToEnd();

            NameTable XmlNT = new NameTable();
            XmlNamespaceManager XmlNSManager = new XmlNamespaceManager(XmlNT);
            XmlParserContext XmlParser = new XmlParserContext(null, XmlNSManager, null, XmlSpace.None);
            XmlTextReader XmlResponseReader = new XmlTextReader(ValidateSignonResponse, XmlNodeType.Element, XmlParser);

            string SSOUsername = null;

            // A very dumb use of XML. Just scan for the "user". If it isn't there, its an error.
            while (XmlResponseReader.Read())
            {
                if (XmlResponseReader.IsStartElement())
                {
                    string XmlTag = XmlResponseReader.LocalName;
                    if (XmlTag == "user")
                    {
                        SSOUsername = XmlResponseReader.ReadString();
                    }
                }
            }
            XmlResponseReader.Close();

            if (SSOUsername == null)
            {
            }
            else
            {
                Session["UserName"] = SSOUsername;
                if (Session["ReturnUrl"] != null)
                {
                    string returnUrl = Session["ReturnUrl"].ToString();
                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(SSOUsername, false, 30);
                    string eTicket = FormsAuthentication.Encrypt(ticket);
                    HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, eTicket);
                    //cookie.Expires = DateTime.Now.AddMinutes(30);
                    Response.Cookies.Add(cookie);
                    Response.Redirect(returnUrl);
                }
                else
                {
                    FormsAuthentication.RedirectFromLoginPage(SSOUsername, false);
                }
            }        
        }
    }
}