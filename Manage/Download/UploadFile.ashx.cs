using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using zscq.DataBase;

namespace zscq.Manage.Download
{
    /// <summary>
    /// UploadFile 的摘要说明
    /// </summary>
    public class UploadFile : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/x-json";
            HttpFileCollection files = context.Request.Files;
            string fileDescription = context.Request.Form["fileDescription"].ToString();
            int downloadID = int.Parse(context.Request.Form["downloadID"]);
            if (files.Count > 0)
            {
                int fileID = DownloadDao.UploadFile(files[0], fileDescription, downloadID);
                context.Response.Write("#" + fileID + "#");
                context.Response.End();
            }
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