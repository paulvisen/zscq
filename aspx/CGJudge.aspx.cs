using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cgjy.aspx
{
    public partial class CGJudge : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

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
            if (Context.Request.Form["imgurl"] != null) {
                string imgurl = Context.Request.Form["imgurl"];
            }
           //写入数据库

        }
    }
}