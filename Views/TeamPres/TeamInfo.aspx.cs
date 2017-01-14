using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using zscq.DataBase;
using zscq.BasicCode;

namespace zscq.Views.TeamPres
{

    public partial class TeamInfo : WebBase
    {
        public int teamId = 1;
        public string teamTable = null;
        public DataTable dt = new DataTable();
        public teamInfoClass myteamInfoClass = new teamInfoClass();
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
            string tempID = null;
            string teamType = null;

            if (null != Request.QueryString["tid"])
            {
                tempID = Request.QueryString["tid"].ToString();
            }
            if (null != Request.QueryString["type"])
            {
                teamType = Request.QueryString["type"].ToString();
            }
            if (int.TryParse(tempID, out teamId))
            {
                dt = GetTeamInfoById(teamId, teamType);
                //FillContent(dt,myteamInfo);
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
        //protected void FillContent(DataTable dt, teamInfoClass team)
        //{
        //if (dt.Rows.Count > 0)
        //{
        //    team.name = dt.Rows[0]["Name"].ToString();
        //    team.field = dt.Rows[0]["Area"].ToString();
        //    team.intro = dt.Rows[0]["Introduce"].ToString();
        //    team.type = dt.Rows[0]["type"].ToString();
        //    team.addr = dt.Rows[0]["Address"].ToString();
        //    team.contPerson = dt.Rows[0]["ContactPerson"].ToString();
        //    team.contphone = dt.Rows[0]["ContactPhone"].ToString();
        //    team.contemail = dt.Rows[0]["Email"].ToString();
        //    team.numcg = "";
        //    team.numfbjy = "";
        //    team.numcgjy = "";
        //    team.numhp = "";
        //    team.numgzrs = "";
        //}
        //else 
        //{
        //    return;
        //}
        //}
        protected DataTable GetTeamInfoById(int teamId, string teamType)
        {
            DataBase.DataBase SqlData = new DataBase.DataBase();
            DataTable dt = new DataTable();
            string selStr = null;
            if (teamType == "科技企业" || teamType == "其他" || teamType == "kejiteaminfo")
            {
                selStr = "select * from kejiTeamInfo where Id = " + teamId;
                teamTable = "kejiteaminfo";
            }
            else if (teamType == "高等院校" || teamType == "科研院所" || teamType == "keyanteaminfo")
            {
                selStr = "select * from keyanTeamInfo where Id = " + teamId;
                teamTable = "keyanteaminfo";
            }
            else if (teamType == "服务机构" || teamType == "中介机构" || teamType == "fuwuteaminfo")
            {
                selStr = "select * from fuwuTeamInfo where Id = " + teamId;
                teamTable = "fuwuteaminfo";
            }
            SqlData.ExecuteNonQueryOpen();
            DataSet dataset = new DataSet();
            dataset = SqlData.ExecuteQueryDS(selStr);
            SqlData.ExecuteNonQueryClose();
            dt = dataset.Tables[0];
            return dt;
        }
    }
    public class teamInfoClass
    {
        public string numcg;
        public string numfbjy;
        public string numcgjy;
        public string numhp;
        public string numgzrs;
    }

}