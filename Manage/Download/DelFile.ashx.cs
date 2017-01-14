using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using zscq.DataBase;

namespace zscq.Manage.Download
{
    /// <summary>
    /// DelFile 的摘要说明
    /// </summary>
    public class DelFile : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int id = int.Parse(context.Request.QueryString["id"]);
            bool ret = DownloadDao.DeleteFile(id);
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