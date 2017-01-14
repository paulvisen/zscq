using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using zscq.DataBase;
using System.Data;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
using Wuqi.Webdiyer;

namespace jyypt.TeamPres
{
    public partial class TeamRelateList : System.Web.UI.Page
    {
        public string strHref = null;
        DataTable dt = new DataTable();
        PagedDataSource pds = new PagedDataSource();
        protected void Page_Load(object sender, EventArgs e)
        {
            string dataType;//相关列表的类型
            int teamId = 1;//团队的id
            string teamTable;//团队所属表格
            string tempId = "1";
            int pagerows;
            dataType = "CGZS";
            teamTable = "keyanteaminfo";
            pagerows = 8;
            if (null != Request.QueryString["type"])
            {
                dataType = Request.QueryString["type"].ToString();
            }
            if (null != Request.QueryString["teamId"])
            {
                tempId = Request.QueryString["teamId"].ToString();
                int.TryParse(tempId, out teamId);
            }
            if (null != Request.QueryString["teamTable"])
            {
                teamTable = Request.QueryString["teamTable"].ToString();
            }
            dt = SelectData(dataType, teamId, teamTable);
            strHref = GetHref(dataType);
            pds.DataSource = dt.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = pagerows;
            AspNetPager1.RecordCount = pds.PageCount * pds.PageSize;
            AspNetPager1.PageSize = pds.PageSize;
        }
        protected string GetHref(string dataType)
        {
            string tempStr = null;
            if (dataType == "CGZS")
            {
                tempStr = "GainInfo.aspx?tid=";
            }
            else if (dataType == "ZJRC")
            {
                tempStr = "javascript:void(0);";
            }
            else if (dataType == "CGZR")
            {
                tempStr = "/aspx/jydt_list_details.aspx?cgid=";
            }
            else if (dataType == "CGXQ")
            {
                tempStr = "/aspx/jydt_list_details_xq.aspx?cgid=";
            }
            return tempStr;
        }

        protected void AspNetPager1_PageChanged1(object sender, EventArgs e)
        {
            pds.CurrentPageIndex = AspNetPager1.CurrentPageIndex - 1;//索引同步
            RpTeamRelateList.DataSource = pds;//数据绑定
            RpTeamRelateList.DataBind();
        }
        protected void RpTeamRelateList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            /*
                        if ( (e.Item.ItemIndex + 1) % 2 == 1 && (e.Item.ItemIndex + 1) > 1 )
                        {
                            e.Item.Controls.Add(new LiteralControl("</tr><tr border=’1px’ style=’border:1px; border-color:Red’>"));
                        }
            */
        }
        public DataTable SelectData(string dataType, int teamId, string teamType)
        {
            int i;
            DataBase SqlData = new DataBase();
            DataTable dt = new DataTable();
            string selStr = null;
            if (dataType == "all")
            {
                //               selStr = "select * from (select * from team_kjqyqtlx,team_gdyxkyys,team_fwjgzjjg as p)";
                //               selStr += " where p.rownum between " + ((page - 1) * rows + 1) + " and " + (page * rows);
            }
            else
            {
                if (dataType == "CGZS")//成果展示
                {
                    selStr = "select Id as colId,CGPicShow as colPict,CGName as colName,DATE_FORMAT(PublishTime,'%Y-%m-%d') as colcont1,Area as colcont2,CGIntroduction as colIntr from tuanduichengguo where PublisherType = '" + teamType.ToString() + "' and PublisherId = " + teamId;
                }
                else if (dataType == "ZJRC")//专家人才
                {
                    selStr = "select zhuanjiainfo.Id as colId,ZJPhoto as colPict,ZJName as colName,ZJTitle as colcont1,ResearchArea as colcont2,Research as colIntr " +
                    "from zhuanjiainfo, teamzjrelationship where teamzjrelationship.TeamId = " + teamId + " and " + "teamzjrelationship.TeamTable = '" + teamType + "' and zhuanjiainfo.Id = teamzjrelationship.ZhuanJiaId";
                }
                else if(dataType == "CGZR")//成果转让
                {
                    selStr = "select id as colId, substring(image_list,6) as colPict, CGName as colName, DATE_FORMAT(RegTime,'%Y-%m-%d') as colcont1,CGDetails as colIntr from chengguo where CGPubstate = 1";
                }
                else if(dataType == "CGXQ")//成果需求
                {
                    selStr = "select NeedID as colId, substring(image_list,3) as colPict, Name as colName, DATE_FORMAT(PubDate,'%Y-%m-%d') as colcont1,BriefIntro as colIntr from Need where PubState = 1";
                }
            }
            SqlData.ExecuteNonQueryOpen();
            DataSet dataset = new DataSet();
            dataset = SqlData.ExecuteQueryDS(selStr);
            SqlData.ExecuteNonQueryClose();
            dt = dataset.Tables[0];
            for (i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["colIntr"].ToString().Length > 110)
                {
                    dt.Rows[i]["colIntr"] = dt.Rows[i]["colIntr"].ToString().Substring(0, 110) + "...";
                }
            }
            return dt;
        }
    }
}