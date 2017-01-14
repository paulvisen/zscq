using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using zscq.cs;
using System.Data;
using System.Web.Script.Serialization;
using System.Collections;
using System.Text;
using System.Text.RegularExpressions;

namespace cgjy.ashx
{
    /// <summary>
    /// xxjy_details 的摘要说明
    /// </summary>
    public class xxjy_details : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/x-json";
            context.Response.Charset = "utf-8";
            HttpRequest request = System.Web.HttpContext.Current.Request;
            Uri dsd = request.UrlReferrer;
            string a1 = dsd.Query;
            int xxjy_id0 = Int32.Parse(a1.Substring(8));
            //string xxjy_id = context.Request.Url.Query[0].ToString();
            //int xxjy_id0 = int.Parse(context.Request["xxjyid"]);
           
            DataTable dt = DB.xxjy_LoadAll(xxjy_id0);
            if (dt != null) {
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
        private string Dtb2Json(DataTable dtb)
        {
            JavaScriptSerializer jss = new JavaScriptSerializer();
            ArrayList dic = new ArrayList();
            foreach (DataRow row in dtb.Rows)
            {
                Dictionary<string, object> drow = new Dictionary<string, object>();
                foreach (DataColumn col in dtb.Columns)
                {
                    drow.Add(col.ColumnName, row[col.ColumnName]);
                }
                dic.Add(drow);
            }
            return jss.Serialize(dic);
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