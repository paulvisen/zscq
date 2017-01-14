using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.BasicCode;

namespace zscq.aspx
{
    public partial class jygg : WebBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = GetUserName();
            username.Text = user;
        }
    }
}