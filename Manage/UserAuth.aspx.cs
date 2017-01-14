using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.BasicCode;

namespace zscq.Manage
{
    public partial class UserAuth : WebBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            username.InnerText = GetUserName();
        }
    }
}