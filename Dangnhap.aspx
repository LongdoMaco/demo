<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dangnhap.aspx.cs" Inherits="Default2" Title="Trang Đăng Nhập" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
    
    body 
{
	padding: 0px;
	text-align: center;
	margin:0px;
	background-repeat:repeat-x; 
	font: 10pt tahoma, verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;
	background-image:url(Image/public/login_background.png);
}
.background
{
	
}
div.background
{
    position:fixed; 
    top:0px; 
    left:0px;  
    z-index:-1; 
    width:100%; 
    height:100%;
}

img.background
{
    width:100%; 
    height:100%;
    display: block;
}
a {
	font-family:Tahoma;
	font-size:13px;
	text-decoration: none;
 	color:#303030;
}
a:hover {
	font-size: 13px;
	COLOR:Maroon;
 	font-family: Tahoma;
 	border-bottom:1px solid #ddd;
}

.TableCenter
{
	width:400px;
	margin-left:auto;
	border: 1px solid #DDD;
	margin-right:auto;
	background-color:#fff;
}
.divtopnavleft
{
	width:500px;
	float:left;
}
.divtopnavright
{
	width:500px;
	float:right;
}
.divframe
{
	position:relative;
	border: 1px solid #CCC;
	padding:1px;
	margin: 0px 0px 0px 0px;
}
.divframe_head
{
	background: #fff url(Image/public/Title_bg.jpg);
	line-height:24px;
	height:25px;
	border-bottom: 1px solid #CCC;
	margin: 0px 0px 0px 0px;
	font-weight:bold;
}
.textboxLogin
{
	color:Gray;
	font-size:11px;
	font-weight:bold;
	
}

.buttonLogin{
	font: 11pt tahoma;
	background: #fff url(Image/public/Title_bg.jpg);
	border:1px solid #AFC4D5;
	color:#000000;
	height:26px;
	text-decoration:none;
	cursor: hand;
	
}
.TableCenterMaster
{
	width:1000px;
	margin-left:auto;
	border: 1px solid #DDD;
	margin-right:auto;
	background-color:#fff;
}
.divframe_headSelected
{
	background: #fff url(images/headselected.png);
	line-height:24px;
	height:25px;
	text-align:center;
	border-bottom: 1px solid #CCC;
	margin: 0px 0px 0px 0px;
	font-weight:bold;
}
.accoditionContent
{
	border: 1px dashed #CCC;
	border-top: none;
    padding: 5px;
    line-height:25px;
    padding-top: 10px;
}
.accoditionHeader
{
	background: #fff url(Image/public/Title_bg.jpg);
	line-height:24px;
	height:25px;
	text-align:center;
	border: 1px solid #CCC;
	margin: 0px 0px 0px 0px;
	font-weight:bold;
}
    </style>

    <script language="javascript" type="text/javascript">
// <!CDATA[

      

// ]]>
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div id="header">
    
    
    </div>
    <div class="background">
                <img src="Image/public/login_background.png" alt="" class="background">
            </div>
        <div>
    <br><br><br><br>
        <table class="TableCenter" cellpadding="0" cellspacing="0">
            <tbody><tr>
                <td colspan="2" class="divframe_head">
                    Đăng nhập</td>
            </tr>
            <tr>
                <td colspan="2" style="height: 30px;">
                   </td>
            </tr>
            <tr>
                <td style="padding-left: 10px; line-height: 28px;" align="left">Tên đăng nhập</td>
                <td style="line-height: 28px;" align="left">&nbsp;
                    <asp:TextBox ID="txtTaikhoan" runat="server" Width="200px"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="txtTaikhoan_TextBoxWatermarkExtender"
                        runat="server" Enabled="True" TargetControlID="txtTaikhoan" WatermarkText="username">
                    </asp:TextBoxWatermarkExtender>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="txtTaikhoan" ErrorMessage="*"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td style="padding-left: 10px; line-height: 28px;" align="left">
                    Mật khẩu</td>
                <td style="line-height: 28px;" align="left">&nbsp;<asp:TextBox ID="txtMatkhau" runat="server" TextMode="Password"
                    Width="200px"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="txtMatkhau_TextBoxWatermarkExtender"
                        runat="server" Enabled="True" TargetControlID="txtMatkhau" WatermarkText="********">
                    </asp:TextBoxWatermarkExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ControlToValidate="txtMatkhau" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="height: 38px;" colspan="2" valign="bottom" align="center">
                    &nbsp;<asp:Button ID="btLogin" runat="server" CssClass="buttonLogin" onclick="btLogin_Click" 
                        Text="Đăng Nhập" Width="85px" />
                </td>
            </tr>
            <tr>
                <td class="style3" align="left" colspan="2">
                    <asp:Label ID="labelMessag" runat="server" style="color: #FF0000"></asp:Label>
                </td>
            </tr>
        </tbody></table>
    
    </div>
      <div id="footer">
    
    
    </div>
    </form>
</body>
</html>
