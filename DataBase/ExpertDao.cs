using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace zscq.DataBase
{
    public class ExpertDao
    {
        internal static DataTable GetExpertList(int page, int rows)
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();
                string sql = "select * from zhuanjiainfo limit " + ((page - 1) * rows) + "," + rows;
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