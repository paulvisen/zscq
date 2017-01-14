using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace zscq.cs
{
    public class cgjudge
    {
        public int JDGID { get; set; }
        public DateTime JDGDate { get; set; }
        public int JDGCGID { get; set; }
        public int JDGUserID { get; set; }
        public int JDGStars1 { get; set; }
        public int JDGStars2 { get; set; }
        public int JDGStars3 { get; set; }
        public string JDGDetails { get; set; }
        public string JDGImg { get; set; }
    }
}