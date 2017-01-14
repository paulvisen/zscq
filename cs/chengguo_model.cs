using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace zscq.cs
{
    public class chengguo_model
    {
        public int id { get; set; }
        public string CGName{ get; set; }
        public DateTime RegTime{ get; set; }
        public string CGCompany{ get; set; }
        public string ConPerson{ get; set; }
        public string ConPhone{ get; set; }
        public string PatentNum{ get; set; }
        public string CGType { get; set; }
        public string TransMode { get; set; }
        public int TransPrice { get; set; }
        public string CGDetails_short { get; set; }
        //public string CGDetails { get; set; }
        public string CGImg { get; set; }
        public int CGPubstate { get; set; }
        public int isByExp { get; set; }
        public string keyword { get; set; }
        public string image_list { get; set; }
        //public string CGPosition { get; set; }
        public string admin_com { get; set; }
        public string unit_com { get; set; }
        public string main_person { get; set; }
        public string main_person_phone { get; set; }
        public int CGComponyid { get; set; }
        public string CGField { get; set; }
    }
}