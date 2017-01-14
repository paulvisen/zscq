<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NeedPub.aspx.cs" Inherits="zscq.Manage.chengguo.NeedPub" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="../../js/jquery-2.1.1.min.js"></script>
    <script src="../../js/WdatePicker.js"></script>
    <title></title>
    <style type="text/css">
        a {
            text-decoration: none;
            color: #000;
        }

        ._pubdiv {
            font: 14px microsoft yahei;
            margin-left: 30px;
        }

        ._red {
            color: red;
        }

        ._hidden {
            /*visibility: hidden;*/
            display:none;
        }

        ._show {
            /*visibility: visible;*/
            display:inline-block;
        }

        .uploadify-button {
            border: none;
            margin: 10px 0px;
        }
        tr {
        line-height:35px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
     <div id="fade" name="fade" runat="server" class="_pubdiv">
            <h3 class="_mgrban"><span>成果需求信息登记 &nbsp;&nbsp;&nbsp;温馨提示：带<span class="_red">*</span>的为必填</span></h3>
            <br />
            <div id="draftsmen" >
            </div>
            <table  cellpadding="2" cellspacing="1" border="0">
                <tbody>
                    <tr>
                        <td width="20%">
                            <span class="_red">*</span>需求成果名称:
                        </td>
                        <td colspan="3" width="80%">
                            <input type="text" id="Name"  runat="server"  size="70" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="_red">*</span>需求简介(140字以内):
                        </td>
                        <td colspan="3">
                            <textarea rows="10" type="text" cols="70"  id="BriefIntro"  runat="server"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="_red">*</span>关键词:
                        </td>
                        <td colspan="3" class="_ft13">
                            <input type="text" id="keywordone"  runat="server" />
                            <input type="text" id="keywordtwo"  runat="server" />
                            <input type="text" id="keywordthree"  runat="server" />
                            <input type="hidden"  runat="server" id="KeyWords" />
                        </td>
                    </tr>
                   <%-- <tr>//////直接读取登录用户信息
                        <td width="20%">单位:
                        </td>
                        <td colspan="3" width="80%">
                            <input type="text" id="CGCompany"  runat="server"  size="70" />
                        </td>
                    </tr>--%>
                    <tr>
                        <td width="20%">联系人:
                        </td>
                        <td colspan="3" width="80%">
                            <input type="text" id="CommPerson"  runat="server"  size="70" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">电话:
                        </td>
                        <td colspan="3" width="80%">
                            <input type="text" id="CommTel" name="ConPhone" runat="server"  size="70" />
                        </td>
                    </tr>
                    <tr>
                        <td>成果登记时间:
                        </td>
                        <td colspan="3">
                            <table>
                                <tr>
                                    <input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"  required="" aria-required="true" id="PubDate" runat="server" />
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                         <td><span class="_red">*</span>知识产权类型:
                        </td>
                        <td colspan="3">
                            <input type="radio" name="transclass" runat="server" value="品系"  />品系
								<input type="radio" name="transclass" runat="server" value="品种" />品种
								<input type="radio" name="transclass" runat="server" value="专利" />专利
								<input type="radio" name="transclass" runat="server" value="农药" />农药
								<input type="radio" name="transclass" runat="server" value="兽药" />兽药
                            <input type="radio" name="transclass" runat="server" value="专有技术" />专有技术
                             <input type="radio" name="transclass" runat="server" value="其他" />其他&nbsp;&nbsp;<input type="text" id="qttransclass" class="_hidden" />
                            <input type="hidden" value="" runat="server"  id="transclass" />
                        </td>
                    </tr>
                    <tr>
                         <td><span class="_red">*</span>预期交易方式:
                        </td>
                        <td colspan="3">
                            <input type="radio" name="TransStyle" runat="server" value="独占许可"  />独占许可
                            <input type="radio" name="TransStyle" runat="server" value="独家许可"  />独家许可
                            <input type="radio" name="TransStyle" runat="server" value="普通许可"  />独占许可
                            <input type="radio" name="TransStyle" runat="server" value="所有权转让"  />所有权转让
                            <input type="radio" name="TransStyle" runat="server" value="合作开发" />合作开发<br />
								<input type="radio" name="TransStyle" runat="server" value="技术服务" />技术服务
								<input type="radio" name="TransStyle" runat="server" value="技术咨询" />技术咨询
                             <input type="radio" name="TransStyle" runat="server" value="其他方式" />其他方式&nbsp;&nbsp;<input type="text" id="qtTransStyle"  class="_hidden" />
                            <input type="hidden" value="" runat="server"  id="TransStyle" />

                        </td>
                    </tr>

                     <tr>
                        <td>预期交易价格:
                        </td>
                        <td colspan="3">
                            <table>
                                <tr>
                                     <td>
                                        <input type="text"   id="PriceLow" runat="server" /></td>
                                    <td>至</td>
                                    
                                    <td>
                                        <input type="text"   id="PriceHigh" runat="server" /></td>
                                    <td>万元</td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td>所属领域:<br />
                            <span>（可多选）</span>
                        </td>
                        <td colspan="3">
                            <table>

                                <tbody>
                                    <tr>
                                        <td>
                                            <input type="checkbox" value="主要粮食作物成果" id="BelongField0" runat="server"  />主要粮食作物成果
                                        </td>
                                        <td class="auto-style1">
                                            <input type="checkbox" value="果蔬及花卉成果" id="BelongField1" runat="server"  />果蔬及花卉成果</td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <input type="checkbox" value="林产品成果" id="BelongField2" runat="server" />林产品成果
                                        </td>
                                        <td class="auto-style1">
                                            <input type="checkbox" value="畜禽产品成果" id="BelongField3" runat="server"  />畜禽产品成果 </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <input type="checkbox" value="水产品成果" id="BelongField4" runat="server"  />水产品成果
                                        </td>
                                        <td class="auto-style1"><input type="checkbox" value="其他" runat="server" id="BelongField5"  />其他</td> <td class="auto-style1">
                                            <div id="menuchild">
                                                <input type="text" name="qtCGField" runat="server" id="qtBelongField" class="_hidden"  />
                                            </div>
                                            <input type="hidden" value="" runat="server"  id="BelongField" />
                                        </td>
                                        
                                   

                                </tbody>
                            </table>
                          
                        </td>
                    </tr>


                    <tr>
                        <td>成果成熟度:
                        </td>
                        <td colspan="3">
                            <input type="radio" name="Mature" runat="server" value="可以量产" />可以量产
								<input type="radio" name="Mature" runat="server" value="通过中试" />通过中试
								<input type="radio" name="Mature" runat="server" value="通过小试" />通过小试
								<input type="radio" name="Mature" runat="server" value="已有样品" />已有样品
								<input type="radio" name="Mature" runat="server" value="正在研发" />正在研发
                                <input type="hidden" value="" runat="server"  id="Mature" />
                        </td>
                    </tr>

                    <tr id="tr-topLevel">
                        <td>技术水平:
                        </td>
                        <td colspan="3">
                            <input type="radio" value="国际领先" runat="server" name="TechLevel" />国际领先
								<input type="radio" value="国际先进" runat="server" name="TechLevel" />国际先进
								<input type="radio" value="国内领先" runat="server" name="TechLevel" />国内领先
								<input type="radio" value="国内先进" runat="server" name="TechLevel" />国内先进
								<input type="radio" value="国内一般" runat="server" name="TechLevel" />国内一般
                                <input type="hidden" value="" runat="server"  id="TechLevel" />
                        </td>
                    </tr>
                   

                    <tr>
                        <td colspan="4">
                            <br />
                           
                            <asp:Button Text="提交" style="background:rgb(100,100,100);color:#fff;width:80px;height:30px;" runat="server" ID="Button1" OnClick="sumitme_Click" OnClientClick="Needdata()" />

                        </td>
                    </tr>
                </tbody>
            </table>
            <br />
        </div>
          <script type="text/javascript">
         

              //////获取知识产权类型
              $("input[type='radio'][name='transclass']").on("click", function () {
                  var choice = $("input[type='radio'][name='transclass']:checked").val();
                  var str;
                  if (choice == "其他") {
                      $("#qttransclass").removeClass("_hidden");
                      $("#qttransclass").addClass("_show");
                      $("#qttransclass").on("keyup", function () {
                          str = $("#qttransclass").val();
                      });
                      $("#transclass").val(str);
                  } else {
                      $("#qttransclass").removeClass("_show");
                      $("#qttransclass").addClass("_hidden");
                      $("#transclass").val(choice);
                      //alert($("#transclass").val());
                  }
              });

              ////获取拟转化方式
              $("input[type='radio'][name='TransStyle']").on("click", function () {
                  var choice = $("input[type='radio'][name='TransStyle']:checked").val();
                  var str;
                  if (choice == "其他方式") {
                      $("#qtTransStyle").removeClass("_hidden");
                      $("#qtTransStyle").addClass("_show");
                      $("#qtTransStyle").on("keyup", function () {
                          str = $("#qtTransStyle").val();
                      });
                      $("#TransStyle").val(str);
                  } else {
                      $("#qtTransStyle").removeClass("_show");
                      $("#qtTransStyle").addClass("_hidden");
                      $("#TransStyle").val(choice);
                      //alert($("#TransStyle").val());
                  }
              });
              ///////获取成熟度
              $("input[type='radio'][name='Mature']").on("click", function () {
                  var choice = $("input[type='radio'][name='Mature']:checked").val();
                 
                  $("#Mature").val(choice);
                  //alert($("#Mature").val());
                  
              });

              //////获取技术水平
              $("input[type='radio'][name='TechLevel']").on("click", function () {
                  var choice = $("input[type='radio'][name='TechLevel']:checked").val();
                 
                  $("#TechLevel").val(choice);
                  //alert($("#TechLevel").val());
                  
              });

              //////获取所属领域
              $("#BelongField5").on("click", function () {
                  if ($("#BelongField5").is(":checked")) {//选中  
                      $("#qtBelongField").removeClass("_hidden");
                      $("#qtBelongField").addClass("_show");
                  } else {
                      $("#qtBelongField").removeClass("_show");
                      $("#qtBelongField").addClass("_hidden");
                  }
                 
              });
              function Needdata() {
                  var str = "";
                  if ($("#BelongField0").is(":checked")) {//选中  
                      str += $("#BelongField0").val() + ",";
                  }
                  if ($("#BelongField1").is(":checked")) {//选中  
                      str += $("#BelongField1").val() + ",";
                  }
                  if ($("#BelongField2").is(":checked")) {//选中  
                      str += $("#BelongField2").val() + ",";
                  }
                  if ($("#BelongField3").is(":checked")) {//选中  
                      str += $("#BelongField3").val() + ",";
                  }
                  if ($("#BelongField4").is(":checked")) {//选中  
                      str += $("#BelongField4").val() + ",";
                  }
                  if ($("#BelongField5").is(":checked")) {//选中  
                      str += $("#qtBelongField").val() + ",";
                  }
                  $("#BelongField").val(str);


              }





        </script>

    </form>
</body>
</html>
