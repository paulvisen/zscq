using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
using zscq.DataBase;
using zscq.BasicCode;

namespace zscq.Views.TeamPres
{
    public partial class GainInfo : WebBase
    {
        public DataTable dt1 = new DataTable();
        public DataTable dt2 = new DataTable();
        public string tablename = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (GetUserName() != null)
            {
                login_bar.Visible = false;
                username.InnerText = GetUserName();
            }
            else
            {
                user_bar.Visible = false;
            }
            int gainId;
            string tempID = null;
            DataSet dataset = new DataSet();
            if (null != Request.QueryString["tid"])
            {
                tempID = Request.QueryString["tid"].ToString();
            }
            if (int.TryParse(tempID, out gainId))
            {
                dataset = GetGainInfoById(gainId);
                dt1 = dataset.Tables[0];
                dt2 = dataset.Tables[1];
                if (dt2.Rows[0]["Introduce"].ToString().Length > 100)
                {
                    dt2.Rows[0]["Introduce"] = dt2.Rows[0]["Introduce"].ToString().Substring(0, 100) + "...";
                }
            }
            else
            {
                return;
            }
        }
        protected void Login(object sender, EventArgs e)
        {
            Login();
        }

        protected DataSet GetGainInfoById(int thisId)
        {
            DataSet dataset1, dataset2 = new DataSet();
            DataTable dt1, dt2 = new DataTable();
            DataBase.DataBase SqlData = new DataBase.DataBase();
            string selStr = null;
            string teamId = null;
            selStr = "select PublisherType,PublisherId from tuanduichengguo where tuanduichengguo.Id = " + thisId;
            SqlData.ExecuteNonQueryOpen();
            dataset1 = SqlData.ExecuteQueryDS(selStr);
            dt1 = dataset1.Tables[0];
            tablename = dt1.Rows[0]["PublisherType"].ToString();
            teamId = dt1.Rows[0]["PublisherId"].ToString();
            selStr = "select * from tuanduichengguo where tuanduichengguo.Id = " + thisId + ";select Introduce,Id from " + tablename + " where " + tablename + ".Id = " + teamId;
            dataset2 = SqlData.ExecuteQueryDS(selStr);
            SqlData.ExecuteNonQueryClose();
            return dataset2;
        }
    }
}