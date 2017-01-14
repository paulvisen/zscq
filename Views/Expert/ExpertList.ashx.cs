using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using zscq.DataBase;
using zscq.BasicCode;

namespace zscq.Views.Expert
{
    /// <summary>
    /// ExpertList 的摘要说明
    /// </summary>
    public class ExpertList : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/x-json";
            context.Response.Charset = "utf-8";

            int pageRows = 5;
            int page = 1;

            if (context.Request.QueryString["page"] != null)
            {
                page = int.Parse(context.Request.QueryString["page"].ToString().Trim());
            }
            if (context.Request.QueryString["rows"] != null)
            {
                pageRows = int.Parse(context.Request.QueryString["rows"].ToString().Trim());
            }

            DataTable dt = ExpertDao.GetExpertList(page, pageRows);
            if (dt != null)
            {
                string strJson = ToJson.DataTable2Json(dt);
                context.Response.Write(strJson);
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