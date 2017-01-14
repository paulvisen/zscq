using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace zscq.cs
{
    public class xxjy_model
    {
        public int id { get; set; }
        public string xxjy_name { get; set; }
        public DateTime start_time { get; set; }
        public DateTime end_time { get; set; }
        public string host { get; set; }
        public string location { get; set; }
        public string details_short { get; set; }
        public string image_url { get; set; }
        public string state { get; set; }//由开始时间和结束时间与当前时间对比得到/////需要定时刷新??????考虑是否在数据库中得到
        public int pubstate { get; set; }///程序写
        public string con_phone { get; set; }
        public string main_content { get; set; }
        public string timeline { get; set; }
        public string image_list { get; set; }////程序写
        public int UserId { get; set; }///程序写
    }
}