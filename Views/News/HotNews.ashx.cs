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
    /// HotNews 的摘要说明
    /// </summary>
    public class HotNews : AjaxBase
    {

        public override void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/x-json";
            context.Response.Charset = "utf-8";

            int count = 2;

            if(null != context.Request.QueryString["count"]){
                count = int.Parse(context.Request.QueryString["count"].ToString().Trim());
            }

            DataTable dt = NewsDao.GetHotNews(count);
            if (dt != null)
            {
                string strJson = ToJson.DataTable2Json(dt, count);
                context.Response.Write(strJson);
                context.Response.End();
            }
        }
    }
}