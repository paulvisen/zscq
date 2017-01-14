using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using zscq.DataBase;

namespace zscq.Manage
{
    /// <summary>
    /// DelDownload 的摘要说明
    /// </summary>
    public class DelDownload : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int id = int.Parse(context.Request.QueryString["id"]);
            bool ret = DownloadDao.DeleteDownload(id);
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