using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using zscq.BasicCode;

namespace zscq
{
    public partial class Home1 : WebBase
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

        protected void Logout(object sender, EventArgs e)
        {
            Logout();
        }
    }
}