using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using zscq.cs;
using System.Data;
using MySql.Data.MySqlClient;

namespace zscq.cs
{
    public class mDB
    {
        public static int GetUserId(string username)
        {
            try
            {
                DataTable dt = new DataTable();
                DBMysql db = new DBMysql();
                db.ExecuteQueryOpen();
                //string sql = "select * from ( select ROW_NUMBER() OVER (order by pp.id desc ) as num from xxjy as pp where pp.pubstate = "+state+" ) as a where a.num between " +begidx+" "+"and"+" "+endidx+" ";
                //string sql = "select * from xxjy as pp where pp.pubstate = " + state +  " ";
                //////Unknown column ‘xxx’ in ‘where clause’
                ///////username为字符串类型必须要包含在引号内
                string sql = "select UserID from usersimple where UserName = '" + username + "' ";
                dt = db.ExecuteQuery(sql);
                db.ExecuteQueryClose();
                return DBMysql.DB2INT(dt.Rows[0][0]); ;
            }
            catch
            {
                return 0;
            }
        }

        public int AddBuy(chengguojiaoyi model) {
            string sql = @"insert into chengguojiaoyi (JiaoYiID,LCGID,BuyerID,Operate,OpDate,Price,Sugg,Comm,LUserID,Trash) values(null,?LCGID,?BuyerID,?Operate,?OpDate,?Price,?Sugg,?Comm,?LUserID,?Trash)";
            DBMysql db = new DBMysql();
            db.ExecuteQueryOpen();
            MySqlParameter[] sqlpar = new MySqlParameter[]{
            new MySqlParameter("?LCGID",model.LCGID),
            new MySqlParameter("?BuyerID",model.BuyerID),
            new MySqlParameter("?Operate",model.Operate),
            new MySqlParameter("?OpDate",model.OpDate),
            new MySqlParameter("?Price",model.Price),
            new MySqlParameter("?Sugg",model.Sugg),
            new MySqlParameter("?Comm",model.Comm),
            new MySqlParameter("?LUserID",model.LUserID),
            new MySqlParameter("?Trash",model.Trash)
            };
            int tb = DBMysql.ExecuteSql(sql, sqlpar);
            db.ExecuteQueryClose();
            return tb;
        }
        public int EditBuy(chengguojiaoyi model)
        {
            string sql = @"update chengguojiaoyi set Operate=?Operate,OpDate=?OpDate,Sugg=?Sugg where LCGID=?LCGID and BuyerID=?BuyerID and Operate=1 ";
            DBMysql db = new DBMysql();
            db.ExecuteQueryOpen();
            MySqlParameter[] sqlpar = new MySqlParameter[]{
            new MySqlParameter("?LCGID",model.LCGID),
            new MySqlParameter("?BuyerID",model.BuyerID),
            new MySqlParameter("?Operate",model.Operate),
            new MySqlParameter("?OpDate",model.OpDate),
            new MySqlParameter("?Sugg",model.Sugg)
            };
            int tb=DBMysql.ExecuteSql(sql, sqlpar);
            db.ExecuteQueryClose();
            return tb;
        }

        public int AddBook(chengguoop model)
        {
            string sql = @"insert into chengguoop (CGOpID,ChengGuoID,OpByID,Operation,OpDate) values(null,?ChengGuoID,?OpByID,?Operation,?OpDate)";
            DBMysql db = new DBMysql();
            db.ExecuteQueryOpen();
            MySqlParameter[] sqlpar = new MySqlParameter[]{
            new MySqlParameter("?ChengGuoID",model.ChengGuoID),
            new MySqlParameter("?OpByID",model.OpByID),
            new MySqlParameter("?Operation",model.Operation),
            new MySqlParameter("?OpDate",model.OpDate)
            };
            int tb=DBMysql.ExecuteSql(sql, sqlpar);
            db.ExecuteQueryClose();
            return tb;
        }
        public int EditBook(chengguoop model)
        {
            string sql = @"update chengguoop set Operation=?Operation,OpDate=?OpDate where ChengGuoID=?ChengGuoID and OpByID=?OpByID and Operation=1";
            DBMysql db = new DBMysql();
            db.ExecuteQueryOpen();
            MySqlParameter[] sqlpar = new MySqlParameter[]{
            new MySqlParameter("?ChengGuoID",model.ChengGuoID),
            new MySqlParameter("?OpByID",model.OpByID),
            new MySqlParameter("?Operation",model.Operation),
            new MySqlParameter("?OpDate",model.OpDate)
            };
            int tb= DBMysql.ExecuteSql(sql, sqlpar);
            db.ExecuteQueryClose();
            return tb;
        }

        public int AddIndustry(chengguo_model model)
        {
            string sql = @"insert into chengguo (id,CGName,RegTime,CGCompany,ConPerson,ConPhone,PatentNum,CGType,TransMode,TransPrice,CGDetails_short,CGImg,CGPubstate,isByExp,keyword,image_list,admin_com,unit_com,main_person,main_person_phone,CGComponyid,CGField) 
                            values(null,?CGName,?RegTime,?CGCompany,?ConPerson,?ConPhone,?PatentNum,?CGType,?TransMode,?TransPrice,?CGDetails_short,?CGImg,?CGPubstate,?isByExp,?keyword,?image_list,?admin_com,?unit_com,?main_person,?main_person_phone,?CGComponyid,?CGField)";
            DBMysql db = new DBMysql();
            db.ExecuteQueryOpen();
            MySqlParameter[] sqlpar = new MySqlParameter[]
            {
                new MySqlParameter("?CGName",model.CGName),
                new MySqlParameter("?RegTime",model.RegTime),
                new MySqlParameter("?CGCompany",model.CGCompany),
                new MySqlParameter("?ConPerson",model.ConPerson),
                new MySqlParameter("?ConPhone",model.ConPhone),
                new MySqlParameter("?PatentNum",model.PatentNum),
                new MySqlParameter("?CGType",model.CGType),
                new MySqlParameter("?TransMode",model.TransMode),
                new MySqlParameter("?TransPrice",model.TransPrice),
                new MySqlParameter("?CGDetails_short",model.CGDetails_short),
                new MySqlParameter("?CGImg",model.CGImg),
                new MySqlParameter("?CGPubstate",model.CGPubstate),
                new MySqlParameter("?isByExp",model.isByExp),
                new MySqlParameter("?keyword",model.keyword),
                new MySqlParameter("?image_list",model.image_list),
                new MySqlParameter("?admin_com",model.admin_com),
                new MySqlParameter("?unit_com",model.unit_com),
                new MySqlParameter("?main_person",model.main_person),
                new MySqlParameter("?main_person_phone",model.main_person_phone),
                new MySqlParameter("?CGComponyid",model.CGComponyid),
                new MySqlParameter("?CGField",model.CGField)
            };
            int tb = DBMysql.ExecuteSql(sql, sqlpar);
            db.ExecuteQueryClose();
            return tb;
        }
        public int EditIndustry(chengguo_model model)
        {
            
            string sql = @"update chengguo set CGName=?CGName,RegTime=?RegTime,CGCompany=?CGCompany,ConPerson=?ConPerson,ConPhone=?ConPhone,PatentNum=?PatentNum,CGType=?CGType,TransMode=?TransMode,TransPrice=?TransPrice,CGDetails_short=?CGDetails_short,CGImg=?CGImg,CGPubstate=?CGPubstate,isByExp=?isByExp,keyword=?keyword,image_list=?image_list,admin_com=?admin_com,unit_com=?unit_com,main_person=?main_person,main_person_phone=?main_person_phone,CGComponyid=?CGComponyid,CGField=?CGField where id=?cgid ";
            DBMysql db = new DBMysql();
            db.ExecuteQueryOpen();
            MySqlParameter[] sqlpar = new MySqlParameter[]
            {
                new MySqlParameter("?CGName",model.CGName),
                new MySqlParameter("?RegTime",model.RegTime),
                new MySqlParameter("?CGCompany",model.CGCompany),
                new MySqlParameter("?ConPerson",model.ConPerson),
                new MySqlParameter("?ConPhone",model.ConPhone),
                new MySqlParameter("?PatentNum",model.PatentNum),
                new MySqlParameter("?CGType",model.CGType),
                new MySqlParameter("?TransMode",model.TransMode),
                new MySqlParameter("?TransPrice",model.TransPrice),
                new MySqlParameter("?CGDetails_short",model.CGDetails_short),
                new MySqlParameter("?CGImg",model.CGImg),
                new MySqlParameter("?CGPubstate",model.CGPubstate),
                new MySqlParameter("?isByExp",model.isByExp),
                new MySqlParameter("?keyword",model.keyword),
                new MySqlParameter("?image_list",model.image_list),
                new MySqlParameter("?admin_com",model.admin_com),
                new MySqlParameter("?unit_com",model.unit_com),
                new MySqlParameter("?main_person",model.main_person),
                new MySqlParameter("?main_person_phone",model.main_person_phone),
                new MySqlParameter("?CGComponyid",model.CGComponyid),
                new MySqlParameter("?CGField",model.CGField),
                 new MySqlParameter("?cgid",model.id)
            };
            int tb = DBMysql.ExecuteSql(sql, sqlpar);
            db.ExecuteQueryClose();
            return tb;
        }
        public int AddIndustry_need(need_model model)
        {
            string sql = @"insert into need (NeedID,UserID,Name,PubDate,CommPerson,BriefIntro,BelongField,Mature,TechLevel,TransStyle,PriceLow,PriceHigh,CommTel,transclass,PubState,KeyWords) 
                            values(null,?UserID,?Name,?PubDate,?CommPerson,?BriefIntro,?BelongField,?Mature,?TechLevel,?TransStyle,?PriceLow,?PriceHigh,?CommTel,?transclass,?PubState,?KeyWords)";
            DBMysql db = new DBMysql();
            db.ExecuteQueryOpen();
            MySqlParameter[] sqlpar = new MySqlParameter[]
            {
                new MySqlParameter("?UserID",model.UserID),
                new MySqlParameter("?Name",model.Name),
                new MySqlParameter("?PubDate",model.PubDate),
                new MySqlParameter("?CommPerson",model.CommPerson),
                new MySqlParameter("?BriefIntro",model.BriefIntro),
                new MySqlParameter("?BelongField",model.BelongField),
                new MySqlParameter("?Mature",model.Mature),
                new MySqlParameter("?TechLevel",model.TechLevel),
                new MySqlParameter("?TransStyle",model.TransStyle),
                new MySqlParameter("?PriceLow",model.PriceLow),
                new MySqlParameter("?PriceHigh",model.PriceHigh),
                new MySqlParameter("?CommTel",model.CommTel),
                new MySqlParameter("?transclass",model.transclass),
                new MySqlParameter("?PubState",model.PubState),
                new MySqlParameter("?KeyWords",model.KeyWords)
            };
            int tb = DBMysql.ExecuteSql(sql, sqlpar);
            db.ExecuteQueryClose();
            return tb;
        }

        public int AddIndustry_xxjy(xxjy_model model)
        {
            string sql = @"insert into xxjy (id,xxjy_name,start_time,end_time,host,location,details_short,image_url,state,pubstate,con_phone,main_content,timeline,image_list,UserId) 
                            values(null,?xxjy_name,?start_time,?end_time,?host,?location,?details_short,?image_url,?state,?pubstate,?con_phone,?main_content,?timeline,?image_list,?UserId)";
            DBMysql db = new DBMysql();
            db.ExecuteQueryOpen();
            MySqlParameter[] sqlpar = new MySqlParameter[]
            {
                new MySqlParameter("?xxjy_name",model.xxjy_name),
                new MySqlParameter("?start_time",model.start_time),
                new MySqlParameter("?end_time",model.end_time),
                new MySqlParameter("?host",model.host),
                new MySqlParameter("?location",model.location),
                new MySqlParameter("?details_short",model.details_short),
                new MySqlParameter("?image_url",model.image_url),
                new MySqlParameter("?state",model.state),
                new MySqlParameter("?pubstate",model.pubstate),
                new MySqlParameter("?con_phone",model.con_phone),
                new MySqlParameter("?main_content",model.main_content),
                new MySqlParameter("?timeline",model.timeline),
                new MySqlParameter("?image_list",model.image_list),
                new MySqlParameter("?UserId",model.UserId)
            };
            int tb = DBMysql.ExecuteSql(sql, sqlpar);
            db.ExecuteQueryClose();
            return tb;
        }

    }
}