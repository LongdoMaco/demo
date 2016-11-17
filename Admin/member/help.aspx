<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="help.aspx.cs" Inherits="Admin_member_help" %>

<%@ Register src="Usercontrol/menu.ascx" tagname="menu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="maincontainer">
<div id="nav">
    <uc1:menu ID="menu1" runat="server" />
</div>
</div>
</asp:Content>

