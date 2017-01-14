using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;
using zscq.BasicCode;

namespace zscq.DataBase
{
    public class DB
    {
        #region select table部分

        /// <summary>
        /// 从数据库中导出字符串。
        /// 这个子函数主要用于那些关键字时UserID的表
        /// ------------------------------------------
        /// NEW SHW 1216 0020 
        /// </summary>
        /// <param name="usrid">UserID字段的值</param>
        /// <param name="tablename">需要选择的表(可选)</param>
        /// <param name="key">关键字</param>
        /// <returns>默认选择*的结果，可以提取list'string'</returns>
        static public DataTable TableFromKeyInt_Select(int usrid,
                            string tablename,
                            string key, bool count = false)
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();
                dt = db.ExecuteQuery("select " + (count ? " count( " : "") + " * " + (count ? " ) " : "") + " from " + tablename + " where " + key + " =@type",
                       new MySqlParameter("@type", usrid));
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }


        static public DataTable TableFromKeyInt_Single_Select(int usrid, string strs,
                   string tablename,
                   string key, bool count = false)
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();
                dt = db.ExecuteQuery("select " + (count ? "count( " : "") + strs + (count ? " )" : "") + " from " + tablename + " where " + key + " =@type",
                          new MySqlParameter("@type", usrid));
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }


        static public DataTable TableFromKeyInt_Single_Select(int usrid, List<string> strs,
                           string tablename,
                           string key, bool count = false)
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();

                string tos = string.Empty;
                for (int i = 0; i < strs.Count - 1; i++)
                {
                    tos += strs[i] + ",";
                }
                tos += strs.Last();

                dt = db.ExecuteQuery("select " + (count ? "count( " : "") + tos + (count ? " )" : "") + " from " + tablename + " where " + key + " =@type",
                          new MySqlParameter("@type", usrid));
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// 从关键字是Int类型的表里面抽取出数据
        /// 可以带任意多个的条件
        /// ---------------------------------
        /// </summary>
        /// <param name="usrid">用户ID</param>
        /// <param name="tablename">表名</param>
        /// <param name="key">关键字</param>
        /// <param name="conkeys">查询关键字</param>
        /// <param name="convalue">查询值</param>
        /// <returns></returns>
        static public DataTable TableFromKeyInt_Select_WithCondition(int usrid,
                            string tablename,
                            string key,
                            string conkeys = null, object convalue = null, bool count = false)
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();

                if (string.IsNullOrEmpty(conkeys))
                {

                    dt = db.ExecuteQuery("select " + (count ? " count( " : "") + " * " + (count ? " ) " : "") + " from " + tablename + " where " + key + " =@type",
                           new MySqlParameter("@type", usrid));
                }
                else
                {
                    string sql = "select " + (count ? " count( " : "") + " * " + (count ? " ) " : "") + " from " + tablename + " where " + key + " =@type " + " and " + conkeys + "=@param1 ";
                    dt = db.ExecuteQuery(sql,
                           new MySqlParameter("@type", usrid), new MySqlParameter("@param1", convalue));

                }
                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }


        /// <summary>
        /// 从关键字是Int类型的表里面抽取出数据
        /// 可以带任意多个的条件
        /// ---------------------------------
        /// 140807
        /// </summary>
        /// <param name="usrid">用户ID</param>
        /// <param name="tablename">表名</param>
        /// <param name="key">关键字</param>
        /// <param name="conkeys">查询关键字</param>
        /// <param name="convalue">查询值</param>
        /// <returns></returns>
        static public DataTable TableFromKeyInt_Select_WithCondition(int usrid,
                            List<string> conkeys, List<object> convalue,
                            string tablename,
                            string key, bool count = false
                            )
        {
            try
            {
                DataTable dt;
                DataBase db = new DataBase();
                db.ExecuteQueryOpen();


                string sqls = string.Empty;
                string strpp = string.Empty;

                MySqlParameter[] parm = new MySqlParameter[conkeys.Count + 1];
                for (int i = 0; i < conkeys.Count; i++)
                {
                    MySqlParameter temp = new MySqlParameter("@parm" + i.ToString(), convalue[i]);
                    parm[i] = (temp);
                    strpp += " and " + conkeys[i] + "=" + parm[i].ParameterName;
                }
                if (!string.IsNullOrEmpty(strpp))
                {
                    strpp = strpp.Substring(1);
                }
                parm[conkeys.Count] = new MySqlParameter("@type", usrid);

                string sql = "select " + (count ? " count( " : "") + " * " + (count ? " ) " : "") + " from " + tablename + " where " + key + " =@type " + strpp;
                dt = db.ExecuteQuery(sql, parm);

                db.ExecuteQueryClose();
                return dt;
            }
            catch
            {
                return null;
            }
        }



        /// <summary>
        /// 从数据库中导出字符串。
        /// 这个子函数主要用于那些关键字时UserID的表
        /// ------------------------------------------
        /// NEW SHW 1216 2157
        /// </summary>
        /// <param name="usrid">UserName字段的值</param>
        /// <param name="tablename">需要选择的表(可选)</param>
        /// <param name="key">关键字</param>
        /// <returns>默认选择*的结果，可以提取list'string'</returns>
        static public DataTable TableFromKeyString_Select(string username,
                            string tablename,
                            string key, bool count = false)
        {
            DataTable dt;
            DataBase db = new DataBase();
            db.ExecuteQueryOpen();
            dt = db.ExecuteQuery("select " + (count ? " count( " : "") + " * " + (count ? " ) " : "") + " from " + tablename + " where " + key + " =@type",
                   new MySqlParameter("@type", username));
            db.ExecuteQueryClose();
            return dt;
        }


        #endregion


        #region update 部分
        /// <summary>
        /// update 
        /// -----------------------------------------
        /// //修改 new 高效率
        /// </summary>
        /// <param name="usrid">用户ID</param>
        /// <param name="toEditCol">需要修改的表的字段的名称</param>
        /// <param name="toEditParam">需要修改成为的数值</param>
        /// <param name="tablename">表名</param>
        /// <param name="key">关键字</param>
        /// <returns>执行顺利</returns>
        static public bool TableFromKeyInt_Update(int usrid,
                           string toEditCol,
                           object toEditParam,
                           string tablename,
                           string key)
        {
            return TableFromKeyInt_Update(usrid, new List<string>() { toEditCol }, new List<object>() { toEditParam }, tablename, key);
        }

        /// <summary>
        /// update 
        /// -----------------------------------------
        /// //修改 new 高效率
        /// </summary>
        /// <param name="usrid">用户ID</param>
        /// <param name="toEditCols">需要修改的表的字段的名称</param>
        /// <param name="toEditParams">需要修改成为的数值</param>
        /// <param name="tablename">表名</param>
        /// <param name="key">关键字</param>
        /// <returns>执行顺利</returns>
        static public bool TableFromKeyInt_Update(int usrid,
                            List<string> toEditCols,
                            List<object> toEditParams,
                            string tablename,
                            string key)
        {
            bool ret = false;
            try
            {

                string sqls = string.Empty;
                string update = string.Empty;

                MySqlParameter[] parm = new MySqlParameter[toEditCols.Count + 1];
                for (int i = 0; i < toEditCols.Count; i++)
                {
                    MySqlParameter temp = new MySqlParameter("@parm" + i.ToString(), toEditParams[i]);
                    parm[i] = (temp);
                    update += ", " + toEditCols[i] + "=@parm" + i.ToString() + " ";
                }

                if (!string.IsNullOrEmpty(update))
                {
                    update = update.Substring(1);
                }
                parm[toEditCols.Count] = new MySqlParameter("@userid", usrid);
                DataBase data = new DataBase();
                data.ExecuteNonQueryOpen();

                data.ExecuteNonQuery("Update " + tablename + " set " + update + " where " + key + "=@userid ", parm);

                data.ExecuteNonQueryClose();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }
        /// <summary>
        /// 条件更新，已修改为高效率的
        /// </summary>
        /// <param name="usrid"></param>
        /// <param name="toEditCols"></param>
        /// <param name="toEditParams"></param>
        /// <param name="condkey"></param>
        /// <param name="condobj"></param>
        /// <param name="tablename"></param>
        /// <param name="key"></param>
        /// <returns></returns>
        static public bool TableFromKeyInt_Update_WithCondition(int usrid,
                    List<string> toEditCols,
                    List<object> toEditParams,
                    string condkey,
                    object condobj,
                    string tablename,
                    string key)
        {
            return TableFromKeyInt_Update_WithCondition(usrid, toEditCols, toEditParams,
                new List<string> { condkey }, new List<object> { condobj }, tablename, key);
        }


        /// <summary>
        /// 有条件的修改
        /// 140827
        /// </summary>
        /// <param name="usrid"></param>
        /// <param name="toEditCols">需要修改的</param>
        /// <param name="toEditParams"></param>
        /// <param name="condkey">一个条件</param>
        /// <param name="condobj"></param>
        /// <param name="tablename"></param>
        /// <param name="key"></param>
        /// <returns></returns>
        static public bool TableFromKeyInt_Update_WithCondition(int usrid,
                            List<string> toEditCols,
                            List<object> toEditParams,
                            List<string> condkey,
                            List<object> condobj,
                            string tablename,
                            string key)
        {
            bool ret = false;
            try
            {



                string sqls = string.Empty;
                string update = string.Empty;
                string parmparms = string.Empty;

                MySqlParameter[] parm = new MySqlParameter[toEditCols.Count + condkey.Count + 1];
                for (int i = 0; i < toEditCols.Count; i++)
                {
                    MySqlParameter temp = new MySqlParameter("@parm" + i.ToString(), toEditParams[i]);
                    parm[i] = (temp);
                    update += ", " + toEditCols[i] + "=@parm" + i.ToString() + " ";
                }

                for (int i = 0; i < condkey.Count; i++)
                {
                    MySqlParameter temp = new MySqlParameter("@sparm" + i.ToString(), condobj[i]);
                    parm[i + toEditCols.Count] = (temp);
                    parmparms += " and " + condkey[i] + "=@sparm" + i.ToString() + " ";
                }
                if (!string.IsNullOrEmpty(update))
                {
                    update = update.Substring(1);
                }
                parm[toEditCols.Count + condkey.Count] = new MySqlParameter("@userid", usrid);
                DataBase data = new DataBase();
                data.ExecuteNonQueryOpen();
                data.ExecuteNonQuery("Update " + tablename + " set " + update + " where " + key + "=@userid " + parmparms, parm);

                data.ExecuteNonQueryClose();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }


        /// <summary>
        /// 条件更新，已修改为高效率的
        /// 这边不是必须要加上INT型的关键字的
        /// </summary>
        /// <param name="usrid"></param>
        /// <param name="toEditCols"></param>
        /// <param name="toEditParams"></param>
        /// <param name="condkey"></param>
        /// <param name="condobj"></param>
        /// <param name="tablename"></param>
        /// <param name="key"></param>
        /// <returns></returns>
        static public bool TableFromKeyInt_Update_WithCondition(
                    List<string> toEditCols,
                    List<object> toEditParams,
                    string condkey,
                    object condobj,
                    string tablename,
                    string key)
        {
            return TableFromKeyInt_Update_WithCondition(toEditCols, toEditParams,
                new List<string> { condkey }, new List<object> { condobj }, tablename);
        }


        /// <summary>
        /// 有条件的修改
        /// 140827
        /// 不一定需要加上INT型的关键字
        /// </summary>
        /// <param name="usrid"></param>
        /// <param name="toEditCols">需要修改的</param>
        /// <param name="toEditParams"></param>
        /// <param name="condkey">一个条件</param>
        /// <param name="condobj"></param>
        /// <param name="tablename"></param>
        /// <param name="key"></param>
        /// <returns></returns>
        static public bool TableFromKeyInt_Update_WithCondition(
                            List<string> toEditCols,
                            List<object> toEditParams,
                            List<string> condkey,
                            List<object> condobj,
                            string tablename)
        {
            bool ret = false;
            try
            {



                string sqls = string.Empty;
                string update = string.Empty;
                string parmparms = string.Empty;

                MySqlParameter[] parm = new MySqlParameter[toEditCols.Count + condkey.Count];
                for (int i = 0; i < toEditCols.Count; i++)
                {
                    MySqlParameter temp = new MySqlParameter("@parm" + i.ToString(), toEditParams[i]);
                    parm[i] = (temp);
                    update += ", " + toEditCols[i] + "=@parm" + i.ToString() + " ";
                }

                for (int i = 0; i < condkey.Count; i++)
                {
                    MySqlParameter temp = new MySqlParameter("@sparm" + i.ToString(), condobj[i]);
                    parm[i + toEditCols.Count] = (temp);
                    parmparms += " and " + condkey[i] + "=@sparm" + i.ToString() + " ";
                }
                if (!string.IsNullOrEmpty(update))
                {
                    update = update.Substring(1);
                }
                //parm[toEditCols.Count + condkey.Count] = new MySqlParameter("@userid", usrid);
                DataBase data = new DataBase();
                data.ExecuteNonQueryOpen();
                data.ExecuteNonQuery("Update " + tablename + " set " + update + " where 1=1 " + parmparms, parm);

                data.ExecuteNonQueryClose();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }


        #endregion



        #region insert 部分


        /// <summary>
        /// 140827 new
        /// 向数据库中插入一条字符串
        /// 这个子函数主要用于那些关键字时UserID的表
        /// -----------------------------------------
        /// </summary>
        /// <param name="toEditCols">需要插入的字段的列名称</param>
        /// <param name="toEditParams">需要插入的额字段的值</param>
        /// <param name="tablename">表名</param>
        /// <returns>执行顺利</returns>
        static public int TableFromKeyInt_Insert_Identity(List<string> toEditCols,
                    List<object> toEditParams,
                    string tablename)
        {
            int ret = 0;
            try
            {
                DataBase data = new DataBase();
                //插入一条
                data.ExecuteQueryOpen();
                string sqls = string.Empty;
                string strpp = string.Empty;
                string parmparms = string.Empty;

                MySqlParameter[] parm = new MySqlParameter[toEditCols.Count];
                for (int i = 0; i < toEditCols.Count; i++)
                {
                    MySqlParameter temp = new MySqlParameter("@parm" + i.ToString(), toEditParams[i]);
                    parm[i] = (temp);
                    strpp += "," + toEditCols[i];
                    parmparms += "," + parm[i].ParameterName;
                }
                if (!string.IsNullOrEmpty(strpp))
                {
                    strpp = strpp.Substring(1);
                    parmparms = parmparms.Substring(1);
                }

                sqls = "Insert into " + tablename + " ( " + strpp + " ) values (" + parmparms + "); select @@IDENTITY ";

                ret = Tools.DB2INT(data.ExecuteQuery(sqls, parm)
                                  .Rows[0][0]);
                data.ExecuteQueryClose();


            }
            catch (System.Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
                ret = 0;
            }
            return ret;
        }





        /// <summary>
        /// 向数据库中插入一条字符串
        /// 只会插入一条哦
        /// -----------------------------------------
        /// NEW SHW 1216 0343
        /// </summary>
        /// <param name="toEditCols">需要插入的字段的列名称</param>
        /// <param name="toEditParams">需要插入的额字段的值</param>
        /// <param name="tablename">表名</param>
        /// <returns>执行顺利</returns>
        static public bool TableFromKeyUserID_Insert_NoIdentity(string toEditCols,
                            object toEditParams,
                            string tablename)
        {
            bool ret = false; ;
            try
            {
                DataBase data = new DataBase();
                //插入一条
                data.ExecuteNonQueryOpen();
                string sqls = string.Empty;
                sqls = "Insert into " + tablename + " ( " + toEditCols + " ) values ( @parm1) ";
                data.ExecuteNonQuery(sqls, new MySqlParameter("@parm1", toEditParams));
                data.ExecuteNonQueryClose();
                ret = true;

            }
            catch (System.Exception)
            {
                ret = false;
            }
            return ret;
        }


        /// <summary>
        /// 140827 NEW
        /// 增加了几个一起的
        /// </summary>
        /// <param name="toEditCols"></param>
        /// <param name="toEditParams"></param>
        /// <param name="tablename"></param>
        /// <param name="key"></param>
        /// <returns></returns>
        static public int TableFromKeyUserID_Insert_NoIdentity(List<string> toEditCols,
            List<object> toEditParams,
            string tablename)
        {
            int ret = 0;
            try
            {
                DataBase data = new DataBase();
                //插入一条
                data.ExecuteNonQueryOpen();
                string sqls = string.Empty;
                string strpp = string.Empty;
                string parmparms = string.Empty;

                MySqlParameter[] parm = new MySqlParameter[toEditCols.Count];
                for (int i = 0; i < toEditCols.Count; i++)
                {
                    MySqlParameter temp = new MySqlParameter("@parm" + i.ToString(), toEditParams[i]);
                    parm[i] = (temp);
                    strpp += "," + toEditCols[i];
                    parmparms += "," + parm[i].ParameterName;
                }
                if (!string.IsNullOrEmpty(strpp))
                {
                    strpp = strpp.Substring(1);
                    parmparms = parmparms.Substring(1);
                }

                sqls = "Insert into " + tablename + " ( " + strpp + " ) values (" + parmparms + ") ";

                data.ExecuteNonQuery(sqls, parm);
                data.ExecuteNonQueryClose();


            }
            catch (System.Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
                ret = 0;
            }
            return ret;
        }


        #endregion



        #region delete 部分

        /// <summary>
        /// 从那些关键字时ID的表中删除记录
        /// </summary>
        /// <param name="userid">用户ID</param>
        /// <param name="tablename">表名</param>
        /// <param name="key">关键字</param>
        /// <returns></returns>
        static public bool TableFromKeyInt_Delete(int userid,
                            string tablename,
                            string key)
        {
            bool ret = false;
            try
            {
                DataBase data = new DataBase();
                //插入一条
                data.ExecuteNonQueryOpen();
                string sqls = string.Empty;
                sqls = " delete from " + tablename + " where " + key + " = @userid";
                data.ExecuteNonQuery(sqls, new MySqlParameter("@userid", userid));
                data.ExecuteNonQueryClose();
                ret = true;

            }
            catch (System.Exception)
            {
                ret = false;
            }
            return ret;
        }



        static public bool TableFromKeyInt_Delete(List<int> todeletes,
                            string tablename,
                            string key)
        {
            bool ret = false;
            try
            {
                DataBase data = new DataBase();
                string todeletestr = string.Empty;
                for (int i = 0; i < todeletes.Count(); i++)
                {
                    todeletestr += todeletes[i].ToString() + ",";
                }
                if (!string.IsNullOrEmpty(todeletestr))
                {
                    todeletestr = todeletestr.Substring(0, todeletestr.Length - 1);
                }
                data.ExecuteNonQueryOpen();
                string sqls = string.Empty;
                sqls = " delete from " + tablename + " where " + key + " in ( " + todeletestr + " )";
                data.ExecuteNonQuery(sqls);
                data.ExecuteNonQueryClose();
                ret = true;

            }
            catch (System.Exception)
            {
                ret = false;
            }
            return ret;
        }


        #endregion 
    }
}