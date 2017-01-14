using zscq.BasicCode;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.cs;

namespace cgjy.aspx
{
    public partial class jydt_list_details : WebBase
    {
        static string user = GetUserName();
        int userid = mDB.GetUserId(user);
       
        protected void Page_Load(object sender, EventArgs e)
        {
            username.Text = user;
            try
            {
                DB dll = new DB();
                int ChengGuoID = Convert.ToInt32(Request["cgid"].ToString());
                int iCount = 0; //数据总量
                int oCount=0;
                int result1 = dll.GetBuy(ChengGuoID, userid, out iCount);
                int result2 = dll.GetBook(ChengGuoID, userid, out oCount);
                if (iCount != 0)
                {
                    buy0.Visible = false;
                    buy1.Visible = true;

                }
                else {
                    buy0.Visible = true;
                    buy1.Visible = false;
                }
                if (oCount != 0)
                {
                    bookmark0.Visible = false;
                    bookmark1.Visible = true;
                }
                else {
                    bookmark0.Visible = true;
                    bookmark1.Visible = false;
                }
            }
            catch {
                Response.Write("<script>alert('加载出错！');</script>");
            }
           


        }

       //OpByID { get; set; }
       //  Operation { get; set; }
       // DateTime OpDate { get; set; }
        public chengguoop getBook() {
            try
            {
                chengguoop model = new chengguoop();
                int ChengGuoID = Convert.ToInt32(Request["cgid"].ToString());
                model.ChengGuoID = ChengGuoID;
                model.OpByID = userid;
                model.Operation = 1;
                model.OpDate = DateTime.Now;
                return model;
            }
            catch {
                return null;
            }
        
        }


        public void bookmark0_Click(object sender, EventArgs e)
        {
            mDB dll=new mDB();
            int ChengGuoID = Convert.ToInt32(Request["cgid"].ToString());
            chengguoop model = getBook();
            int result = dll.AddBook(model);
            if (result == 1)
            {
                string str = "<script>alert('收藏成功！');window.location.href='jydt_list_details.aspx?cgid=" + ChengGuoID + "';</script>";
                Response.Write(str);
            }
            else
            {
                Response.Write("<script>alert('收藏失败！');</script>");
            }


        }
        public void bookmark1_Click(object sender, EventArgs e)
        {
            mDB dll = new mDB();
            chengguoop model = new chengguoop();
            int ChengGuoID = Convert.ToInt32(Request["cgid"].ToString());
            model.ChengGuoID = ChengGuoID;
            model.OpByID = userid;
            model.OpByID = userid;
            model.Operation = 2;
            model.OpDate = DateTime.Now;
            int result = dll.EditBook(model);
            //int result = 1;
            if (  result == 1)
            {
                string str = "<script>alert('取消收藏成功！');window.location.href='jydt_list_details.aspx?cgid=" + ChengGuoID + "';</script>";
                Response.Write(str);
            }
            else
            {
                Response.Write("<script>alert('收藏失败！');</script>");
            }


        }
    }
}