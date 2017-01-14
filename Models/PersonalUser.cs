using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace zscq.Models
{
    public class PersonalUser : User
    {
        public String FrontIdentifyCard { get; set; }
        public String BackIdentifyCard { get; set; }
    }
}