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
    public partial class XXJYPub : WebBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected xxjy_model EditCG()
        {
            try
            {
                string username = GetUserName();
                int UserId = mDB.GetUserId(username);
                xxjy_model model = new xxjy_model();
                if (xxjy_name.Value != "")
                {
                    model.xxjy_name = xxjy_name.Value;
                }
                if (start_time.Value != "")
                {
                    model.start_time = Convert.ToDateTime(start_time.Value);
                }
                if (end_time.Value != "")
                {
                    model.end_time = Convert.ToDateTime(end_time.Value);
                }
                if (host.Value != "")
                {
                    model.host = host.Value;
                }
                if (location.Value != "")
                {
                    model.location = location.Value;
                }
                if (details_short.Value != "")
                {
                    model.details_short = details_short.Value;
                }
                if (image_url.Value != "")
                {
                    model.image_url = image_url.Value;
                }
                DateTime datenow = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                DateTime start = model.start_time;
                DateTime end = model.end_time;
                if (datenow < start)
                {
                    model.state = "计划中";
                }
                else if (datenow > start && datenow < end)
                {
                    model.state = "进行中";
                }
                else
                {
                    model.state = "已结束";
                }
                model.pubstate = 0;
                if (con_phone.Value != "")
                {
                    model.con_phone = con_phone.Value;
                }
                if (main_content.Value != "")
                {
                    model.main_content = main_content.Value;
                }
                if (timeline.Value != "")
                {
                    model.timeline = timeline.Value;
                }
                if (image_list.Value != "")
                {
                    model.image_list = image_list.Value;
                }
                if (UserId != 0)
                {
                    model.UserId = UserId;
                }
        
                return model;
            }
            catch
            {
                return null;
            }
        }
        protected void sumitme_Click(object sender, EventArgs e)
        {
            mDB dll = new mDB();
            xxjy_model model = EditCG();
            var result = dll.AddIndustry_xxjy(model);
            if (result == 1)
            {
                Response.Write("<script>alert('保存成功！');window.location.href='XXJYPub.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('保存失败！');</script>");
            }

        }
    }
}