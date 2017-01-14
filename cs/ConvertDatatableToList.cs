using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;

namespace zscq.cs
{
    public class ConvertDatatableToList<T>
    {
        public static List<T> Convert(DataTable dt)
        {
            if (dt == null)
                return null;
            List<T> tList = new List<T>();
            foreach (DataRow dr in dt.Rows)
            {
                //使用Activator.CreateInstance<T>创建指定类型的无参构造对象
                T t = Activator.CreateInstance<T>();
                ProperSetValue(dr, t);
                tList.Add(t);
            }
            return tList;
        }

        private static void ProperSetValue(DataRow dr, Object t)
        {
            PropertyInfo[] pary = t.GetType().GetProperties();
            foreach (PropertyInfo p in pary)
            {//判断是否是系统类型
                if (p.PropertyType.ToString().StartsWith("System."))
                {//判断是否包含当前列
                    if (dr.Table.Columns.Contains(p.Name))
                    {
                        if (!(dr[p.Name] is DBNull))
                            p.SetValue(t, dr[p.Name], null);
                        else
                            p.SetValue(t, null, null);
                    }
                }
                else
                {
                    //按照自定义类型创建对象                       Grade_Model
                    Object obj = Assembly.GetAssembly(p.PropertyType).CreateInstance(p.PropertyType.FullName);
                    p.SetValue(t, obj, null);
                    ProperSetValue(dr, obj);
                }
            }
        }
    }
}