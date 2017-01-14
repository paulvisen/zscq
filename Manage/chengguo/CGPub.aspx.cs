using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.BasicCode;
using zscq.cs;

namespace zscq.Manage.chengguo
{
    public partial class CGPub :WebBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string username = GetUserName();
            //int CGComponyid = mDB.GetUserId(username);
            if (!IsPostBack)
            {
               
                GetIndustry();
            }
            
        }

        public void GetIndustry()
        {
            if (Request["cgid"] != null) //修改成果
            {
                hideInid.Value = Request["cgid"].ToString();
                hideState.Value = "1";
                int cgid = Convert.ToInt32(Request["cgid"].ToString());
                DB bll = new DB();
                chengguo_model model = bll.GetDetail(cgid);
                if (model != null) //之前填写的成果信息加载
                {
                    CGName.Value = model.CGName;
                    CGDetails_short.Value = model.CGDetails_short;
                    string[] key = model.keyword.Split('&');
                    if (key.Length == 0)
                    {
                        keyword1.Value = null;
                        keyword2.Value = null;
                        keyword3.Value = null;
                    }
                    else if (key.Length == 1)
                    {
                        keyword1.Value = key[0];
                        keyword2.Value = null;
                        keyword3.Value = null;
                    }
                    else if (key.Length == 2)
                    {
                        keyword1.Value = key[0];
                        keyword2.Value = key[1];
                        keyword3.Value = null;
                    }
                    else if (key.Length == 3)
                    {
                        keyword1.Value = key[0];
                        keyword2.Value = key[1];
                        keyword3.Value = key[2];
                    }
                    CGCompany.Value = model.CGCompany;
                    ConPerson.Value = model.ConPerson;
                    ConPhone.Value = model.ConPhone;
                    main_person.Value = model.main_person;
                    main_person_phone.Value = model.main_person_phone;
                    RegTime.Value = model.RegTime.ToString();
                    PatentNum.Value = model.PatentNum;
                    TransPrice.Value = model.TransPrice.ToString();
                    unit_com.Value = model.unit_com;
                    admin_com.Value = model.admin_com;

                }
                else
                {
                    if (hideInid.Value != "")
                        hideState.Value = "1";
                    else
                        hideState.Value = "0";
                }
            }
           
        }

        protected chengguo_model EditCG() {
            try
            {
                string username = GetUserName();
                int CGComponyid = mDB.GetUserId(username);
                chengguo_model model = new chengguo_model();
                if (hideInid.Value != "")
                {
                    model.id = Convert.ToInt32(hideInid.Value);
                }
                if (CGName.Value != "")
                {
                    model.CGName = CGName.Value;
                }
                if (CGDetails_short.InnerText.Trim() != "")
                {
                    model.CGDetails_short = CGDetails_short.InnerText.Trim();
                }
                model.keyword = "";
                if (keyword1.Value != "" )
                {
                    model.keyword += keyword1.Value+"&";
                }
                if (keyword2.Value != "")
                {
                    model.keyword += keyword2.Value + "&";
                }
                if (keyword3.Value != "") 
                {
                    model.keyword += keyword3.Value;
                }
                if (CGCompany.Value != "")
                {
                    model.CGCompany += CGCompany.Value;
                }
                if(CGComponyid!=0)
                {
                    model.CGComponyid = CGComponyid;
                }
                if (ConPerson.Value != "")
                {
                    model.ConPerson = ConPerson.Value;
                }
                if (ConPhone.Value != "")
                {
                    model.ConPhone = ConPhone.Value;
                }
                if (main_person.Value != "")
                {
                    model.main_person = main_person.Value;
                }
                if (main_person_phone.Value != "")
                {
                    model.main_person_phone = main_person_phone.Value;
                }
                if (RegTime.Value != "")
                {
                    model.RegTime = Convert.ToDateTime(RegTime.Value);
                }
                if (PatentNum.Value != "")
                {
                    model.PatentNum = PatentNum.Value;
                }
                if (CGType.Value!="")/////
                {
                    model.CGType = CGType.Value;    
                }
                if (TransMode.Value != "")//////
                {
                    model.TransMode = TransMode.Value;
                }
                if (TransPrice.Value != "")
                {
                    model.TransPrice = Convert.ToInt32(TransPrice.Value);
                }
                if (CGField.Value!="")/////
                {
                    model.CGField = CGField.Value;
                }
                if (unit_com.Value != "")
                {
                    model.unit_com = unit_com.Value;
                }
                if (admin_com.Value != "")
                {
                    model.admin_com = admin_com.Value;
                }
                if (Context.Request.Form["imgurl"] != null)
                {
                    model.CGImg = Context.Request.Form["imgurl"];
                }
                else {
                    model.CGImg = "";
                }
                model.CGPubstate = 0;
                model.isByExp = 0;

                return model;
            }
            catch {
                return null;
            }
        }

        protected void sumitme_Click(object sender, EventArgs e)
        {
            if (hideState.Value == "0")
            {
                mDB dll = new mDB();
                chengguo_model model = EditCG();
                int result = dll.AddIndustry(model);
                if (result == 1)
                {
                    Response.Write("<script>alert('保存成功！');window.location.href='CGPub.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('保存失败！');</script>");
                }
            }
            else 
            {
                mDB dll = new mDB();
                chengguo_model model = EditCG();
                int result = dll.EditIndustry(model);
                if (result == 1)
                {
                    Response.Write("<script>alert('修改成功！');window.location.href='CGPub.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('修改失败！');</script>");
                }
            }
         
            
        }
    }
}