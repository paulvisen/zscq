using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using zscq.DataBase;
using zscq.BasicCode;

namespace zscq.Views.Downloads
{
    /// <summary>
    /// Download 的摘要说明
    /// </summary>
    public class Downloads1 : AjaxBase
    {

        public override void ProcessRequest(HttpContext context)
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
                type = int.Parse(context.Request.QueryString["type"]);

            DataTable dt = DownloadDao.GetDownloadList(page, pageRows, type);
            if (dt != null)
            {
                int count = DownloadDao.GetDownloadListCount(type);
                string strJson = ToJson.DataTable2Json(dt, count);
                context.Response.Write(strJson);
                context.Response.End();
            }
        }
    }
}