using System;
using System.Data;
using System.Text;
using System.Web;
using System.Text.RegularExpressions;

namespace zscq.BasicCode
{
    public class ToJson
    {
        public static string Null2Json()
        {
            return "{\"total\":\"-1\",\"rows\":[{}]}";
        }

        /// <summary>  
        /// DataSet转换成Json格式    
        /// </summary>    
        /// <param name="ds">DataSet</param>   
        /// <returns></returns>    
        public static string Dataset2Json(DataSet ds, int total = -1)
        {
            StringBuilder json = new StringBuilder();

            foreach (DataTable dt in ds.Tables)
            {
                //{"total":5,"rows":[  
                json.Append("{\"total\":");
                if (total == -1)
                {
                    json.Append(dt.Rows.Count);
                }
                else
                {
                    json.Append(total);
                }
                json.Append(",\"rows\":[");
                json.Append(InnerDataTable2Json(dt));
                json.Append("]}");
            } return json.ToString();
        }

        public static string DataTable2Json(DataTable dt, int total = -1)
        {
            StringBuilder json = new StringBuilder();
            json.Append("{\"total\":");
            if (total == -1)
            {
                json.Append(dt.Rows.Count);
            }
            else
            {
                json.Append(total);
            }
            json.Append(",\"rows\":[");
            json.Append(InnerDataTable2Json(dt));
            json.Append("]}");
            return json.ToString();
        }

        /// <summary>    
        /// dataTable转换成Json格式    
        /// </summary>    
        /// <param name="dt"></param>    
        /// <returns></returns>    
        protected static string InnerDataTable2Json(DataTable dt)
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