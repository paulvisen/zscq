using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.BasicCode;
using zscq.cs;

namespace cgjy.aspx
{
    public partial class AddToBuy : WebBase
    {
        static string user = GetUserName();
        int userid = mDB.GetUserId(user);
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
        }
        public chengguojiaoyi getBuy(){
             try{
                 chengguojiaoyi model=new chengguojiaoyi();
                 chengguo_model model0 = new chengguo_model();
                 DB dll0=new DB();
                 int LCGID = Convert.ToInt32(Request["cgid"].ToString());
                 model0 = dll0.GetDetail(LCGID);
                 model.LUserID = model0.CGComponyid;
                 int BuyerID = userid;
                 model.LCGID = LCGID;
                 model.BuyerID = BuyerID;
                 model.Trash = 0;
                 model.Operate = 1;
                 model.OpDate = DateTime.Now;
                 if (userprice.Value!=null)
                 {
                     model.Price = Convert.ToInt32(userprice.Value);
                 }
                 if (mess.Value != null)
                 {
                     model.Sugg = mess.Value;
                 }
                 if (usercomm.Value != null)
                 {
                     model.Comm = usercomm.Value;
                 }
                 
                 return model;
            }
            catch{
                return null;
            }
        }

        protected void buttonsHandleIn_Click(object sender, EventArgs e)
        {
            mDB dll = new mDB();
            chengguojiaoyi model = getBuy();
            int result = dll.AddBuy(model);
            //int result = 1;
            if (result == 1)
            {
                Response.Write("<script>alert('购买成功！');</script>");
                Response.Write("<script src='../js/artDialog/artDialog.js?skin=twitter'></script><script src='../js/artDialog/plugins/iframeTools.js'></script>");
                Response.Write("<script>var win = art.dialog.open.origin; win.location.reload(); art.dialog.close();</script>");
            }
            else
            {
                Response.Write("<script>alert('购买失败！');</script>");
                Response.Write("<script src='../js/artDialog/artDialog.js?skin=twitter'></script><script src='../js/artDialog/plugins/iframeTools.js'></script>");
                Response.Write("<script>var win = art.dialog.open.origin; win.location.reload(); art.dialog.close();</script>");
            }

        }

    }
}