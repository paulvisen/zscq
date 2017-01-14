using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;
using zscq.BasicCode;
using System.IO;

namespace zscq.DataBase
{
    public class DownloadDao
    {
        internal static DataTable GetDownloadList(int page, int rows, int type = -1, string sqlWhere = "")
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();
                string sql = "select * from Download where DownloadTrash = 0";
                if (type != -1)
                {
                    sql += " and Type = " + type;
                }
                if (sqlWhere != "")
                {
                    sql += sqlWhere;
                }
                sql += " order by PubDate desc limit " + ((page - 1) * rows) + "," + rows;
                dt = db.ExecuteQuery(sql);
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }

        internal static int GetDownloadListCount(int type = -1, string sqlWhere = "")
        {
            DataTable dt;
            DataBase db = new DataBase();
            db.ExecuteQueryOpen();
            string sql = "select count(*) from Download where DownloadTrash = 0";
            if (type != -1)
            {
                sql += " and Type = " + type;
            }
            if (sqlWhere != "")
            {
                sql += sqlWhere;
            }
            dt = db.ExecuteQuery(sql);
            db.ExecuteQueryClose();
            return Tools.DB2INT(dt.Rows[0][0]);
        }

        internal static DataTable GetDownloadOne(int id){
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();
                dt = db.ExecuteQuery("select * from download where DownloadID = @id and DownloadTrash = 0", new MySqlParameter("@id", id));
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }

        internal static int CreateEmptyItem()
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();
                dt = db.ExecuteQuery("insert into download values();select @@IDENTITY");
                db.ExecuteQueryClose();
                return Tools.DB2INT(dt.Rows[0][0]);
            }
            catch
            {
                return 0;
            }
        }

        internal static DataTable GetFileInfo(int id)
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();
                dt = db.ExecuteQuery("select FileID, FileName, FileDescription from filesinfo where DownloadID = @id and FileState in (0,1)", new MySqlParameter("@id", id));
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }

        internal static DataTable DownloadFile(int fid)
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();
                dt = db.ExecuteQuery("select FileName, FileData from filesinfo where FileID = @fid and FileState in (0,1)", new MySqlParameter("@fid", fid));
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }

        internal static bool UpdateDownload(int id, string title, int type)
        {
            List<string> keys = new List<string>(){
                "Title",
                "PubDate",
                "UserID",
                "Type"
            };
            List<object> values = new List<object>(){
                title,
                DateTime.Now,
                UserDao.GetUser().UserID,
                type
            };
            List<string> conkeys = new List<string>(){ "DownloadID" };
            List<object> convalues = new List<object>() { id };
            bool ret = DB.TableFromKeyInt_Update_WithCondition(keys, values, conkeys, convalues, "download");
            if (ret)
            {
                //将准备添加的文件转换为添加状态
                keys = new List<string>() { "FileState" };
                values = new List<object>() { (int)enumFileState.Inserted };
                conkeys = new List<string>() { "DownloadID", "FileState" };
                convalues = new List<object>() { id, (int)enumFileState.PreInsert };
                bool ret1 = DB.TableFromKeyInt_Update_WithCondition(keys, values, conkeys, convalues, "filesinfo");

                //将准备删除的文件转换为删除状态
                values = new List<object>() { (int)enumFileState.Deleted };
                convalues = new List<object>() { id, (int)enumFileState.PreDelete };
                bool ret2 = DB.TableFromKeyInt_Update_WithCondition(keys, values, conkeys, convalues, "filesinfo");

                ret = ret1 && ret2;
            }
            return ret;
        }

        internal static bool CancelUpdate(int id)
        {
            //将准备添加的文件转换为删除状态
            List<string> keys = new List<string>() { "FileState" };
            List<object> values = new List<object>() { (int)enumFileState.Deleted };
            List<string> conkeys = new List<string>() { "DownloadID", "FileState" };
            List<object> convalues = new List<object>() { id, (int)enumFileState.PreInsert };
            bool ret1 = DB.TableFromKeyInt_Update_WithCondition(keys, values, conkeys, convalues, "filesinfo");

            //将准备删除的文件恢复成已添加状态
            values = new List<object>() { (int)enumFileState.Inserted };
            convalues = new List<object>() { id, (int)enumFileState.PreDelete };
            bool ret2 = DB.TableFromKeyInt_Update_WithCondition(keys, values, conkeys, convalues, "filesinfo");
            return ret1 && ret2;
        }

        internal static bool DeleteDownload(int id)
        {
            List<string> keys = new List<string>() { "DownloadTrash" };
            List<object> values = new List<object>() { 1 };
            List<string> conkeys = new List<string>() { "DownloadID" };
            List<object> convalues = new List<object>() { id };
            bool ret = DB.TableFromKeyInt_Update_WithCondition(keys, values, conkeys, convalues, "Download");
            if (ret)
            {
                keys = new List<string>() { "FileState" };
                values = new List<object>() { 255 };
                conkeys = new List<string>() { "DownloadID" };
                convalues = new List<object>() { id };
                ret = DB.TableFromKeyInt_Update_WithCondition(keys, values, conkeys, convalues, "filesinfo");
            }
            return ret;

        }

        internal static bool DeleteFile(int id)
        {
            List<string> keys = new List<string>() { "FileState" };
            List<object> values = new List<object>() { (int)enumFileState.PreDelete };
            List<string> conkeys = new List<string>() { "FileID" };
            List<object> convalues = new List<object>() { id };
            return DB.TableFromKeyInt_Update_WithCondition(keys, values, conkeys, convalues, "filesinfo");
        }

        internal static int UploadFile(HttpPostedFile file, string fileDescription, int downloadID)
        {
            try
            {
                int len = file.ContentLength;
                Byte[] fileData = new Byte[len];
                Stream stream = file.InputStream;
                stream.Read(fileData, 0, len);

                List<string> keys = new List<string>(){
                    "FileName",
                    "FileData",
                    "FileDescription",
                    "DownloadID"
                };
                List<object> values = new List<object>(){
                    file.FileName,
                    fileData,
                    fileDescription,
                    downloadID
                };
                return DB.TableFromKeyInt_Insert_Identity(keys, values, "filesinfo");
            }
            catch
            {
                return 0;
            }
        }
    }
}