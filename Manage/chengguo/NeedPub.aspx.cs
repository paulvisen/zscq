using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.cs;
using zscq.BasicCode;

namespace zscq.Manage.chengguo
{
    public partial class NeedPub :WebBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string username = GetUserName();
            //int UserID = mDB.GetUserId(username);
        }

        protected need_model Edit_need() {
            try
            {
                string username = GetUserName();
                int UserID = mDB.GetUserId(username);
                need_model model = new need_model();
                if(UserID!=0)
                {
                    model.UserID=UserID;
                }
                if (Name.Value != "")
                {
                    model.Name = Name.Value;
                }
                if (CommPerson.Value != "")
                {
                    model.CommPerson = CommPerson.Value;
                }
                if (CommTel.Value != "")
                {
                    model.CommTel = CommTel.Value;
                }
                if (PubDate.Value != "")
                {
                    model.PubDate = Convert.ToDateTime(PubDate.Value);
                }
                if (BriefIntro.Value != "")
                {
                    model.BriefIntro = BriefIntro.Value;
                }
                if (BelongField.Value != "")
                {
                    model.BelongField = BelongField.Value;
                }
                if (Mature.Value != "")
                {
                    model.Mature = Mature.Value;
                }
                if (TechLevel.Value != "")
                {
                    model.TechLevel = TechLevel.Value;
                }
                if (TransStyle.Value != "")
                {
                    model.TransStyle = TransStyle.Value;
                }
                if (PriceLow.Value != "")
                {
                    model.PriceLow = Convert.ToInt32(PriceLow.Value);
                }
                if (PriceHigh.Value != "")
                {
                    model.PriceHigh = Convert.ToInt32(PriceHigh.Value);
                }
                if (transclass.Value != "")
                {
                    model.transclass = transclass.Value;
                }
                model.KeyWords = "";
                if (keywordone.Value != "")
                {
                    model.KeyWords += keywordone.Value + "&";
                }
                if (keywordtwo.Value != "")
                {
                    model.KeyWords += keywordtwo.Value + "&";
                }
                if (keywordthree.Value != "")
                {
                    model.KeyWords += keywordthree.Value;
                }
                model.PubState = 0;

                return model;


            }
            catch {
                return null;
            }
        }
        protected void sumitme_Click(object sender, EventArgs e)
        {
            mDB dll = new mDB();
            need_model model = Edit_need();
            int result = dll.AddIndustry_need(model);
            if (result == 1)
            {
                Response.Write("<script>alert('保存成功！');window.location.href='NeedPub.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('保存失败！');</script>");
            }

        }
    }
}