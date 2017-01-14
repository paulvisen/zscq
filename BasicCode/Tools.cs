using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace zscq.BasicCode
{
    #region 枚举
    /// <summary>
    /// 用户类型
    /// </summary>
    public enum enumUserType : int
    {
        Reserver = 0,
        Admin = 1,
        Personal = 2,
        Company = 3,
        Academy = 4,
        Expert = 5
    }

    /// <summary>
    /// 新闻类型
    /// </summary>
    public enum enumNewsType : int
    {
        Reserver = 0,
        /// <summary>
        /// 网站动态
        /// </summary>
        Dynamic = 1,
        /// <summary>
        /// 最新政策
        /// </summary>
        Strategy = 2,
        /// <summary>
        /// 科技新闻
        /// </summary>
        Technology = 3
        
    }

    public enum enumDownloadType : int
    {
        Reserver = 0,
        /// <summary>
        /// 政策文件
        /// </summary>
        Strategy = 1,
        /// <summary>
        /// 合同模板
        /// </summary>
        Contract = 2,
        /// <summary>
        /// 规则流程
        /// </summary>
        Rule = 3
    }

    /// <summary>
    /// 发布状态
    /// </summary>
    public enum enumPublicState : int
    {
        Reserver = 0,
        Success = 1,
        Reject = 2,
        Deleted = 255
    }

    /// <summary>
    /// 操作类型
    /// </summary>
    public enum enumOpType : int
    {
        Reserver = 0,
        Pub = 1,
        Edit = 2,
        Draft = 255
    }

    public enum enumFileState : int
    {
        /// <summary>
        /// 准备添加
        /// </summary>
        PreInsert = 0,
        /// <summary>
        /// 已添加
        /// </summary>
        Inserted = 1,
        /// <summary>
        /// 准备删除
        /// </summary>
        PreDelete = 2,
        /// <summary>
        /// 已删除
        /// </summary>
        Deleted = 255

    }

    public enum enumTeamType : int
    {
        Reserver = 0,
        /// <summary>
        /// 科技企业
        /// </summary>
        KJQY = 1,
        /// <summary>
        /// 高等院校
        /// </summary>
        GDYX = 2,
        /// <summary>
        /// 科研院所
        /// </summary>
        KYYS = 3,
        /// <summary>
        /// 中介机构
        /// </summary>
        ZJJG = 4,
        /// <summary>
        /// 其他
        /// </summary>
        Other = 5
    }
    #endregion

    public class Tools
    {
        #region enum to string
        public static string EnumToString(enumDownloadType evalue)
        {
            switch (evalue)
            {
                case enumDownloadType.Strategy: return "政策文件";
                case enumDownloadType.Contract: return "合同模板";
                case enumDownloadType.Rule: return "规则流程";
                default: return "保留";
            }
        }

        public static string EnumToString(enumNewsType evalue)
        {
            switch (evalue)
            {
                case enumNewsType.Dynamic: return "网站动态";
                case enumNewsType.Strategy: return "最新政策";
                case enumNewsType.Technology: return "科技新闻";
                default: return "保留";
            }
        }
        #endregion

        #region 转换
        /// <summary>
        /// 将字符串转换成为数据库可以接受类型的字符串
        /// 因为数据库无法接受字符串类型的NULL
        /// 所以在字符串为NULL的时候需要进行转化
        /// ------------------------------
        ///  NEW  SHW 1216 0353
        /// </summary>
        /// <param name="str">需要进行转换的字符串</param>
        /// <returns>转换后的字符串</returns>
        public static object ST2DB(string str)
        {
            try
            {
                if (string.IsNullOrEmpty(str))
                    return string.Empty;
                else
                    return str;
            }
            catch
            {
                return "";
            }
        }

        /// <summary>
        /// 数据库中的一个cell转换成为字符串
        /// 在为数据库字段为NULL的时候转换成为STRING.EMPTY
        /// 邹泽返回字符串本身
        /// -------------------------------
        /// NEW SHW1216 00.03 无异常
        /// </summary>
        /// <param name="obj">数据库中的一个CELL的内容</param>
        /// <returns></returns>
        public static string DB2ST(object obj)
        {
            try
            {
                return (obj is DBNull) ? string.Empty : obj.ToString();
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// 数据库中的一个cell转换成为整型
        /// 采用的方法是先进性强制转换，在进行字符串中间变量
        /// -------------------------------
        /// NEW SHW1216 00.12 无异常
        /// </summary>
        /// <param name="obj">数据库中的一个CELL的内容</param>
        /// <returns></returns>
        public static int DB2INT(object obj)
        {
            int ret = 0;
            try
            {
                ///如果不是NULL ，那么先强制转换，不行的话在用字符串作为中间变量
                if (!(obj is DBNull))
                {
                    try
                    {
                        ret = (int)obj;
                    }
                    catch
                    {
                        ret = int.Parse(obj.ToString());
                    }
                }
            }
            catch
            {
            }
            return ret;
        }


        /// <summary>
        /// 数据库中的一个cell转换成为整型
        /// 采用的方法是先进性强制转换，在进行字符串中间变量
        /// -------------------------------
        /// NEW SHW1216 00.12 无异常
        /// </summary>
        /// <param name="obj">数据库中的一个CELL的内容</param>
        /// <returns></returns>
        public static bool DB2BOOL(object obj)
        {
            bool ret = false;
            try
            {
                ///如果不是NULL ，那么先强制转换，不行的话在用字符串作为中间变量
                if (!(obj is DBNull))
                {
                    try
                    {
                        ret = (bool)obj;
                    }
                    catch
                    {
                        int tmp = int.Parse(obj.ToString());
                        ret = (tmp == 1);
                    }
                }
            }
            catch
            {
            }
            return ret;
        }


        /// <summary>
        /// -----------------------
        /// new shw 不会跑出错误
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static decimal DB2DECIMAL(object obj)
        {
            decimal ret = 0;
            try
            {
                if (!(obj is DBNull))
                {
                    try
                    {
                        ret = (decimal)obj;
                    }
                    catch
                    {
                        ret = decimal.Parse(obj.ToString());
                    }
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }

        /// <summary>
        /// -----------------------
        /// new shw 不会跑出错误
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static double DB2DOUBLE(object obj)
        {
            double ret = 0;
            try
            {
                if (!(obj is DBNull))
                {
                    try
                    {
                        ret = (double)obj;
                    }
                    catch
                    {
                        ret = double.Parse(obj.ToString());
                    }
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }

        /// <summary>
        /// 时间，不对的话会返回当下
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static DateTime DB2Date(object obj)
        {
            try
            {
                return DateTime.Parse(obj.ToString());
            }
            catch
            {
                try
                {
                    return (DateTime)obj;
                }
                catch
                {
                    return DateTime.Now;
                }
            }
        }

        public static bool DBIsNull(object obj)
        {
            try
            {
                return obj is DBNull;
            }
            catch
            {
                return true;
            }
        }
        #endregion

        #region 字符串
        /// <summary>
        /// 截断字符串到指定的长度
        /// </summary>
        /// <param name="str"></param>
        /// <param name="len"></param>
        /// <returns></returns>
        internal static object STR_Short(string str, int len)
        {
            if (str.Length > (len - 2))
                return str.Substring(0, len - 2) + "..";
            else
                return str;
        }

        /// <summary>
        /// MD5加密，防止数据库被窃
        /// </summary>
        /// <param name="str">待加密的字符串</param>
        /// <returns>加密后的字符串</returns>
        /// 
        public static string mymd5(string str)
        {
            //加密密码
            string EnPswdStr = FormsAuthentication.HashPasswordForStoringInConfigFile(str, "MD5");
            return (EnPswdStr.ToLower());  //返回加密的字符串
        }

        /// <summary>
        /// 产生随机字符串
        /// </summary>
        /// <param name="length">字符串长度</param>
        /// <param name="useNum">是否有数字</param>
        /// <param name="useLow">是否有小写</param>
        /// <param name="useUpp">是否有大写</param>
        /// <param name="useSpe">是否有字符</param>
        /// <param name="custom">要包含的自定义字符，直接输入要包含的字符列表</param>
        /// <returns></returns>
        public static string GetRnd(int length, bool useNum, bool useLow, bool useUpp, bool useSpe, string custom)
        {
            byte[] b = new byte[4];
            new System.Security.Cryptography.RNGCryptoServiceProvider().GetBytes(b);
            Random r = new Random(BitConverter.ToInt32(b, 0));
            string s = null, str = custom;
            if (useNum == true) { str += "0123456789"; }
            if (useLow == true) { str += "abcdefghijklmnopqrstuvwxyz"; }
            if (useUpp == true) { str += "ABCDEFGHIJKLMNOPQRSTUVWXYZ"; }
            if (useSpe == true) { str += "!\"#$%&'()*+,-./:;<>?@[\\]^_`{|}~"; }
            for (int i = 0; i < length; i++)
            {
                s += str.Substring(r.Next(0, str.Length - 1), 1);
            }
            return s;
        }
        #endregion
    }
}