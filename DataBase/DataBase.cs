using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace zscq.DataBase
{
    public class DataBase : IDisposable
    {
        public DataBase()
        {

        }

        private MySqlConnection con;

        #region 打开数据库连接
        /// <summary>
        /// 打开数据库连接.
        /// </summary>
        private void Open()
        {
            // 打开数据库连接
            if (con == null)
            {
                con = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
            }
            if (con.State == System.Data.ConnectionState.Closed)
            {
                con.Open();
            }         

        }
        #endregion

        #region  关闭连接
        /// <summary>
        /// 关闭数据库连接
        /// </summary>
        private void Close()
        {
            if (con != null)
                con.Close();
        }
        #endregion

        #region 释放数据库连接资源
        /// <summary>
        /// 释放资源
        /// </summary>
        public void Dispose()
        {
            // 确认连接是否已经关闭
            if (con != null)
            {
                con.Dispose();
                con = null;
            }
        }
        #endregion

        #region base
        public void ExecuteNonQueryOpen()
        {
            Open();
        }

        public int ExecuteNonQuery(string sql, params MySqlParameter[] parameters)
        {
            MySqlCommand cmd = con.CreateCommand();
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

        public void ExecuteQueryOpen()
        {
            Open();
        }

        public DataTable ExecuteQuery(string sql, params MySqlParameter[] parameters)
        {
            DataSet ds = new DataSet();
            using (MySqlCommand cmd = con.CreateCommand())
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

        public DataTable ExecuteQuery(string sql)
        {
            DataSet ds = new DataSet();
            using (MySqlCommand cmd = con.CreateCommand())
            {
                cmd.CommandText = sql;
                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                adapter.Fill(ds);
            }
            return ds.Tables[0];
        }

        public void ExecuteQueryClose()
        {
            Close();
        }

        public DataSet ExecuteQueryDS(string sql, params MySqlParameter[] parameters)
        {
            DataSet ds = new DataSet();
            using (MySqlCommand cmd = con.CreateCommand())
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

        public DataSet ExecuteQueryDS(string sql)
        {
            DataSet ds = new DataSet();
            using (MySqlCommand cmd = con.CreateCommand())
            {
                cmd.CommandText = sql;
                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                adapter.Fill(ds);
            }
            return ds;
        }

        #endregion

    }
}