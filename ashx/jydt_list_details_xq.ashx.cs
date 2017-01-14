using zscq.cs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace cgjy.ashx
{
    /// <summary>
    /// jydt_list_details_xq 的摘要说明
    /// </summary>
    public class jydt_list_details_xq : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/x-json";
            context.Response.Charset = "utf-8";
            HttpRequest request = System.Web.HttpContext.Current.Request;
            Uri dsd = request.UrlReferrer;
            string a1 = dsd.Query;
            //substring里面的参数要修改为？开始id所在位置的索引
            int cgid = Int32.Parse(a1.Substring(6));
            //string xxjy_id = context.Request.Url.Query[0].ToString();
            //int xxjy_id0 = int.Parse(context.Request["xxjyid"]);

            DataTable dt = DB.chengguo_LoadAll_xq(cgid);
            if (dt != null)
            {
                //string strJson = DBMysql.DataTable2Json(dt);
                string strJson = InnerDataTable2Json(dt);
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
        private static string InnerDataTable2Json(DataTable dt)
        {
            StringBuilder jsonBuilder = new StringBuilder();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                jsonBuilder.Append("{");
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    jsonBuilder.Append("\"");
                    jsonBuilder.Append(dt.Columns[j].ColumnName);
                    jsonBuilder.Append("\":\"");
                    //切记要替换换行符，不然会破坏JSON格式，无法显示
                    string str = Regex.Replace(dt.Rows[i][j].ToString(), @"[\r\n]", "");
                    str = Regex.Replace(str, "\"", "\\\"");//这边是添加上去的
                    jsonBuilder.Append(str.Trim());
                    jsonBuilder.Append("\",");
                }
                if (dt.Columns.Count > 0)
                {
                    jsonBuilder.Remove(jsonBuilder.Length - 1, 1);
                }
                jsonBuilder.Append("},");
            }
            if (dt.Rows.Count > 0)
            {
                jsonBuilder.Remove(jsonBuilder.Length - 1, 1);
            }

            return jsonBuilder.ToString();
        }
    }
}