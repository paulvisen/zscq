using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using zscq.DataBase;
using zscq.BasicCode;

namespace zscq.Views.Downloads
{
    public partial class DownloadDetail : WebBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                int id = int.Parse(Request.QueryString["id"]);
                DataTable dt = DownloadDao.GetDownloadOne(id);
                DownloadTitle.InnerText = Tools.DB2ST(dt.Rows[0]["Title"]);
                PubDate.InnerText = Tools.DB2ST(dt.Rows[0]["PubDate"]);
                DownloadType.InnerText = Tools.EnumToString((enumDownloadType)Tools.DB2INT(dt.Rows[0]["Type"]));

                dt = DownloadDao.GetFileInfo(id);
                DownloadContent.DataSource = dt;
                DownloadContent.DataBind();

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
            
        }

        protected void Login(object sender, EventArgs e)
        {
            Login();
        }

        //protected void OpenDirectlyButton_Click(object sender, ImageClickEventArgs e)
        //{
        //    Response.Clear();
        //    //Response.ContentType = "APPLICATION/OCTET-STREAM";
        //    Response.BinaryWrite(FileData);
        //    Response.End();
        //}

        protected void DownloadContent_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                DataTable dt = DownloadDao.DownloadFile(int.Parse(e.CommandArgument.ToString()));
                byte[] FileData = (byte[])dt.Rows[0]["FileData"];
                Response.Clear();
                Response.ContentType = "APPLICATION/OCTET-STREAM";
                Response.AddHeader("Content-Disposition", "attachment;filename=" +
                    HttpUtility.UrlEncode(Tools.DB2ST(dt.Rows[0]["FileName"]), System.Text.Encoding.UTF8));
                Response.BinaryWrite(FileData);
                Response.End();
            }
        }
    }
}