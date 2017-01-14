using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using zscq.DataBase;

namespace zscq
{
    /// <summary>
    /// AddUser 的摘要说明
    /// </summary>
    public class AddUser : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            if (context.Request.QueryString["username"] == null || context.Request.QueryString["password"] == null)
            {
                return;
            }
            string username = context.Request.QueryString["username"];
            string password = context.Request.QueryString["password"];
            bool ret = UserDao.AddUser(username, password);
            context.Response.Write(ret.ToString());
            context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}