using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using zscq.BasicCode;

namespace zscq.DataBase
{
    public class TeamDao
    {
        internal static DataTable GetTeamList(int page, int rows, int type)
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();
                string sql = "";
                switch (type)
                {
                    case (int)enumTeamType.KJQY:
                        sql = "select Id, Name from kejiteaminfo where Type = '科技企业'";
                        break;
                    case (int)enumTeamType.GDYX:
                        sql = "select Id, Name from keyanteaminfo where Type = '高等院校'";
                        break;
                    case (int)enumTeamType.KYYS:
                        sql = "select Id, Name from keyanteaminfo where Type = '科研院所'";
                        break;
                    case (int)enumTeamType.ZJJG:
                        sql = "select Id, Name from fuwuteaminfo where Type = '中介机构'";
                        break;
                    case (int)enumTeamType.Other:
                        sql = "select Id, Name from kejiteaminfo where Type = '其他'";
                        break;
                    default:
                        sql = "select Id, Name from kejiteaminfo where Type = '科技企业'";
                        break;
                }
                sql += " limit " + ((page - 1) * rows) + "," + rows;
                dt = db.ExecuteQuery(sql);
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }

        internal static DataTable GetKejiTeamList(int page, int rows)
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();
                dt = db.ExecuteQuery("select Id, Name, Type from kejiteaminfo limit " + ((page - 1) * rows) + "," + rows);
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }

        internal static DataTable GetKeyanTeamList(int page, int rows)
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();
                dt = db.ExecuteQuery("select Id, Name, Type from keyanteaminfo limit " + ((page - 1) * rows) + "," + rows);
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }

        internal static DataTable GetFuwuTeamList(int page, int rows)
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();
                dt = db.ExecuteQuery("select Id, Name, Type from fuwuteaminfo limit " + ((page - 1) * rows) + "," + rows);
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }

        internal static DataTable GetTeamAchievementList(int page, int rows)
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();
                string sql = "select * from tuanduichengguo order by PublishTime limit " + ((page - 1) * rows) + "," + rows;
                dt = db.ExecuteQuery(sql);
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }
    }
}