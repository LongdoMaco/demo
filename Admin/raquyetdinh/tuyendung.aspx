<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tuyendung.aspx.cs" Inherits="Admin_raquyetdinh_tuyendung" %>

<%@ Register assembly="DundasWebOlapDataProviderAdomdNet" namespace="Dundas.Olap.Data.AdomdNet" tagprefix="DODPN" %>
<%@ Register assembly="DundasWebUIControls" namespace="Dundas.Olap.WebUIControls" tagprefix="DOCWC" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>UNI - PORTAL</title>
    <link href ="../../App_Themes/Basic/quyetdinh.css" rel="stylesheet" type="text/css" />
    
    <style type="text/css">
        .style1
        {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
     <div class="page">

        <div id="header">
            <div id="title">
                <h1>HỆ THỐNG UNI-PORTAL<BR> TRƯỜNG ĐẠI HỌC BÁCH KHOA, ĐẠI HỌC ĐÀ NẴNG<br/></h1>
            </div>
            <div id="logindisplay">
                Chào
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <asp:LinkButton ID="LinkButton1" runat="server" >Thoát</asp:LinkButton>
            </div>            
            <div id="menucontainer">
            
                <ul id="menu">              
                  
                    <li><a href ="/Admin/Default.aspx">Trang chủ</a></li>
                    <li><a href ="/user/Default.aspx">Trang người dùng</a></li>
                </ul>
            
            </div>
        </div>
         <div id="main"> 
        <div style ="width :100%">            
            <DODPN:AdomdNetDataProvider ID="AdomdNetDataProvider1" runat="server" 
                ConnectionString="Data Source=localhost; Catalog=Ra_quyetdinh_Tuyendung;">
            </DODPN:AdomdNetDataProvider>
            <DOCWC:OlapClient ID="OlapClient1" runat="server" 
                DataProviderID="AdomdNetDataProvider1" height="540px" width="900px">
<ToolbarSettings>
<Maximize Description="Switch to simple view"></Maximize>
</ToolbarSettings>

<ToolbarStyle BackColor="White" BorderColor="" BorderWidth="" PageColor="" ToolbarStyle="Flat1"></ToolbarStyle>
            </DOCWC:OlapClient>
        </div>                   
            <div id="footer" class="style1">
                Hiển thị tốt nhất ở trình duyệt Firefox 3+,IE 8+.Độ phân giải 1024x768</div>
        </div>
    </div>
    </form>
</body>
</html>
