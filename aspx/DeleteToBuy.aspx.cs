using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.BasicCode;
using zscq.cs;

namespace zscq.aspx
{
    public partial class DeleteToBuy : WebBase
    {
        static string user = GetUserName();
        int userid = mDB.GetUserId(user);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public chengguojiaoyi getBuy()
        {
            try
            {
                chengguojiaoyi model = new chengguojiaoyi();
                int LCGID = Convert.ToInt32(Request["cgid"].ToString());
                int BuyerID = userid;
                model.LCGID = LCGID;
                model.BuyerID = BuyerID;
                model.Operate = 2;
                model.OpDate = DateTime.Now;
               
                if (mess.Value != null)
                {
                    model.Sugg = mess.Value;
                }
                

                return model;
            }
            catch
            {
                return null;
            }
        }
        protected void buttonsHandleIn_Click(object sender, EventArgs e)
        {
            mDB dll = new mDB();
            chengguojiaoyi model = getBuy();
            int result = dll.EditBuy(model);
            //int result = 1;
            if (result == 1)
            {
                Response.Write("<script>alert('取消购买成功！');</script>");
                Response.Write("<script src='../js/artDialog/artDialog.js?skin=twitter'></script><script src='../js/artDialog/plugins/iframeTools.js'></script>");
                Response.Write("<script>var win = art.dialog.open.origin; win.location.reload(); art.dialog.close();</script>");
            }
            else
            {
                Response.Write("<script>alert('取消购买失败！');</script>");
                Response.Write("<script src='../js/artDialog/artDialog.js?skin=twitter'></script><script src='../js/artDialog/plugins/iframeTools.js'></script>");
                Response.Write("<script>var win = art.dialog.open.origin; win.location.reload(); art.dialog.close();</script>");
            }
        }
    }
}