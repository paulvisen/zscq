using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.BasicCode;

namespace zscq.Views.News
{
    public partial class News : WebBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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

        protected void Login(object sender, EventArgs e)
        {
            Login();
        }
    }
}