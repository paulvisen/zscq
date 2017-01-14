using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using zscq.BasicCode;
using zscq.DataBase;

namespace zscq.Manage.Download
{
    public partial class DownloadFileManage : System.Web.UI.Page
    {
        enumOpType opType;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                opType = enumOpType.Edit;
                int id = int.Parse(Request.QueryString["id"]);
                ViewState["downloadID"] = id;
                downloadID.Value = ViewState["downloadID"].ToString();
                getData(id);
            }
            else
            {
                opType = enumOpType.Pub;
                if (!IsPostBack)
                {
                    int id = DownloadDao.CreateEmptyItem();
                    ViewState["downloadID"] = id;
                }
                downloadID.Value = ViewState["downloadID"].ToString();
                getData((int)ViewState["downloadID"]);
            }
        }

        public void getData(int id)
        {
            DataTable dtDownload = DownloadDao.GetDownloadOne(id);
            if (!IsPostBack)
            {
                DownloadTitle.Value = Tools.DB2ST(dtDownload.Rows[0]["Title"]);
                DownloadType.SelectedIndex = Tools.DB2INT(dtDownload.Rows[0]["Type"]) - 1;
            }
            DataTable dt = DownloadDao.GetFileInfo(id);
            grid.DataSource = dt;
            grid.DataBind();
        }

        protected void PubDownloadButton_Click(object sender, EventArgs e)
        {
            if(DownloadDao.UpdateDownload(int.Parse(downloadID.Value), DownloadTitle.Value, DownloadType.SelectedIndex + 1))
            {
                if (opType == enumOpType.Pub)
                {
                    Response.Write("<script>alert('发布成功');parent.location.href='/Manage/ManageMain.aspx#Download/DownloadManage.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('修改成功');parent.location.href='/Manage/ManageMain.aspx#Download/DownloadManage.aspx';</script>");
                }
                
            }
            else
            {
                if (opType == enumOpType.Pub)
                {
                    Response.Write("<script>alert('发布失败');</script>");
                }
                else
                {
                    Response.Write("<script>alert('修改失败');</script>");
                }
                
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            int id = (int)ViewState["downloadID"];
            if (opType == enumOpType.Pub)
            {
                DownloadDao.DeleteDownload(id);
            }
            else
            {
                DownloadDao.CancelUpdate(id);
            }
            Response.Write("<script>parent.location.href='/Manage/ManageMain.aspx#Download/DownloadManage.aspx';</script>");
        }
    }
}