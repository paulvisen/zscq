using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Script.Serialization;
using System.Collections;

namespace cgjy.ashx
{
    /// <summary>
    /// xxjy 的摘要说明
    /// </summary>
    public class xxjy : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            context.Response.ContentType = "application/x-json";
            context.Response.Charset = "utf-8";
            int type = 1;

            if (!CheckUrlRefer(context))
                return;

            if (null != context.Request.Form["type"])
                type = int.Parse(context.Request.Form["type"].ToString().Trim());
            if (null != context.Request.QueryString["type"])
                type = int.Parse(context.Request.QueryString["type"].ToString().Trim());

            switch (type)
            {
                case 1:
                    {//获取
                        //================================================================  
                        //获取分页和排序信息：页大小，页码，排序方式，排序字段  
                        int pageRows, page;
                        pageRows = 7;
                        page = 1;
                        if (null != context.Request.QueryString["rows"])
                            pageRows = int.Parse(context.Request.QueryString["rows"].ToString().Trim());
                        if (null != context.Request.QueryString["page"])
                            page = int.Parse(context.Request.QueryString["page"].ToString().Trim());

                        DataTable dt = zscq.cs.DB.xxjy_Loadlist((page - 1) * pageRows, page * pageRows);
                        if (dt != null)
                        {
                            int count = zscq.cs.DB.xxjy_Loadlist_Count();
                            string strJson = zscq.cs.DBMysql.DataTable2Json(dt, count);
                            context.Response.Write(strJson);//返回给前台页面  
                            context.Response.End();
                        }



                        break;
                    }
            }
                    

                    
            }



        protected bool CheckUrlRefer(HttpContext context)
        {

            if (System.Configuration.ConfigurationManager.AppSettings["CheckUrlRefer"] != null &&
                System.Configuration.ConfigurationManager.AppSettings["CheckUrlRefer"].ToString() == "1")
            {
                return context.Request.UrlReferrer.AbsolutePath.ToString().Replace("aspx", "ashx").ToLower() == context.Request.Url.AbsolutePath.ToString().ToLower();
            }
            else
                return true;
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