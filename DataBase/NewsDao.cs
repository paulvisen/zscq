using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;
using zscq.BasicCode;
using zscq.Models;

namespace zscq.DataBase
{
    public class NewsDao
    {
        /// <summary>
        /// 获取新闻列表
        /// </summary>
        /// <param name="page"></param>
        /// <param name="rows"></param>
        /// <param name="type"></param>
        /// <param name="state"></param>
        /// <returns></returns>
        internal static DataTable LoadNewsList(int page, int rows, int type = -1, int state = 1, string sqlWhere = "")
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();
                string sql = "select DATE_FORMAT(PubDate,'%Y/%m/%d') as PubDate,NewsID,Title,SubType from News where PubState = " + state;
                if (type != -1)
                {
                    sql += " and SubType = " + type;
                }
                if (sqlWhere != "")
                {
                    sql += sqlWhere;
                }
                sql += " order by PubDate desc, NewsID desc limit " + ((page-1) * rows) + "," + rows;
                dt = db.ExecuteQuery(sql);
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// 获取新闻数量
        /// </summary>
        /// <param name="type"></param>
        /// <param name="state"></param>
        /// <returns></returns>
        internal static int GetNewsListCount(int type = -1, int state = 1, string sqlWhere = "")
        {
            DataTable dt;
            DataBase db = new DataBase();
            db.ExecuteQueryOpen();
            string sql = "select count(*) from News where PubState = " + state;
            if (type != -1)
            {
                sql += " and SubType = " + type;
            }
            if (sqlWhere != "")
            {
                sql += sqlWhere;
            }
            dt = db.ExecuteQuery(sql);
            db.ExecuteQueryClose();
            return Tools.DB2INT(dt.Rows[0][0]);
        }

        internal static DataTable GetHotNews(int count)
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();
                dt = db.ExecuteQuery("select NewsID, Title, MainContentText from news where PubState = 1 order by ReadTimes desc limit " + count);
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// 加载一条新闻
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        internal static DataTable LoadNews(int id)
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();
                dt = db.ExecuteQuery("set @rdt = (select ReadTimes from News where NewsID = @id and PubState = 1) + 1;" +
                    "select a.*, b.PNWPIC from News as a left join PicNews as b on a.NewsID = b.PNWUniID and b.PNWState != 255 where a.PubState = 1 and a.NewsID = @id;" +
                    "update News set ReadTimes = @rdt where NewsID = @id and PubState = 1;", new MySqlParameter("@id", id));
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }

        internal static News LoadNewsModel(int id)
        {
            try
            {
                DataTable dt = LoadNews(id);
                if (dt != null && dt.Rows.Count > 0)
                {
                    News news = new News();
                    news.NewsID = Tools.DB2INT(dt.Rows[0]["NewsID"]);
                    news.PubDate = Tools.DB2Date(dt.Rows[0]["PubDate"]);
                    news.MainContentRIA = Tools.DB2ST(dt.Rows[0]["MainContentRIA"]);
                    news.MainContentText = Tools.DB2ST(dt.Rows[0]["MainContentText"]);
                    news.Title = Tools.DB2ST(dt.Rows[0]["Title"]);
                    news.ReadTimes = Tools.DB2INT(dt.Rows[0]["ReadTimes"]);
                    news.UserID = Tools.DB2INT(dt.Rows[0]["UserID"]);
                    news.SubType = (enumNewsType)Tools.DB2INT(dt.Rows[0]["SubType"]);
                    news.TopPicUrl = Tools.DB2ST(dt.Rows[0]["PNWPIC"]);
                    news.OnTop = news.TopPicUrl.Equals(String.Empty);
                    return news;
                }
                else
                {
                    return null;
                }
            }
            catch
            {
                return null;
            }

        }

        internal static bool PubNews(News news)
        {
            List<string> keys = new List<string>(){
                "Title",
                "MainContentRIA",
                "MainContentText",
                "PubDate",
                "PubState",
                "SubType",
                "UserID"
            };
            List<object> values = new List<object>(){
                news.Title,
                news.MainContentRIA,
                news.MainContentText,
                news.PubDate,
                (int)enumPublicState.Success,
                (int)news.SubType,
                UserDao.GetUser().UserID
            };
            news.NewsID = DB.TableFromKeyInt_Insert_Identity(keys, values, "News");
            if (news.NewsID == 0)
            {
                return false;
            }
            if (news.OnTop)
            {
                PubPicNews(news);
            }
            return true;
        }

        internal static bool UpdateNews(News news)
        {
            if (news.NewsID == 0)
            {
                return false;
            }
            List<string> keys = new List<string>(){
                "Title",
                "MainContentRIA",
                "MainContentText",
                "PubDate",
                "PubState",
                "SubType"
            };
            List<object> values = new List<object>(){
                news.Title,
                news.MainContentRIA,
                news.MainContentText,
                news.PubDate,
                (int)enumPublicState.Success,
                (int)news.SubType
            };

            bool ret = DB.TableFromKeyInt_Update(news.NewsID, keys, values, "News", "NewsID");
            if (ret)
            {
                ret = DeletePicNews(news.NewsID);
                if (ret && news.OnTop)
                {
                    PubPicNews(news);
                }
            }
            return ret;
        }

        internal static bool DeleteNews(int id)
        {
            List<string> keys = new List<string>() { "PubState" };
            List<object> values = new List<object>() { (int)enumPublicState.Deleted };
            List<string> conkeys = new List<string>() { "NewsID" };
            List<object> convalues = new List<object>() { id };
            bool ret = DB.TableFromKeyInt_Update_WithCondition(keys, values, conkeys, convalues, "News");
            if (ret)
            {
                ret = DeletePicNews(id);
            }
            return ret;
        }

        internal static DataTable LoadPicNews()
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();
                dt = db.ExecuteQuery("select * from PicNews where PNWState = " + (int)enumPublicState.Success + " order by PNWID desc limit 5");
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }

        internal static DataTable LoadPicNews(int page, int rows)
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();
                dt = db.ExecuteQuery("select * from PicNews where PNWState != " + (int)enumPublicState.Deleted
                    + " order by PNWState desc, PNWID desc limit " + ((page - 1) * rows) + "," + rows);
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }

        internal static int GetPicNewsCount()
        {
            DataTable dt;
            DataBase db = new DataBase();
            db.ExecuteQueryOpen();
            dt = db.ExecuteQuery("select count(*) from PicNews where PNWState != " + (int)enumPublicState.Deleted);
            db.ExecuteQueryClose();
            return Tools.DB2INT(dt.Rows[0][0]);
        }

        internal static bool SetPicNewsOnTop(int id)
        {
            List<string> keys = new List<string>() { "PNWState" };
            List<object> values = new List<object>() { (int)enumPublicState.Success };
            List<string> conkeys = new List<string>() { "PNWID" };
            List<object> convalues = new List<object>() { id };
            return DB.TableFromKeyInt_Update_WithCondition(keys, values, conkeys, convalues, "PicNews");
        }

        internal static bool CancelPicNewsOnTop(int id)
        {
            List<string> keys = new List<string>() { "PNWState" };
            List<object> values = new List<object>() { (int)enumPublicState.Reserver };
            List<string> conkeys = new List<string>() { "PNWID" };
            List<object> convalues = new List<object>() { id };
            return DB.TableFromKeyInt_Update_WithCondition(keys, values, conkeys, convalues, "PicNews");
        }

        private static void PubPicNews(News news)
        {
            List<string> keys = new List<string>()
                {
                    "PNWURL",
                    "PNWPIC",
                    "PNWState",
                    "PNWTitle",
                    "PNWTable",
                    "PNWUniID"
                };
            List<object> values = new List<object>(){
                    "/Views/News/NewsDetail.aspx?id=" + news.NewsID,
                    news.TopPicUrl,
                    (int)enumPublicState.Reserver,
                    news.Title,
                    "News",
                    news.NewsID
                };
            DB.TableFromKeyInt_Insert_Identity(keys, values, "PicNews");
        }

        internal static bool DeletePicNews(int id)
        {
            List<string> keys = new List<string>() { "PNWState" };
            List<object> values = new List<object>() { (int)enumPublicState.Deleted };
            List<string> conkeys = new List<string>() { "PNWTable", "PNWUniID" };
            List<object> convalues = new List<object>() { "News", id };
            return DB.TableFromKeyInt_Update_WithCondition(keys, values, conkeys, convalues, "PicNews");
        }

    }
}