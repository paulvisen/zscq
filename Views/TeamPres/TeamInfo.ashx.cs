using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using zscq.BasicCode;
using zscq.DataBase;

namespace jyypt.TeamPres
{
    /// <summary>
    /// TeamInfo1 的摘要说明
    /// </summary>
    
    public class TeamInfo1 : IHttpHandler
    {
        int tid = 0;  
        public void ProcessRequest(HttpContext context)
        {
            string temp = context.Request.QueryString["tid"];
            if (temp == null)
            {
                return;
            }
            if (int.TryParse(temp, out tid))
            {
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();
                DataTable dt = db.ExecuteQuery("select * from teaminfo where TeamID = " + tid);
                if (dt != null)
                {
                    string strJson = ToJson.DataTable2Json(dt);
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(strJson);
                }
            }
            else
            {
                return;
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