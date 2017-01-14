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
    public partial class AccountManage : WebBase
    {
        Models.User user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = UserDao.GetUser();
            if (!IsPostBack)
            {
                Name.Value = user.UserName;
                NickName.Value = user.NickName;
                Email.Value = user.Email;
                Phone.Value = user.Phone;
            }
            
        }

        protected void Login(object sender, EventArgs e)
        {
            Login();
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            user.UserName = Name.Value;
            user.NickName = NickName.Value;
            user.Email = Email.Value;
            user.Phone = Phone.Value;
            UserDao.UpdateUser(user);
        }
    }
}