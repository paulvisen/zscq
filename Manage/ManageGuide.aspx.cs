using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.BasicCode;
using zscq.Models;
using zscq.DataBase;

namespace zscq.Manage
{
    public partial class ManageGuide : WebBase
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
                return;
            }

            Models.User user = UserDao.GetUser();
            hideType.Value = user.UserType.ToString();
            if (user.auth == 0)
            {
                //Response.Redirect("UserAuth.aspx");
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