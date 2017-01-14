using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace zscq.cs
{
    public class need_model
    {
        public int NeedID { get; set; }
        public string Name { get; set; }
        public int UserID { get; set; }
        public string CommPerson { get; set; }
        public string CommTel{get;set;}
        public DateTime PubDate { get; set; }
        public string BriefIntro{get; set;}
        public string BelongField{get; set;}
        public string Mature{get;set;}
        public string TechLevel{get;set;}
        public string TransStyle{get;set;}
        public int PriceLow{get;set;}
        public int PriceHigh{get;set;}
        public string transclass{get;set;}
        public string KeyWords { get; set; }
        public int PubState { get; set; }
    }
}