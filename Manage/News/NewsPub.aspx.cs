using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.Models;
using zscq.BasicCode;
using zscq.DataBase;

namespace zscq.Manage
{
    public partial class NewsPub : System.Web.UI.Page
    {
        enumOpType opType;
        News news = new News();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                opType = enumOpType.Edit;
                news.NewsID = int.Parse(Request.QueryString["id"]);
                news = NewsDao.LoadNewsModel(news.NewsID);
                if (!IsPostBack)
                {
                    hideria.Value = news.MainContentRIA;
                    hidetext.Value = news.MainContentText;
                    hideurl.Value = news.TopPicUrl;
                    NewsTitle.Value = news.Title;
                    NewsType.SelectedIndex = (int)news.SubType - 1;
                }
            }
            else
            {
                opType = enumOpType.Pub;
            }
        }

        protected void PubNewsButton_Click(object sender, EventArgs e)
        {
            news.Title = NewsTitle.Value;
            news.MainContentRIA = hideria.Value;
            news.MainContentText = hidetext.Value;
            news.SubType = (enumNewsType)NewsType.SelectedIndex + 1;
            news.OnTop = ApplyForTop.Checked;
            if (news.OnTop)
            {
                news.TopPicUrl = hideurl.Value;
            }
            else
            {
                news.TopPicUrl = "";
            }

            if (opType == enumOpType.Pub)
            {
                news.PubDate = DateTime.Now;
                if (NewsDao.PubNews(news))
                {
                    Response.Write("<script>alert('发布成功');parent.location.href='/Manage/ManageMain.aspx#News/NewsManage.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('发布失败');</script>");
                }
            }
            else if (opType == enumOpType.Edit)
            {
                if (NewsDao.UpdateNews(news))
                {
                    Response.Write("<script>alert('修改成功');parent.location.href='/Manage/ManageMain.aspx#News/NewsManage.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('修改失败');</script>");
                }
            }
        }
    }
}