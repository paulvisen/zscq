using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace zscq.cs
{
    public class chengguojiaoyi
    {
        public int JiaoYiID { get; set; }
        public int LCGID { get; set; }
        public int LUserID { get; set; }/////暂时无用
        public int BuyerID { get; set; }
        public int Operate { get; set; }
        public DateTime OpDate { get; set; }
        public int Trash { get; set; }////暂时不知有什么用
        public int Price { get; set; }
        public string Sugg { get; set; }
        public string Comm { get; set; }
    }
}