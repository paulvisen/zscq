using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace zscq.Models
{
    public class Expert:User
    {
        public String Qualification { get; set; }
        public String Graduation { get; set; }
        public String ExpertTitle { get; set; }
        public String ResearchArea { get; set; }
        public String Address { get; set; }
        public String Awards { get; set; }
        public String Photo { get; set; }

    }
}