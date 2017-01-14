using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.BasicCode;

namespace cgjy.aspx
{
    public partial class XXJY : WebBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = GetUserName();
            username.Text = user;



        }
      

    }
}