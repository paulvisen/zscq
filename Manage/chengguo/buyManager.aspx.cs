using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.cs;
using zscq.BasicCode;
using System.Data;

namespace zscq.Manage.chengguo
{
    public partial class buyManager : WebBase
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = GetUserName();
            int CGComponyid = mDB.GetUserId(username);
            getData();

        }
        private int rowcount = 10;//每页数量
        public void getData()
        {
            string username = GetUserName();
            int CGComponyid = mDB.GetUserId(username);

            int pageindex;//当前页 0为第一页
            string sqlWhere = "and RR_BuyerID=" + CGComponyid + " ";
            int iCount = 0; //数据总量
            if (ViewState["pageIndex"] == null)
                pageindex = 0;
            else
                pageindex = Convert.ToInt32(ViewState["pageIndex"]);
            if (ViewState["sqlWhere"] == null)
                sqlWhere = "and RR_BuyerID=" + CGComponyid + " ";
            else
                sqlWhere = ViewState["sqlWhere"].ToString();
            DB bll = new DB();
            DataTable dt = bll.GetDataBuy(sqlWhere, pageindex * rowcount, rowcount, out iCount);
            if (dt != null)
            {
                grid.DataSource = dt;
                lblRowCount.Text = iCount.ToString();//数据条数
                ViewState["dataCount"] = iCount;

                pageIndex.Text = (pageindex + 1).ToString();//当前页
                lblpagecount.Text = ((int)Math.Ceiling((double)iCount / (double)rowcount)).ToString();//总页数
                grid.DataBind();
            }
            sqlWhere = "and RR_BuyerID=" + CGComponyid + " ";
        }
        //protected void btnSearch_Click(object sender, EventArgs e)
        //{
        //    string sqlWhere = "and RR_BuyerID=" + CGComponyid + " "; ;
        //    if (SeaUName.Value.Trim() != "")
        //    {
        //        ViewState["sqlWhere"] = "and RR_BuyerID=" + CGComponyid + " ";
        //        if (SeaUName.Value.Trim() != "")
        //        {
        //            sqlWhere += " and CGName like '%" + SeaUName.Value.Trim() + "%' ";
        //        }
        //        ViewState["sqlWhere"] = sqlWhere;
        //        ViewState["pageIndex"] = 0;
        //        getData();
        //    }
        //    else
        //    {
        //        ViewState["sqlWhere"] = "and RR_BuyerID=" + CGComponyid + " ";
        //        ViewState["pageIndex"] = 0;
        //        getData();
        //    }
            
        //}
        protected void btnPageClick_Click(object sender, EventArgs e)
        {
            int page;
            try
            {
                page = Convert.ToInt32(pageIndex.Text) - 1;
                if ((int)Math.Ceiling((double)Convert.ToInt32(ViewState["dataCount"]) / (double)rowcount) - 1 >= page)
                {
                    ViewState["pageIndex"] = page;
                    getData();
                }
                else
                {
                    pageIndex.Text = "";
                }
            }
            catch (Exception)
            {
                return;
            }
       
        }
        protected void btnFrpage_Click(object sender, EventArgs e)
        {
            ViewState["pageIndex"] = 0;
            getData();
           
        }
        protected void btnLapage_Click(object sender, EventArgs e)
        {
            if ((int)Math.Ceiling((double)Convert.ToInt32(ViewState["dataCount"]) / (double)rowcount) - 1 >= 0)
            {
                ViewState["pageIndex"] = (int)Math.Ceiling((double)Convert.ToInt32(ViewState["dataCount"]) / (double)rowcount) - 1;
                getData();
            }
           
        }

        protected void btnSpage_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(ViewState["pageIndex"]) > 0)
            {
                ViewState["pageIndex"] = Convert.ToInt32(ViewState["pageIndex"]) - 1;
                getData();
            }
            else
                return;
           
        }

        protected void btnXpage_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(ViewState["pageIndex"]) < (int)Math.Ceiling((double)Convert.ToInt32(ViewState["dataCount"]) / (double)rowcount) - 1)
            {
                ViewState["pageIndex"] = Convert.ToInt32(ViewState["pageIndex"]) + 1;
                getData();
            }
            else
                return;
           
        }


       
    }
}