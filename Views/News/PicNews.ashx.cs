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
    /// PicNews 的摘要说明
    /// </summary>
    public class PicNews : AjaxBase
    {

        public override void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/x-json";
            context.Response.Charset = "utf-8";

            DataTable dt = NewsDao.LoadPicNews();
            if (dt != null)
            {
                string strJson = ToJson.DataTable2Json(dt);
                strJson = strJson.Replace("PNWURL", "url").Replace("PNWPIC", "src").Replace("PNWTitle", "captain");
                context.Response.Write(strJson);
                context.Response.End();
            }
        }
    }
}