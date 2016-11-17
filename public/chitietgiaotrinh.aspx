<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterpagePublic.master" AutoEventWireup="true" CodeFile="chitietgiaotrinh.aspx.cs" Inherits="public_chitiettapchi" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../App_Themes/chitiettapchi.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            font-weight: normal;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="main">
<div class="header">
<div class="title">
<asp:Label ID="txttitle" CssClass="txttitle" runat="server" Text="Label"></asp:Label>
</div> 
<div class="linhvuc">
    <asp:Label ID="lblnguoidang" CssClass="lblnguoidang" runat="server"></asp:Label>
&nbsp; <span class="style1">ngày đăng :<asp:Label ID="lblngaydang" runat="server" 
        Text="Label"></asp:Label>
&nbsp;Lĩnh Vực :<asp:Label ID="lbllinhvuc" CssClass="lbllinhvuc" runat="server" Text="Label"></asp:Label>
    </span></div>
</div><%-- end header--%>
<div class="Tomtat">
<div class="Image">

    <asp:Image ID="hinhanh" CssClass="hinhanh" runat="server" Width="200px" Height="150px" />

</div><%-- end image--%>
<div class="Noidung">
    <asp:Label ID="lbltrichdan"  runat="server" Text="Label"></asp:Label>
    <br /> 
    <br />
    <br />
    <br />
    <br />
    <br />
</div>
<div  style="clear:both">
</div>
</div> <%--end tom tat--%>
<div class="content">
    <asp:Label ID="lblnoidung" runat="server"  Text="Label" CssClass="NoiDungChinh"></asp:Label>
</div> <%--end content--%>
<div class="download">


    <asp:ImageButton ID="ImageButton1" runat="server" 
        ImageUrl="~/Image/jpg/Download.png" onclick="ImageButton1_Click" />


</div> <%--end download--%>

</div> <%--end main--%>
<div style=" clear:both"></div>

</asp:Content>

