<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPageuser.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="user_MyProfile" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
    <table width="770" cellspacing="10" cellpadding="0" border="0" style="background-color: White;"> 
    <tbody><tr>    
      
    
        <td align="left" class="accoditionHeader" style="width: 100%;"> 
            Thông tin cá nhân:
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" 
            
            style="border: 1px solid rgb(223, 223, 223); background-color: rgb(246, 246, 246);" 
            class="style9">
           
        
        
                <table cellpadding="0" cellspacing="10" class="style1"  width="100%" 
                    bgcolor="White"  >
                    <tr>
                        <td style="text-align: left; width:10%" class="style10">
                            Mã số CBVC</td>
                        <td style="width:20%">
                            <asp:TextBox ID="txtmanhanvien" runat="server" Enabled="False" Width="166px"></asp:TextBox>
                        </td>
                        <td style="text-align: left;width:10%" class="style10">
                            Họ và tên
                        </td>
                        <td  style ="width:20%">
                            <input id="txthovaten" style="width: 168px; height: 20px" type="text" maxlength="100"
                                name="textTieude0" runat="server" language="javascript" 
                                onkeypress="return textTieude_onkeypress()"></td>
                        <td style="text-align: left;width:10%" class="style10">
                            Giới tính
                        </td>
                        <td style="width:20%">
                            <asp:DropDownList ID="dlgioitinh" runat="server" Width="169">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left" class="style10">
                            Ngày sinh
                        </td>
                        <td style="width: 217px">
                            <asp:TextBox ID="txtngaysinh" runat="server" Width="166px"></asp:TextBox>
                             <asp:CalendarExtender ID="txtdengay_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="txtngaysinh" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                        </td>
                        <td style="text-align: left" class="style10">
                            Nơi sinh
                        </td>
                        <td>
                            <input id="txtnoisinh" runat="server" style="width: 168px; height: 20px" type="text"
                                maxlength="100"/>
                        </td>
                        <td style="text-align: left" class="style10">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td style="text-align: left" class="style10">
                            Số CM</td>
                        <td style="width: 217px">
                            <input id="txtsochungminh" style="width: 168px; height: 20px" type="text" maxlength="100"
                                name="textTieude3" runat="server" language="javascript" onkeypress="return textTieude_onkeypress()"/>
                        </td>
                        <td style="text-align: left" class="style10">
                            Ngày cấp
                        </td>
                        <td>
                            <asp:TextBox ID="txtngaycapcm" runat="server" Width="166px"></asp:TextBox>
                             <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                    Enabled="True" TargetControlID="txtngaycapcm" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                        </td>
                        <td style="text-align: left" class="style10">
                            Nơi cấp
                        </td>
                        <td>
                            <input id="txtnoicapcm" style="width: 168px; height: 20px" type="text" maxlength="100"
                                name="textTieude5" runat="server" language="javascript" onkeypress="return textTieude_onkeypress()">
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left" class="style10">
                            Số Passport
                        </td>
                        <td style="width: 217px">
                            <input id="txtpassport" style="width: 168px; height: 20px" type="text" maxlength="100"
                                name="textTieude10" runat="server" language="javascript" onkeypress="return textTieude_onkeypress()">
                        </td>
                        <td style="text-align: left" class="style10">
                            Ngày cấp
                        </td>
                        <td>
                            <asp:TextBox ID="txtngaycappp" runat="server" Width="166px"></asp:TextBox>
                             <asp:CalendarExtender ID="CalendarExtender2" runat="server" 
                    Enabled="True" TargetControlID="txtngaycappp" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                        </td>
                        <td style="text-align: left" class="style10">
                            Nơi cấp
                        </td>
                        <td>
                            <input id="txtnoicappp" style="width: 168px; height: 20px" type="text" maxlength="100"
                                name="textTieude7" runat="server" language="javascript" onkeypress="return textTieude_onkeypress()"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left" class="style10">
                            Điện thoại
                        </td>
                        <td style="width: 217px">
                            <input id="txtdienthoai" style="width: 168px; height: 20px" type="text" maxlength="100"
                                name="textTieude9" runat="server" language="javascript" onkeypress="return textTieude_onkeypress()">
                        </td>
                        <td style="text-align: left" class="style10">
                            Email</td>
                        <td>
                            <input id="txtemail" style="width: 168px; height: 20px" type="text" maxlength="100"
                                name="textTieude6" runat="server" language="javascript" onkeypress="return textTieude_onkeypress()">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="txtemail" ErrorMessage="Email Sai" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                        <td style="text-align: left">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="text-align: left" class="style11" colspan="6">
                            Nguyên Quán</td>
                    </tr>
                    <tr>
                        <td style="text-align: left" class="style10">
                            Xã (Phường)</td>
                        <td style="width: 217px">
                            <asp:TextBox ID="txtXaNQ" runat="server" Width="166px"></asp:TextBox>
                        </td>
                        <td style="text-align: left" class="style10">
                            Quận</td>
                        <td>
                            <asp:TextBox ID="txtHuyenNQ" runat="server" Width="166px"></asp:TextBox>
                        </td>
                        <td style="text-align: left" class="style10">
                            TP</td>
                        <td>
                            <asp:DropDownList ID="ddlTPNQ" runat="server" Width="169px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left" colspan="6" class="style11">
                            Nơi ở hiên nay</td>
                    </tr>
                    <tr>
                        <td style="text-align: left" class="style10">
                            Số nhà :</td>
                        <td style="width: 217px">
                            <asp:TextBox ID="txtsonha" runat="server" Width="168px"></asp:TextBox>
                        </td>
                        <td style="text-align: left" class="style10">
                            Đường /Tổ</td>
                        <td>
                            <asp:TextBox ID="txtduong" runat="server" Width="168px"></asp:TextBox>
                        </td>
                        <td style="text-align: left" class="style10">
                            Xã/Phường</td>
                        <td>
                            <asp:TextBox ID="txtXaPhuong" runat="server" Width="168px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left" class="style10">
                            Quận/Huyện:</td>
                        <td style="width: 217px">
                            <asp:TextBox ID="txthuyen" runat="server" Width="168px"></asp:TextBox>
                        </td>
                        <td style="text-align: left" class="style10">
                            Tỉnh/TP</td>
                        <td>
                            <asp:DropDownList ID="ddlTinhTP" runat="server" Width="168px">
                            </asp:DropDownList>
                        </td>
                        <td style="text-align: left" class="style10">
                            QG</td>
                        <td>
                            <asp:DropDownList ID="dlquoctich" runat="server" Width="169">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #CCCCCC; text-align: left" colspan="6" 
                            class="accoditionHeader">
                            Học vấn và nghề nghiệp
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left" class="style10">
                            Học hàm
                            <asp:CheckBox ID="idcheck" runat="server" AutoPostBack="True" 
                                oncheckedchanged="idcheck_CheckedChanged" />
                        </td>
                        <td style="width: 217px">
                            <asp:DropDownList ID="dlhocham" runat="server" Width="169">
                            </asp:DropDownList>
                        </td>
                        <td style="text-align: left" class="style10">
                            Trình độ
                        </td>
                        <td>
                            <asp:DropDownList ID="dlhocvi" runat="server" Width="169">
                            </asp:DropDownList>
                        </td>
                        <td style="text-align: left" class="style10">
                            Chức danh</td>
                        <td>
                            <asp:DropDownList ID="dlchucdanh" runat="server" Width="169">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left; height: 22px;" class="style10">
                            Tôn giáo
                        </td>
                        <td style="height: 22px; width: 217px;">
                            <asp:DropDownList ID="dltongiao" runat="server" Width="169">
                            </asp:DropDownList>
                        </td>
                        <td style="text-align: left; height: 22px;" class="style10">
                            Chính trị</td>
                        <td style="height: 22px">
                            <asp:DropDownList ID="ddlchinhtri" runat="server" Width="169px">
                            </asp:DropDownList>
                        </td>
                        <td style="text-align: left; height: 22px;" class="style10">
                            TT hôn nhân
                        </td>
                        <td style="height: 22px">
                            <asp:DropDownList ID="dlkethon" runat="server" Width="169">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left; height: 42px;" class="style10">
                            Ngoại ngữ</td>
                        <td style="height: 42px; width: 217px;">
                            <asp:TextBox ID="txtngoaingu" runat="server" Width="162px"></asp:TextBox>
                        </td>
                        <td style="text-align: left; height: 42px;">
                            &nbsp;</td>
                        <td style="height: 42px">
                            &nbsp;</td>
                        <td style="text-align: left; height: 42px;">
                            &nbsp;</td>
                        <td style="height: 42px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style12" style="text-align: left">
                            Hình đại diện
                        </td>
                        <td colspan="5">
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            <asp:FileUpload ID="FileUpload1" runat="server" Width="350px" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" style="text-align: center" colspan="6">
                            <asp:Button ID="Button1" runat="server" CssClass="buttonLogin" 
                                onclick="Button1_Click" Text="Cập nhật" />
                            <asp:Label ID="lblthongbao" runat="server"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
           
        
        
        </td>
    </tr>
</tbody></table>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

 
    <style type="text/css">
        .style9
        {
            width: 761px;
        }
        .style10
        {
            font-size: xx-small;
        }
        .style11
        {
            background: #fff url('../App_Themes/usertheme/images/Title_bg.jpg');
            line-height: 24px;
            height: 25px;
            border: 1px solid #CCC;
            margin: 0px 0px 0px 0px;
            font-weight: bold;
            font-size: xx-small;
        }
        .style12
        {
            width: 143px;
            font-size: xx-small;
        }
    </style>


</asp:Content>


