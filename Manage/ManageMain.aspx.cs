using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DataBase;
using zscq.Models;

namespace zscq.Manage
{
    public partial class ManageMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Models.User user = UserDao.GetUser();
            hideType.Value = user.UserType.ToString();
            username.InnerText = user.UserName;
        }
    }
}