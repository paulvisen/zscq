using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using zscq.BasicCode;

namespace zscq.Models
{
    public class News
    {
        /// <summary>
        /// 新闻ID
        /// </summary>
        public int NewsID { get; set; }

        /// <summary>
        /// 新闻内容（富文本）
        /// </summary>
        public string MainContentRIA { get; set; }

        /// <summary>
        /// 新闻内容（纯文本）
        /// </summary>
        public string MainContentText { get; set; }

        /// <summary>
        /// 发表日期
        /// </summary>
        public DateTime PubDate { get; set; }

        /// <summary>
        /// 标题
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// 新闻类型
        /// </summary>
        public enumNewsType SubType { get; set; }

        /// <summary>
        /// 阅读次数
        /// </summary>
        public int ReadTimes { get; set; }

        /// <summary>
        /// 发表人
        /// </summary>
        public int UserID { get; set; }

        /// <summary>
        /// 是否申请首页显示
        /// </summary>
        public bool OnTop { get; set; }

        /// <summary>
        /// 首页图片路径
        /// </summary>
        public string TopPicUrl { get; set; }

        
    }
}