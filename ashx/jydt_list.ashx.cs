using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace cgjy.ashx
{
    /// <summary>
    /// jydt_list 的摘要说明
    /// </summary>
    public class jydt_list : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
           ///处理从search_cg.js传过来的搜索成果种类的字段
            context.Response.ContentType = "application/x-json";
            context.Response.Charset = "utf-8";
            string cgfl0 = context.Request.Form["cgfl0"];
            string jyjg0 = context.Request.Form["jyjg0"];
            string jshzfs0 = context.Request.Form["jshzfs0"];
            string txtaddr0 = context.Request.Form["txtaddr0"];
            //bool CheckSH0 = Convert.ToBoolean(context.Request.Form["CheckSH0"]);
            bool CheckZJ0 = Convert.ToBoolean(context.Request.Form["CheckZJ0"]);
            string sql = "";
            //if (null != context.Request.Form["sql"])
            //{
            //    sql = context.Request.Form["sql"];
            //}

            if (cgfl0 != null && cgfl0 != "全部")
            {
                sql += " and CGType=" + cgfl0;
            }

            if (jyjg0 != null && jyjg0 != "不限")
            {
                if (jyjg0 == "1-10万")
                {
                    sql += " and TransPrice between 1 and 10 ";
                }
                else if (jyjg0 == "10-20万")
                {
                    sql += " and TransPrice between 10 and 20 ";
                }
                else if (jyjg0 == "20-100万")
                {
                    sql += " and TransPrice between 20 and 100 ";
                }
                else if (jyjg0 == "100-500万")
                {
                    sql += " and TransPrice between 100 and 500 ";
                }
                else if (jyjg0 == "500-1000万")
                {
                    sql += " and TransPrice between 500 and 1000 ";
                }
                else if (jyjg0 == "1000万以上")
                {
                    sql += " and TransPrice>1000 ";
                }
            }

            if (jshzfs0 != null && jshzfs0 != "不限")
            {
                sql += " and TransMode=" + jshzfs0;
            }

            if (txtaddr0 != null)
            {
                sql += " and CGPosition like '%" + txtaddr0 + "%'";
            }
            if (CheckZJ0)
            {
                sql += " and isByExp=1";
            }

           
            
            int type = 1;

            if (!CheckUrlRefer(context))
                return;

            if (null != context.Request.Form["type"])
                type = int.Parse(context.Request.Form["type"].ToString().Trim());
            if (null != context.Request.QueryString["type"])
                type = int.Parse(context.Request.QueryString["type"].ToString().Trim());

            switch (type)
            {
                case 1:
                    {//获取
                        //================================================================  
                        //获取分页和排序信息：页大小，页码，排序方式，排序字段  
                        int pageRows, page;
                        pageRows = 6;
                        page = 1;
                        if (null != context.Request.QueryString["rows"])
                            pageRows = int.Parse(context.Request.QueryString["rows"].ToString().Trim());
                        if (null != context.Request.QueryString["page"])
                            page = int.Parse(context.Request.QueryString["page"].ToString().Trim());

                        DataTable dt = zscq.cs.DB.jydt_Loadlist((page - 1) * pageRows , page * pageRows,sql);
                        if (dt != null)
                        {
                            int count = zscq.cs.DB.jydt_Loadlist_Count(sql);
                            string strJson = zscq.cs.DBMysql.DataTable2Json(dt, count);
                            context.Response.Write(strJson);//返回给前台页面  
                            context.Response.End();
                        }

                        break;
                    }
                case 2:
                    {//获取需求信息
                        //================================================================  
                        //获取分页和排序信息：页大小，页码，排序方式，排序字段  
                        int pageRows, page;
                        pageRows = 6;
                        page = 1;
                        if (null != context.Request.QueryString["rows"])
                            pageRows = int.Parse(context.Request.QueryString["rows"].ToString().Trim());
                        if (null != context.Request.QueryString["page"])
                            page = int.Parse(context.Request.QueryString["page"].ToString().Trim());

                        DataTable dt = zscq.cs.DB.jydt_Loadlist_xq((page - 1) * pageRows, page * pageRows, sql);
                        if (dt != null)
                        {
                            int count = zscq.cs.DB.jydt_Loadlist_Count_xq(sql);
                            string strJson = zscq.cs.DBMysql.DataTable2Json(dt, count);
                            context.Response.Write(strJson);//返回给前台页面  
                            context.Response.End();
                        }

                        break;
                    }
            }

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        protected bool CheckUrlRefer(HttpContext context)
        {

            if (System.Configuration.ConfigurationManager.AppSettings["CheckUrlRefer"] != null &&
                System.Configuration.ConfigurationManager.AppSettings["CheckUrlRefer"].ToString() == "1")
            {
                return context.Request.UrlReferrer.AbsolutePath.ToString().Replace("aspx", "ashx").ToLower() == context.Request.Url.AbsolutePath.ToString().ToLower();
            }
            else
                return true;
        }

    }
}