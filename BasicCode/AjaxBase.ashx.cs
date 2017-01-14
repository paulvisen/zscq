using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace zscq.BasicCode
{
    /// <summary>
    /// AjaxBase 的摘要说明
    /// </summary>
    public class AjaxBase : IHttpHandler {

        virtual public void ProcessRequest (HttpContext context) {
            
        }
     
        public bool IsReusable {
            get {
                return false;
            }
        }
    }
}