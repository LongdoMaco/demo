<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_congvan_Default" %>



<%@ Register src="userControl/Menu.ascx" tagname="Menu" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <uc1:Menu ID="Menu1" runat="server" />
  
</asp:Content>

