using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using zscq.BasicCode;
using zscq.DataBase;

namespace zscq.Views.TeamPres
{

    public partial class TeamPres : WebBase
    {
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

            DataSet dsgain = new DataSet();
            dsgain = GetNewAndGoodGain();
            Repeater1.DataSource = dsgain.Tables[0];
            Repeater1.DataBind();
            if (!IsPostBack)
            {
                divGoodGain.InnerHtml = GoodGainLoad(dsgain.Tables[1]);
            }
        }
        protected void Login(object sender, EventArgs e)
        {
            Login();
        }

        protected DataSet GetNewAndGoodGain()
        {
            DataBase.DataBase SqlData = new DataBase.DataBase();
            DataSet dataset = new DataSet();
            DataTable dt = new DataTable();
            string selStr = "select * from tuanduichengguo order by publishTime limit 8;select * from tuanduichengguo where IfExcellent = 1 order by publishTime limit 5";
            SqlData.ExecuteNonQueryOpen();
            dataset = SqlData.ExecuteQueryDS(selStr);
            SqlData.ExecuteNonQueryClose();
            return dataset;
        }
        public string GoodGainLoad(DataTable dt)
        {
            string str = string.Empty;
            string strIndicator = string.Empty;
            string strImg = string.Empty;
            if (dt != null && dt.Rows.Count > 0)
            {
                int i, num;
                num = (dt.Rows.Count >= 5 ? 5 : dt.Rows.Count);
                for (i = 0; i < num; i++)
                {
                    if (i == 0)
                    {
                        strIndicator += " <li data-target=\"#carousel_example_generic\" data-slide-to=" + i + "class=\"active\"></li>";
                        strImg += "<div class=\"item active\">  <img style=\"width:100%; height:100%;\" src=\"" + dt.Rows[i]["CGPicShow"].ToString() + "\"/> </div>";
                    }
                    else
                    {
                        strIndicator += " <li data-target=\"#carousel_example_generic\" data-slide-to=" + i + "></li>";
                        strImg += "<div class=\"item \"> <img style=\"width:100%; height:100%;\" src=\"" + dt.Rows[i]["CGPicShow"].ToString() + "\"/> </div>";
                    }
                }
                str += "<div id=\"carousel_example_generic\" class=\"carousel\"data-interval=\"3000\" data-ride=\"carousel\">" +
                            "<ol class=\"carousel-indicators\">" +
                             strIndicator +
                            "</ol>" +
                            "<div class=\"carousel-inner\"style=\" width:470px; height:100%;\">" +
                             strImg +
                            "</div>" +
                            "<a class=\"left carousel-control\" href=\"#carousel_example_generic\" role=\"button\" data-slide=\"prev\">" +
                            "<span class=\"glyphicon glyphicon-chevron-left\"></span>" +
                            "</a>" +
                            "<a class=\"right carousel-control\" href=\"#carousel_example_generic\" role=\"button\" data-slide=\"next\">" +
                            "<span class=\"glyphicon glyphicon-chevron-right\"></span>" +
                            "</a>" +
                        "</div>" +
                "<h1>优秀成果展播</h1>" +
                "<hr /> " +
                "<ul>" +
                "<li id=\"liName\">" + "<a href=\"#\">" + dt.Rows[0]["CGName"].ToString() + "</a>" + "</li>" +
                "</ul>" +
                "<h2 id=\"h2Author\">发布者：" + dt.Rows[0]["PublisherName"].ToString() + "</h2>" +
                "<p id=\"pGainIntro\">" + dt.Rows[0]["CGIntroduction"].ToString() + "</p>" +
                "<script></script>";
            }
            return str;

        }
    }
}