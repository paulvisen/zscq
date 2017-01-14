using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace zscq.Models
{
    public class Academy:User
    {
        public String Name { get; set; }
        public String Area { get; set; }
        public String Address { get; set; }
        public String Introduce { get; set; }
        public String SubjectType { get; set; }
    }
}