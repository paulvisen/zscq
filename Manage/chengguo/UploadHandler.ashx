<%@ WebHandler Language="C#" Class="UploadHandler" %>

using System;
using System.Web;

public class UploadHandler : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        //http://www.cnblogs.com/babycool/
        //接收上传后的文件
        HttpPostedFile file = context.Request.Files["Filedata"];
        //string fileTitle = context.Request["fileTitle"]; 
        //其他参数
        //string somekey = context.Request["someKey"];
        //string other = context.Request["someOtherKey"];
        //获取文件的保存路径
        string uploadPath = HttpContext.Current.Request.MapPath("/images/upload/");
            //HttpContext.Current.Server.MapPath("Manage\\files\\Image\\");
        
        //判断上传的文件是否为空
        if (file != null)
        {
            if (!System.IO.Directory.Exists(uploadPath))
            {
                System.IO.Directory.CreateDirectory(uploadPath);
            }
            //保存文件
            string filename = DateTime.Now.Date.ToString("yyyyMMdd") + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString();
            file.SaveAs(uploadPath + filename + file.FileName);
            context.Response.Write("../../images/upload/" + filename + file.FileName);
        }
        else
        {
            context.Response.Write("0");
        }

    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}