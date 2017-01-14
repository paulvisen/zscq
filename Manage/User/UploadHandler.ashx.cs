using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace zscq.Manage.User
{
    /// <summary>
    /// UploadHandler 的摘要说明
    /// </summary>
    public class UploadHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            HttpPostedFile file = context.Request.Files["Filedata"];
            string type = context.Request.Form["type"];
            string uploadPath = "";
            switch (type)
            {
                case "frontIdentifyCard":
                    uploadPath = "/Pics/personal/FrontIdentifyCard/";
                    break;
                case "backIdentifyCard":
                    uploadPath = "/Pics/personal/BackIdentifyCard/";
                    break;
                case "license":
                    uploadPath = "/Pics/company/";
                    break;
                case "expertPhoto":
                    uploadPath = "/Pics/expert/";
                    break;
                default:
                    return;
            }
            string absoluteUploadPath = context.Request.MapPath(uploadPath);
            if (file != null)
            {
                if (!System.IO.Directory.Exists(absoluteUploadPath))
                {
                    System.IO.Directory.CreateDirectory(absoluteUploadPath);
                }
                string filename = DateTime.Now.Date.ToString("yyyyMMdd") + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString();
                file.SaveAs(absoluteUploadPath + filename + file.FileName);
                context.Response.Write(uploadPath + filename + file.FileName);
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