using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using zscq.cs;
using zscq.DataBase;

namespace zscq.cs
{
    public class DB
    {
        public static DataTable xxjy_Loadlist(int begidx,int endidx,int state=1) {
            try
            {
                DataTable dt = new DataTable();

                DBMysql db = new DBMysql();
                db.ExecuteQueryOpen();
                //string sql = "select * from ( select ROW_NUMBER() OVER (order by pp.id desc ) as num from xxjy as pp where pp.pubstate = "+state+" ) as a where a.num between " +begidx+" "+"and"+" "+endidx+" ";
                //string sql = "select * from xxjy as pp where pp.pubstate = " + state +  " ";
                string sql = "select id,xxjy_name,image_list,state,start_time,end_time,details_short,host,location  from xxjy where pubstate=" + state + " limit " + begidx + " , " + endidx;
                dt = db.ExecuteQuery(sql);
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }
        public static DataTable jydt_Loadlist(int begidx, int endidx, string sqlwhere, int state = 1)
        {
            try
            {
                DataTable dt = new DataTable();
                DBMysql db = new DBMysql();
                db.ExecuteQueryOpen();
                //string sql = "select * from ( select ROW_NUMBER() OVER (order by pp.id desc ) as num from xxjy as pp where pp.pubstate = "+state+" ) as a where a.num between " +begidx+" "+"and"+" "+endidx+" ";
                //string sql = "select * from xxjy as pp where pp.pubstate = " + state +  " ";
                string sql = " select  id,CGName,CGType,TransMode,CGDetails_short,CGPubstate,isByExp,image_list,CGCompany  from chengguo where CGPubstate=" + state + sqlwhere + " limit " + begidx + " , " + endidx;
                dt = db.ExecuteQuery(sql);
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }
        public DataTable GetData(string sqlWhere, int pageindex, int rowcount, out int count)
        {
            string sql = "select * from chengguo where 1=1 " + sqlWhere + " LIMIT ?pindex , ?rcount;";
            MySqlParameter[] sqlpar = new MySqlParameter[]
            {
                new MySqlParameter("?pindex",pageindex),
                new MySqlParameter("?rcount",rowcount)
            };
            DBMysql db = new DBMysql();
            db.ExecuteQueryOpen();
            DataTable tb = db.ExecuteQuery(sql, sqlpar);
            string sqlcount = "select count(*) from chengguo where 1=1 " + sqlWhere;
            DataTable tbcount = db.ExecuteQuery(sqlcount);
            count = Convert.ToInt32(tbcount.Rows[0][0]);
            db.ExecuteQueryClose();
            return tb;
        }

        public DataTable GetDataSell(string sqlWhere, int pageindex, int rowcount, out int count)
        {
            string sql = "select a.*,b.CGName,b.id,c.UserName,c.UserID from  chengguo as b ,chengguojiaoyi as a , usersimple as c where a.LCGID=b.id and c.UserID=a.BuyerID and Operate=1 and Trash=0 " + sqlWhere + " LIMIT ?pindex , ?rcount;";
            MySqlParameter[] sqlpar = new MySqlParameter[]
            {
                new MySqlParameter("?pindex",pageindex),
                new MySqlParameter("?rcount",rowcount)
            };
            DBMysql db = new DBMysql();
            db.ExecuteQueryOpen();
            DataTable tb = db.ExecuteQuery(sql, sqlpar);
            string sqlcount = "select count(*) from chengguo as b ,chengguojiaoyi as a where a.LCGID=b.id " + sqlWhere;
            DataTable tbcount = db.ExecuteQuery(sqlcount);
            count = Convert.ToInt32(tbcount.Rows[0][0]);
            db.ExecuteQueryClose();
            return tb;
        }

        public DataTable GetDataBuy(string sqlWhere, int pageindex, int rowcount, out int count)
        {
            string sql = "select a.JYCGID,a.RR_BuyerID,a.RR_FinishDate,a.RR_Price,b.CGName,b.id,c.UserName,c.UserID from chengguojydone as a join chengguo as b on (a.JYCGID=b.id) join  usersimple as c on (c.UserID=a.RR_BuyerID)  where 1=1 " + sqlWhere + " LIMIT ?pindex , ?rcount;";
            MySqlParameter[] sqlpar = new MySqlParameter[]
            {
                new MySqlParameter("?pindex",pageindex),
                new MySqlParameter("?rcount",rowcount)
            };
            DBMysql db = new DBMysql();
            db.ExecuteQueryOpen();
            DataTable tb = db.ExecuteQuery(sql, sqlpar);
            string sqlcount = "select count(*) from chengguojydone as a ,chengguo as b where a.JYCGID=b.id " + sqlWhere;
            DataTable tbcount = db.ExecuteQuery(sqlcount);
            count = Convert.ToInt32(tbcount.Rows[0][0]);
            db.ExecuteQueryClose();
            return tb;
        }
        public int GetBuy(int cgid,int userid, out int count)
        {
            try
            {
                string sql = "select count(*) from chengguojiaoyi where LCGID=?cgid and BuyerID=?userid and Operate=1;";
                MySqlParameter[] sqlpar = new MySqlParameter[]
            {
                new MySqlParameter("?cgid",cgid),
                new MySqlParameter("?userid",userid)
            };
                DBMysql db = new DBMysql();
                db.ExecuteQueryOpen();
                //DataTable tb = db.ExecuteQuery(sql, sqlpar);
                //string sqlcount = "select count(*) from chengguo where 1=1 " + sqlWhere;
                DataTable tbcount = db.ExecuteQuery(sql, sqlpar);
                count = Convert.ToInt32(tbcount.Rows[0][0]);
                db.ExecuteQueryClose();
                return 1;
            }
            catch {
                count = 0;
                return 0;
            }
           
        }
        public int GetBook(int cgid, int userid, out int count)
        {
            try
            {
                string sql = "select count(*) from chengguoop where ChengGuoID=?cgid and OpByID=?userid and Operation=1;";
                MySqlParameter[] sqlpar = new MySqlParameter[]
            {
                new MySqlParameter("?cgid",cgid),
                new MySqlParameter("?userid",userid)
            };
                DBMysql db = new DBMysql();
                db.ExecuteQueryOpen();
                //DataTable tb = db.ExecuteQuery(sql, sqlpar);
                //string sqlcount = "select count(*) from chengguo where 1=1 " + sqlWhere;
                DataTable tbcount = db.ExecuteQuery(sql, sqlpar);
                count = Convert.ToInt32(tbcount.Rows[0][0]);
                db.ExecuteQueryClose();
                return 1;
            }
            catch
            {
                count = 0;
                return 0;
            }

        }
        public chengguo_model GetDetail(int cgid)
        {
            try
            {
                
                DBMysql db = new DBMysql();
                db.ExecuteQueryOpen();
                string sql = "select * from chengguo where id = " + cgid;
                //string sql = "select a.*,c.Name,c.Introduce,d.comment from chengguo as a join  usersimple as b on (a.CGComponyid=b.UserID) join keyanteaminfo as c on(b.UserID=c.Id) left join chengguo_expcom as d on(a.id=d.chengguoId)  where a.id = " + cgid;
                //string sql = "select a.*,b.Id,b.Name,b.Introduce,c.comment from chengguo as a join keyanteaminfo as b on (a.CGComponyid = b.Id) join chengguo_expcom as c on(c.chengguoId=a.id) where a.id = " + cgid;
                chengguo_model tb = ConvertDatatableToList<chengguo_model>.Convert(db.ExecuteQuery(sql))[0];
                db.ExecuteQueryClose();
                return tb;
            }
            catch
            {
                return null;
            }
        }
        public static DataTable jydt_Loadlist_xq(int begidx, int endidx, string sqlwhere, int state = 1)
        {
            try
            {
                DataTable dt = new DataTable();
                DBMysql db = new DBMysql();
                db.ExecuteQueryOpen();
                //string sql = "select * from ( select ROW_NUMBER() OVER (order by pp.id desc ) as num from xxjy as pp where pp.pubstate = "+state+" ) as a where a.num between " +begidx+" "+"and"+" "+endidx+" ";
                //string sql = "select * from xxjy as pp where pp.pubstate = " + state +  " ";
                string sql = " select NeedID,BriefIntro,BelongField,TransStyle,Name,image_list from need where PubState=" + state + sqlwhere + " limit " + begidx + " , " + endidx;
                dt = db.ExecuteQuery(sql);
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }
        public static DataTable xxjy_LoadAll(int xxjyid) {
            try
            {
                DataTable dt = new DataTable();
                DBMysql db = new DBMysql();
                db.ExecuteQueryOpen();
                string sql = "select * from xxjy where id = " + xxjyid;
                dt = db.ExecuteQuery(sql);
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }
        public static DataTable chengguo_LoadAll(int cgid)
        {
            try
            {
                DataTable dt = new DataTable();
                DBMysql db = new DBMysql();
                db.ExecuteQueryOpen();
                string sql = "select a.*,c.Name,c.Introduce from chengguo as a join  usersimple as b on (a.CGComponyid=b.UserID) join keyanteaminfo as c on(b.UserID=c.Id) where a.id = " + cgid;
                //string sql = "select a.*,c.Name,c.Introduce,d.comment from chengguo as a join  usersimple as b on (a.CGComponyid=b.UserID) join keyanteaminfo as c on(b.UserID=c.Id) left join chengguo_expcom as d on(a.id=d.chengguoId)  where a.id = " + cgid;
                //string sql = "select a.*,b.Id,b.Name,b.Introduce,c.comment from chengguo as a join keyanteaminfo as b on (a.CGComponyid = b.Id) join chengguo_expcom as c on(c.chengguoId=a.id) where a.id = " + cgid;
                dt = db.ExecuteQuery(sql);
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }
         public static DataTable Loadcom(int cgid)
        {
            try
            {
                DataTable dt = new DataTable();
                DBMysql db = new DBMysql();
                db.ExecuteQueryOpen();
                string sql = "select * from chengguo_expcom where chengguoId = " + cgid;
                //string sql = "select a.*,c.Name,c.Introduce,d.comment from chengguo as a join  usersimple as b on (a.CGComponyid=b.UserID) join keyanteaminfo as c on(b.UserID=c.Id) left join chengguo_expcom as d on(a.id=d.chengguoId)  where a.id = " + cgid;
                //string sql = "select a.*,b.Id,b.Name,b.Introduce,c.comment from chengguo as a join keyanteaminfo as b on (a.CGComponyid = b.Id) join chengguo_expcom as c on(c.chengguoId=a.id) where a.id = " + cgid;
                dt = db.ExecuteQuery(sql);
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }
        public static DataTable chengguo_LoadAll_xq(int cgid)
        {
            try
            {
                DataTable dt = new DataTable();
                DBMysql db = new DBMysql();
                db.ExecuteQueryOpen();
                string sql = "select  NeedID,a.Name,c.Name,c.Introduce,PubDate,CommPerson,BriefIntro,BelongField,Mature,TechLevel,TransStyle,PriceLow,PriceHigh,CommTel,CommEmail,CommAddress,transclass from need as a join usersimple as b on (a.UserID=b.UserID) join keyanteaminfo as c on (c.Id=b.UserID) where NeedID = " + cgid;
                dt = db.ExecuteQuery(sql);
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }



        public static int xxjy_Loadlist_Count( int state = 1)
        {
            try
            {
                DataTable dt = new DataTable();
                DBMysql db = new DBMysql();
                db.ExecuteQueryOpen();
                dt = db.ExecuteQuery("select COUNT(*) from xxjy where  PubState = " + state.ToString());
                db.ExecuteQueryClose();
                return DBMysql.DB2INT(dt.Rows[0][0]);
            }
            catch
            {
                return 0;
            }
        }
        public static int jydt_Loadlist_Count(string sqlwhere, int state = 1)
        {
            try
            {
                DataTable dt = new DataTable();
                DBMysql db = new DBMysql();
                db.ExecuteQueryOpen();
                dt = db.ExecuteQuery("select COUNT(*) from chengguo where  CGPubstate = " + state.ToString() + sqlwhere);
                db.ExecuteQueryClose();
                return DBMysql.DB2INT(dt.Rows[0][0]);
            }
            catch
            {
                return 0;
            }
        }
        public static int jydt_Loadlist_Count_xq(string sqlwhere, int state = 1)
        {
            try
            {
                DataTable dt = new DataTable();
                DBMysql db = new DBMysql();
                db.ExecuteQueryOpen();
                dt = db.ExecuteQuery("select COUNT(*) from need where  PubState = " + state.ToString() + sqlwhere);
                db.ExecuteQueryClose();
                return DBMysql.DB2INT(dt.Rows[0][0]);
            }
            catch
            {
                return 0;
            }
        }
    }
}