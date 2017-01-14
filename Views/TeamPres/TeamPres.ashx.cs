using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Text;
using System.Text.RegularExpressions;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using MySql.Data.MySqlClient;
using zscq.DataBase;

namespace jyypt.TeamPres
{
    /// <summary>
    /// TeamPres1 的摘要说明
    /// </summary>
     
    public class TeamPres1 : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            string dataType;
            string jsonStr;
            //获取分页和排序信息：页大小，页码
            int pageRows, page;
            pageRows = 5;
            page = 1;            
            if (null != context.Request.QueryString["type"])
            {
                dataType = context.Request.QueryString["type"].ToString();
                if (null != context.Request.QueryString["rows"])
                    pageRows = int.Parse(context.Request.QueryString["rows"].ToString().Trim());
                if (null != context.Request.QueryString["page"])
                    page = int.Parse(context.Request.QueryString["page"].ToString().Trim());
                jsonStr = SelectData(dataType, pageRows, page);
                context.Response.ContentType = "text/plain";
                context.Response.Write(jsonStr);
            }  
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        protected string SelectData(string dataType,int rows,int page)
        {
            DataBase SqlData = new DataBase();
            DataSet dataset = new DataSet();
            DataTable dt = new DataTable();
            string selStr = null;
            SqlData.ExecuteNonQueryOpen();
            if (dataType == "GoodGain")
            {
                selStr = "select * from tuanduichengguo where IfExcellent = 1 order by publishTime limit 5";
            }
            else
            {
                return null;
            }
            dataset = SqlData.ExecuteQueryDS(selStr);
            SqlData.ExecuteNonQueryClose();
            dt = dataset.Tables[0];
            string strJson = DataTable2Json(dt, rows);
            return strJson;
        } 
        public static string DataTable2Json(DataTable dt, int total = -1)
        {
            StringBuilder json = new StringBuilder();
            int realTotal;
            realTotal = dt.Rows.Count > total ? dt.Rows.Count : total;
            //{"total":5,"rows":[  
            json.Append("{\"total\":");
            json.Append(dt.Rows.Count);
            json.Append(",\"rows\":[");
            for (int i = 0; i < realTotal; i++)
            {
                json.Append("{");
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    json.Append("\"");
                    json.Append(dt.Columns[j].ColumnName);
                    json.Append("\":\"");
                    //切记要替换换行符，不然会破坏JSON格式，无法显示
                    string str = Regex.Replace(dt.Rows[i][j].ToString(), @"[\r\n]", "");
                    str = Regex.Replace(str, "\"", "\\\"");//这边是添加上去的
                    json.Append(str.Trim());
                    json.Append("\",");
                }
                if (dt.Columns.Count > 0)
                {
                    json.Remove(json.Length - 1, 1);  //去掉多于的逗号
                }
                json.Append("},");
            }
            if (dt.Rows.Count > 0)
            {
                json.Remove(json.Length - 1, 1);
            }
            json.Append("]}");
            return json.ToString();
        }
    }
}