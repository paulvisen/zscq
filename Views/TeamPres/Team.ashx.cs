using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using zscq.BasicCode;
using zscq.DataBase;

namespace zscq.Views.TeamPres
{
    /// <summary>
    /// Team 的摘要说明
    /// </summary>
    public class Team : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/x-json";
            context.Response.Charset = "utf-8";

            int pageRows, page;
            pageRows = 6;
            page = 1;
            int type = 1;

            if (context.Request.QueryString["rows"] != null)
            {
                pageRows = int.Parse(context.Request.QueryString["rows"].ToString().Trim());
            }
            if (context.Request.QueryString["page"] != null)
            {
                page = int.Parse(context.Request.QueryString["page"].ToString().Trim());
            }
            if (context.Request.QueryString["type"] != null)
            {
                type = int.Parse(context.Request.QueryString["type"].ToString().Trim());
            }

            DataTable dt = new DataTable();
            if (type == 1)
            {
                dt = TeamDao.GetKejiTeamList(page, pageRows);
            }
            else if (type == 2)
            {
                dt = TeamDao.GetKeyanTeamList(page, pageRows);
            }
            else if (type == 3)
            {
                dt = TeamDao.GetFuwuTeamList(page, pageRows);
            }

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