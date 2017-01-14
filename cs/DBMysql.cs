using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;
using System.Text;
using System.Text.RegularExpressions;

namespace zscq.cs
{
    public class DBMysql
    {
        private MySqlConnection connection;
        private static string conString = System.Configuration.ConfigurationManager.ConnectionStrings["ConStr"].ToString();//连接字符串
        private void Open(){
        //打开数据库连接
            if (connection == null){
                //实例化类 MySqlConnection
                connection = new MySqlConnection(conString);
            }
            if (connection.State == System.Data.ConnectionState.Closed) {
                //打开数据库
                connection.Open();
            }
        }
        private void Close() {
            //关闭数据库
            if (connection != null)
            {
                connection.Close();
            }
           
        }
        public void Dispose() { 
        //释放数据库连接资源
            if (connection != null) {
                connection.Dispose();
                connection = null;
            }
        }
        public void ExecuteNonQueryOpen()
        {
            Open();
        }
        public int ExecuteNonQuery(string sql, params MySqlParameter[] parameters)
        {
            MySqlCommand cmd = connection.CreateCommand();
            cmd.CommandText = sql;
            foreach (MySqlParameter parameter in parameters)
            {
                cmd.Parameters.Add(parameter);
            }
            return cmd.ExecuteNonQuery();
        }
        public void ExecuteNonQueryClose()
        {
            Close();
        }
        public void ExecuteQueryOpen() { 
            this.Open();
        }
        public void ExecuteQueryClose(){
            this.Close();
        }

        public DataTable ExecuteQuery(string sql, params MySqlParameter[] parameters)
        {
            DataSet ds = new DataSet();
            using (MySqlCommand cmd = connection.CreateCommand())
            {
                cmd.CommandText = sql;
                foreach (MySqlParameter parameter in parameters)
                {
                    cmd.Parameters.Add(parameter);
                }
                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                adapter.Fill(ds);
            }
            return ds.Tables[0];
        }

        public DataTable ExecuteQuery(string sql, List<MySqlParameter> parameters)
        {
            DataSet ds = new DataSet();
            using (MySqlCommand cmd = connection.CreateCommand())
            {
                cmd.CommandText = sql;
                foreach (MySqlParameter parameter in parameters)
                {
                    cmd.Parameters.Add(parameter);
                }
                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                adapter.Fill(ds);
            }
            return ds.Tables[0];
        }
        public static int ExecuteSql(string SQLString, params MySqlParameter[] cmdParms)
        {
            using (MySqlConnection connection = new MySqlConnection(conString))
            {

                using (MySqlCommand cmd = new MySqlCommand())
                {
                    try
                    {
                        PrepareCommand(cmd, connection, null, SQLString, cmdParms);
                        int rows = cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                        return rows;
                    }
                    catch (MySql.Data.MySqlClient.MySqlException e)
                    {
                        throw e;
                    }
                }
            }
        }
        private static void PrepareCommand(MySqlCommand cmd, MySqlConnection conn, MySqlTransaction trans, string cmdText, MySqlParameter[] cmdParms)
        {
            if (conn.State != ConnectionState.Open)
                conn.Open();
            cmd.Connection = conn;
            cmd.CommandText = cmdText;
            if (trans != null)
                cmd.Transaction = trans;
            cmd.CommandType = CommandType.Text;//cmdType;
            if (cmdParms != null)
            {


                foreach (MySqlParameter parameter in cmdParms)
                {
                    if ((parameter.Direction == ParameterDirection.InputOutput || parameter.Direction == ParameterDirection.Input) &&
                        (parameter.Value == null))
                    {
                        parameter.Value = DBNull.Value;
                    }
                    cmd.Parameters.Add(parameter);
                }
            }
        }
      


        public DataTable ExecuteQuery(string sql)
        {
            DataSet ds = new DataSet();
            using (MySqlCommand cmd = connection.CreateCommand())
            {
                cmd.CommandText = sql;
                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                adapter.Fill(ds);
            }
            return ds.Tables[0];
        }

         public DataSet ExecuteQueryDS(string sql, params MySqlParameter[] parameters)
        {
            DataSet ds = new DataSet();
            using (MySqlCommand cmd = connection.CreateCommand())
            {
                cmd.CommandText = sql;
                foreach (MySqlParameter parameter in parameters)
                {
                    cmd.Parameters.Add(parameter);
                }
                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                adapter.Fill(ds);
            }
            return ds;
        }

        public DataSet ExecuteQueryDS(string sql, List<MySqlParameter> parameters)
        {
            DataSet ds = new DataSet();
            using (MySqlCommand cmd = connection.CreateCommand())
            {
                cmd.CommandText = sql;
                foreach (MySqlParameter parameter in parameters)
                {
                    cmd.Parameters.Add(parameter);
                }
                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                adapter.Fill(ds);
            }
            return ds;
        }

        public DataSet ExecuteQueryds(string sql)
        {
            DataSet ds = new DataSet();
            using (MySqlCommand cmd = connection.CreateCommand())
            {
                cmd.CommandText = sql;
                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                adapter.Fill(ds);
            }
            return ds;
        }

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
            return json.ToString();
        }
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
        public static int DB2INT(object obj)
        {
            int ret = 0;
            try
            {
                ///如果不是NULL ，那么先强制转换，不行的话在用字符串作为中间变量
                if (!(obj is DBNull))
                {
                    try
                    {
                        ret = (int)obj;
                    }
                    catch
                    {
                        ret = int.Parse(obj.ToString());
                    }
                }
            }
            catch
            {
            }
            return ret;
        }




    }
}