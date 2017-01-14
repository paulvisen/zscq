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
    public class UserDao
    {
        internal static DataTable GetUser(string username)
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();
                string sql = "select * from UserSimple where UserName = @username";
                dt = db.ExecuteQuery(sql, new MySqlParameter("@username", username));
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }

        internal static User GetUser()
        {
            if (HttpContext.Current.Session["user"] != null)
            {
                return HttpContext.Current.Session["user"] as User;
            }
            else
            {
                if (HttpContext.Current.User.Identity.Name == null)
                {
                    return null;
                }
                User user = new User();
                DataTable dt = UserDao.GetUser(HttpContext.Current.User.Identity.Name);
                user.UserID = Tools.DB2INT(dt.Rows[0]["UserID"]);
                user.UserName = Tools.DB2ST(dt.Rows[0]["UserName"]);
                user.NickName = Tools.DB2ST(dt.Rows[0]["NickName"]);
                user.Email = Tools.DB2ST(dt.Rows[0]["Email"]);
                user.UserType = (enumUserType)Tools.DB2INT(dt.Rows[0]["UserType"]);
                user.Phone = Tools.DB2ST(dt.Rows[0]["Phone"]);
                user.auth = Tools.DB2INT(dt.Rows[0]["auth"]);
                HttpContext.Current.Session["user"] = user;
                return user;
            }           
        }

        internal static DataTable GetExpertDt(string username)
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();
                string sql = "select a.UserID,a.UserName,a.NickName,a.Email,a.UserType,a.Phone,a.auth," + 
                    "b.ZJQualification,b.ZJGraduation,b.ZJTitle,b.ResearchArea,b.Address,b.Awards,b.ZJPhoto " + 
                    "from (select * from usersimple where UserName = @username and UserType = " + (int)enumUserType.Expert + 
                    ") as a inner join zhuanjiainfo as b on a.UserID = b.UserID";
                dt = db.ExecuteQuery(sql, new MySqlParameter("@username", username));                
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }

        internal static Expert GetExpert(string username)
        {
            DataTable dt = GetExpertDt(username);
            if (dt != null && dt.Rows.Count != 0)
            {
                Expert expert = new Expert();
                expert.UserID = Tools.DB2INT(dt.Rows[0]["UserID"]);
                expert.UserName = Tools.DB2ST(dt.Rows[0]["UserName"]);
                expert.NickName = Tools.DB2ST(dt.Rows[0]["NickName"]);
                expert.Email = Tools.DB2ST(dt.Rows[0]["Email"]);
                expert.UserType = (enumUserType)Tools.DB2INT(dt.Rows[0]["UserType"]);
                expert.Phone = Tools.DB2ST(dt.Rows[0]["Phone"]);
                expert.auth = Tools.DB2INT(dt.Rows[0]["auth"]);
                expert.Qualification = Tools.DB2ST(dt.Rows[0]["ZJQualification"]);
                expert.Graduation = Tools.DB2ST(dt.Rows[0]["ZJGraduation"]);
                expert.ExpertTitle = Tools.DB2ST(dt.Rows[0]["ZJTitle"]);
                expert.ResearchArea = Tools.DB2ST(dt.Rows[0]["ResearchArea"]);
                expert.Address = Tools.DB2ST(dt.Rows[0]["Address"]);
                expert.Awards = Tools.DB2ST(dt.Rows[0]["Awards"]);
                expert.Photo = Tools.DB2ST(dt.Rows[0]["ZJPhoto"]);
                return expert;
            }
            else
            {
                return null;
            }
        }

        internal static DataTable GetCompanyDt(string username)
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();
                string sql = "select a.UserID,a.UserName,a.NickName,a.Email,a.UserType,a.Phone,a.auth," +
                    "b.Name,b.ContactPerson,b.BusinessLicenseNum,b.LicenseImg,b.Area,b.Address,b.Introduce,b.RegMoney,b.MainCustomer " +
                    "from (select * from usersimple where UserName = @username and UserType = " + (int)enumUserType.Company +
                    ") as a inner join kejiteaminfo as b on a.UserID = b.UserID";
                dt = db.ExecuteQuery(sql, new MySqlParameter("@username", username));
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }

        internal static Company GetCompany(string username)
        {
            DataTable dt = GetCompanyDt(username);
            if (dt != null && dt.Rows.Count != 0)
            {
                Company company = new Company();
                company.UserID = Tools.DB2INT(dt.Rows[0]["UserID"]);
                company.UserName = Tools.DB2ST(dt.Rows[0]["UserName"]);
                company.NickName = Tools.DB2ST(dt.Rows[0]["NickName"]);
                company.Email = Tools.DB2ST(dt.Rows[0]["Email"]);
                company.UserType = (enumUserType)Tools.DB2INT(dt.Rows[0]["UserType"]);
                company.Phone = Tools.DB2ST(dt.Rows[0]["Phone"]);
                company.auth = Tools.DB2INT(dt.Rows[0]["auth"]);
                company.ComName = Tools.DB2ST(dt.Rows[0]["Name"]);
                company.LegalRepresentative = Tools.DB2ST(dt.Rows[0]["ContactPerson"]);
                company.BusinessLicenseNum = Tools.DB2ST(dt.Rows[0]["BusinessLicenseNum"]);
                company.LicenseImg = Tools.DB2ST(dt.Rows[0]["LicenseImg"]);
                company.Area = Tools.DB2ST(dt.Rows[0]["Area"]);
                company.Address = Tools.DB2ST(dt.Rows[0]["Address"]);
                company.Introduce = Tools.DB2ST(dt.Rows[0]["Introduce"]);
                company.RegMoney = Tools.DB2INT(dt.Rows[0]["RegMoney"]);
                company.MainCustomer = Tools.DB2ST(dt.Rows[0]["MainCustomer"]);
                return company;
            }
            else
            {
                return null;
            }
        }

        //internal static DataTable GetAcademyDt(string username)
        //{
        //    try
        //    {
        //        DataTable dt;
        //        DataBase db = new DataBase();
        //        db.ExecuteQueryOpen();
        //        string sql = "select a.UserID,a.UserName,a.NickName,a.Email,a.UserType,a.Phone,a.auth," +
        //            "b.Name,b.Area,b.Address,b.Introduce,b.SubjectType " +
        //            "from (select * from usersimple where UserName = @username";
        //    }
        //}

        internal static DataTable GetUserList(int page, int rows, int type = -1, string sqlWhere = "")
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();
                string sql = "select UserID, UserName, NickName, Email, Phone from usersimple";
                if (type != -1)
                {
                    sql += " where UserType = " + type;
                }
                if (sqlWhere != "")
                {
                    sql += sqlWhere;
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

        internal static int GetUserListCount(int page, int rows, int type = -1, string sqlWhere = "")
        {
            DataTable dt;
            DataBase db = new DataBase();
            db.ExecuteQueryOpen();
            string sql = "select count(*) from usersimple";
            if (type != -1)
            {
                sql += " where UserType = " + type;
            }
            if (sqlWhere != "")
            {
                sql += sqlWhere;
            }
            dt = db.ExecuteQuery(sql);
            db.ExecuteQueryClose();
            return Tools.DB2INT(dt.Rows[0][0]);
        }

        internal static bool UpdateUser(User user)
        {
            if (user.UserID == 0)
            {
                return false;
            }

            List<string> keys = new List<string>(){
                "UserName",
                "NickName",
                "Email",
                "Phone"
            };
            List<object> values = new List<object>(){
                user.UserName,
                user.NickName,
                user.Email,
                user.Phone
            };
            bool ret = DB.TableFromKeyInt_Update(user.UserID, keys, values, "usersimple", "UserID");
            return ret;
        }

        internal static bool CheckUserName(string username)
        {
            try
            {
                DataTable dt = DB.TableFromKeyString_Select(username, "usersimple", "UserName", true);
                if (dt != null && dt.Rows.Count > 0)
                {
                    int count = Tools.DB2INT(dt.Rows[0][0]);
                    return count > 0;
                }
                return false;
            }
            catch
            {
                return false;
            }
        }

        internal static bool AddUser(string username, string password)
        {
            List<string> keys = new List<string>(){
                "UserName",
                "Password"
            };

            List<object> values = new List<object>(){
                username,
                password
            };

            int id = DB.TableFromKeyInt_Insert_Identity(keys, values, "usersimple");
            return id > 0;
        }

        internal static bool DeleteUser(int id)
        {
            return DB.TableFromKeyInt_Delete(id, "usersimple", "UseID");
        }
    }
}