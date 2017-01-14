using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.BasicCode;
using zscq.cs;

namespace zscq.Manage.chengguo
{
    public partial class chengguoJudge : WebBase
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = GetUserName();
            int CGComponyid = mDB.GetUserId(username);
            int cgid = Convert.ToInt32(Request["cgid"]);
            chengguo_model model = new chengguo_model();
            DB dll = new DB();
            model = dll.GetDetail(cgid);
            Image1.ImageUrl = model.image_list;
            cgname.InnerText = model.CGName;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            //从前端读评价的数据
            int in0 = Convert.ToInt32(Context.Request.Form["input0"]);
            int in1 = Convert.ToInt32(Context.Request.Form["input1"]);
            int in2 = Convert.ToInt32(Context.Request.Form["input2"]);
            if (Context.Request.Form["txtjud"] != null)
            {
                string txtjud = Context.Request.Form["txtjud"];
            }
            if (Context.Request.Form["imgurl"] != null)
            {
                string imgurl = Context.Request.Form["imgurl"];
            }
            //写入数据库

        }
    }
}