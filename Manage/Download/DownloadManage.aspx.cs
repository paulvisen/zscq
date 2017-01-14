using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using zscq.BasicCode;
using zscq.DataBase;

namespace zscq.Manage
{
    public partial class DownloadManage : WebBase
    {
        private int rowCount = 10;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getData();
            }
        }

        public void getData()
        {
            int pageIndex;
            if (ViewState["pageIndex"] == null)
            {
                pageIndex = 1;
                ViewState["pageIndex"] = 1;
            }
            else
            {
                pageIndex = Convert.ToInt32(ViewState["pageIndex"]);
            }

            string sqlWhere = "";
            if (ViewState["sqlWhere"] != null)
            {
                sqlWhere = ViewState["sqlWhere"].ToString();
            }

            DataTable dt = DownloadDao.GetDownloadList(pageIndex, rowCount, -1, sqlWhere);
            if (dt != null)
            {
                grid.DataSource = dt;
                grid.DataBind();
                int count = DownloadDao.GetDownloadListCount(-1, sqlWhere);
                lbRowCount.Text = count.ToString();
                ViewState["dataCount"] = count;

                PageIndex.Text = pageIndex.ToString();
                lbPageCount.Text = ((int)Math.Ceiling((double)count / (double)rowCount)).ToString();

                if (pageIndex == 1)
                {
                    btnPreviousPage.Enabled = false;
                }
                else
                {
                    btnPreviousPage.Enabled = true;
                }

                if (pageIndex == (int)Math.Ceiling((double)Convert.ToInt32(ViewState["dataCount"]) / (double)rowCount))
                {
                    btnNextPage.Enabled = false;
                }
                else
                {
                    btnNextPage.Enabled = true;
                }
            }

        }

        protected void btnPageChange_Click(object sender, EventArgs e)
        {
            try
            {
                int page = Convert.ToInt32(PageIndex.Text);
                if ((int)Math.Ceiling((double)Convert.ToInt32(ViewState["dataCount"]) / (double)rowCount) >= page)
                {
                    ViewState["pageIndex"] = page;
                    getData();
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('超出范围');</script>");
                    PageIndex.Text = "";
                }
            }
            catch
            {
                return;
            }
        }

        protected void btnFirstPage_Click(object sender, EventArgs e)
        {
            ViewState["pageIndex"] = 1;
            getData();
        }

        protected void btnLastPage_Click(object sender, EventArgs e)
        {
            int pageCount = (int)Math.Ceiling((double)Convert.ToInt32(ViewState["dataCount"]) / (double)rowCount);
            if (pageCount >= 0)
            {
                ViewState["pageIndex"] = pageCount;
                getData();
            }
        }

        protected void btnPreviousPage_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(ViewState["pageIndex"]) > 1)
            {
                ViewState["pageIndex"] = Convert.ToInt32(ViewState["pageIndex"]) - 1;
                getData();
            }
            else
                return;
        }

        protected void btnNextPage_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(ViewState["pageIndex"]) < (int)Math.Ceiling((double)Convert.ToInt32(ViewState["dataCount"]) / (double)rowCount))
            {
                ViewState["pageIndex"] = Convert.ToInt32(ViewState["pageIndex"]) + 1;
                getData();
            }
            else
                return;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string sqlWhere = "";
            if (SearchTitle.Value.Trim() != "")
            {
                sqlWhere += " and Title like '%" + SearchTitle.Value.Trim() + "%'";
            }
            if (SearchNewsType.SelectedIndex != 0)
            {
                sqlWhere += " and Type = " + SearchNewsType.SelectedIndex;
            }
            if (SearchPubDate.Value.Trim() != "")
            {
                sqlWhere += " and PubDate = '" + SearchPubDate.Value.Trim() + "'";
            }

            ViewState["sqlWhere"] = sqlWhere;
            ViewState["pageIndex"] = 1;
            getData();
        }
    }
}