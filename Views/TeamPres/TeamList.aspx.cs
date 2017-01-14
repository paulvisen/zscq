using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using zscq.DataBase;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using MySql.Data.MySqlClient;
using Wuqi.Webdiyer;

namespace jyypt.TeamPres
{
    public partial class TeamList : System.Web.UI.Page
    {
        string dataType = "kjqyTeam";
        DataTable dt = new DataTable();
        PagedDataSource pds = new PagedDataSource();
        protected void Page_Load(object sender, EventArgs e)
        {
            //页大小，页码
            int pageRows, page;
            pageRows = 5;
            page = 1;
            string sflag = "0";
            string region = null;
            string keyword = null;
            if (null != Request.QueryString["sflag"])
            {
                sflag = Request.QueryString["sflag"].ToString();

            }
            if (null != Request.QueryString["teamType"])
            {
                dataType = Request.QueryString["teamType"].ToString();
            }
            dt = SelectData(sflag);
            pds.DataSource = dt.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = pageRows;
            AspNetPager1.RecordCount = pds.PageCount * pds.PageSize;
            AspNetPager1.PageSize = pds.PageSize;
            if (!IsPostBack)
            {
                RpTeamlist.DataSource = pds;
                RpTeamlist.DataBind();
            }
        }
        protected void AspNetPager1_PageChanged1(object sender, EventArgs e)
        {
            pds.CurrentPageIndex = AspNetPager1.CurrentPageIndex - 1;//索引同步
            RpTeamlist.DataSource = pds;//数据绑定
            RpTeamlist.DataBind();
        }
        protected void RpTeamlist_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            //判断里层repeater处于外层repeater的哪个位置
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater rep = e.Item.FindControl("RpGainlist") as Repeater;//找到里层的repeater对象
                DataRowView rowv = (DataRowView)e.Item.DataItem;//找到分类Repeater关联的数据项 
                int teamid = Convert.ToInt32(rowv["Id"]); //获取填充子类的id
                rep.DataSource = GetGainByTeamid(teamid);
                rep.DataBind();
            }
        }
        public DataTable SelectData(string thissflag)
        {
            int i;
            DataBase SqlData = new DataBase();
            DataTable dt = new DataTable();
            string selStr = null;
            if (dataType == "all")
            {
                //selStr = "select * from (select * from team_kjqyqtlx,team_gdyxkyys,team_fwjgzjjg as p)";
            }
            else
            {
                if (dataType == "kjqyTeam")
                {
                    selStr = "select * from kejiteaminfo where Type ='科技企业'";
                }
                else if (dataType == "gdyxTeam")
                {
                    selStr = "select * from keyanteaminfo where Type ='高等院校'";
                }
                else if (dataType == "kyysTeam")
                {
                    selStr = "select * from keyanteaminfo where Type ='科研院所'";
                }
                else if (dataType == "fwjgTeam")
                {
                    selStr = "select * from fuwuteaminfo where Type ='中介机构'";
                }
                else if (dataType == "qtlxTeam")
                {
                    selStr = "select * from kejiteaminfo where Type ='其他'";
                }
            }
            if (thissflag == "1")
            {
                //                selStr += " and "; 
            }

            SqlData.ExecuteNonQueryOpen();
            DataSet dataset = new DataSet();
            dataset = SqlData.ExecuteQueryDS(selStr);
            SqlData.ExecuteNonQueryClose();
            dt = dataset.Tables[0];
            for (i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["Introduce"].ToString().Length > 100)
                {
                    dt.Rows[i]["Introduce"] = dt.Rows[i]["Introduce"].ToString().Substring(0, 100) + "...";
                }
            }
            return dt;
        }

        protected DataTable GetGainByTeamid(int teamId)
        {
            DataBase SqlData = new DataBase();
            DataTable dt = new DataTable();
            string selStr = null;
            if (dataType == "kjqyTeam")
            {
                selStr = "select * from tuanduichengguo where publishertype = 'kejiTeamInfo' and PublisherId = " + teamId;
            }
            else if (dataType == "gdyxTeam")
            {
                selStr = "select * from tuanduichengguo where publishertype = 'keyanTeamInfo' and PublisherId = " + teamId;
            }
            else if (dataType == "kyysTeam")
            {
                selStr = "select * from tuanduichengguo where publishertype = 'keyanTeamInfo' and PublisherId = " + teamId;
            }
            else if (dataType == "fwjgTeam")
            {
                selStr = "select * from tuanduichengguo where publishertype = 'fuwuTeamInfo' and PublisherId = " + teamId;
            }
            else if (dataType == "qtlxTeam")
            {
                selStr = "select * from tuanduichengguo where publishertype = 'kejiTeamInfo' and PublisherId = " + teamId;
            }
            selStr += " limit 5";
            SqlData.ExecuteNonQueryOpen();
            DataSet dataset = new DataSet();
            dataset = SqlData.ExecuteQueryDS(selStr);
            SqlData.ExecuteNonQueryClose();
            dt = dataset.Tables[0];
            return dt;
        }
    }
}