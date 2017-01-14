using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Configuration;

namespace zscq.BasicCode
{
    public class WebBase : System.Web.UI.Page
    {
        public static string GetUserName()
        {
            var username = HttpContext.Current.User.Identity.Name;
            return username == "" ? null : username;
        }

        public static void Login()
        {
            FormsAuthentication.RedirectToLoginPage();
        }

        public static void Logout()
        {
            if (GetUserName() != null)
            {
                HttpContext.Current.Request.Cookies.Remove(FormsAuthentication.FormsCookieName);
                HttpContext.Current.Session.Clear();

                HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName);
                cookie.Expires = DateTime.Now.AddMonths(-1);
                cookie.Domain = FormsAuthentication.CookieDomain;
                cookie.Path = FormsAuthentication.FormsCookiePath;
                HttpContext.Current.Response.Cookies.Add(cookie);

                string SignoutUrl = ConfigurationManager.AppSettings["CAS_HOST"] + "logout?service=" + HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Path);
                //StreamReader SignoutHttpReader = new StreamReader(new WebClient().OpenRead(SignoutUrl));
                //string SignOutResponse = SignoutHttpReader.ReadToEnd();
                //Response.Redirect("SSO.aspx");
                HttpContext.Current.Response.Redirect(SignoutUrl);
            }
        }
    }
}