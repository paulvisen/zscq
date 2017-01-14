using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using zscq.BasicCode;
using zscq.DataBase;

namespace zscq.Models
{
    public class User
    {
        public int UserID { get; set; }

        public string UserName { get; set; }

        public string NickName { get; set; }

        public string Email { get; set; }

        public enumUserType UserType { get; set; }

        public string Phone { get; set; }

        public int auth { get; set; }
    }
}