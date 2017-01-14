using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using zscq.BasicCode;
using zscq.DataBase;

namespace zscq.Views.News
{
    /// <summary>
    /// News1 的摘要说明
    /// </summary>
    public class News1 : AjaxBase
    {
        override public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/x-json";
            context.Response.Charset = "utf-8";

            int pageRows, page;
            pageRows = 8;
            page = 1;
            int type = -1;

            if (null != context.Request.QueryString["rows"])
                pageRows = int.Parse(context.Request.QueryString["rows"].ToString().Trim());
            if (null != context.Request.QueryString["page"])
                page = int.Parse(context.Request.QueryString["page"].ToString().Trim());
            if (null != context.Request.QueryString["type"])
                type = int.Parse(context.Request.QueryString["type"].ToString().Trim());

            DataTable dt = NewsDao.LoadNewsList(page, pageRows, type);
            if (dt != null)
            {
                int count = NewsDao.GetNewsListCount(type);
                string strJson = ToJson.DataTable2Json(dt, count);
                context.Response.Write(strJson);
                context.Response.End();
            }

        }
    }
}