using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.Models;
using zscq.BasicCode;
using zscq.DataBase;

namespace zscq.Views.News
{
    public partial class NewsDetail : WebBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = int.Parse( Request.QueryString["id"] );
            Models.News news = NewsDao.LoadNewsModel(id);
            if (news != null)
            {
                NewsTitle.InnerText = news.Title;
                PubDate.InnerText = news.PubDate.ToShortDateString();
                ReadTimes.InnerText = news.ReadTimes.ToString();
                Content.InnerHtml = HttpUtility.UrlDecode(news.MainContentRIA);
            }

            if (GetUserName() != null)
            {
                login_bar.Visible = false;
                username.InnerText = GetUserName();
            }
            else
            {
                user_bar.Visible = false;
            }
        }

        protected void Login(object sender, EventArgs e)
        {
            Login();
        }
    }
}