using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using zscq.DataBase;
using zscq.BasicCode;

namespace zscq.Views.TeamPres
{
    /// <summary>
    /// TeamChengguo 的摘要说明
    /// </summary>
    public class TeamAchievement : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/x-json";
            context.Response.Charset = "utf-8";

            int page = 1;
            int pageRows = 10;

            if (context.Request.QueryString["page"] != null)
            {
                page = int.Parse(context.Request.QueryString["page"]);
            }
            if (context.Request.QueryString["rows"] != null)
            {
                pageRows = int.Parse(context.Request.QueryString["rows"]);
            }

            DataTable dt = TeamDao.GetTeamAchievementList(page, pageRows);
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