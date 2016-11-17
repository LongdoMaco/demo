<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterpagePublic.master" AutoEventWireup="true" CodeFile="chitiet.aspx.cs" Inherits="public_chitiet" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style  type="text/css" >
.keyword
{
	float:right;
	} 
	
.space
{
	height:10px;
}   

</style>
    <link href="../App_Themes/chitiettintuct.css" rel="stylesheet" type="text/css" />  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content_main">
    <div class="content_chuyenmuc">
    <div class="content_chuyenmuc_letf">
        <asp:Label ID="lblChuyenDe" runat="server"  CssClass="lblchuyende"
            style="font-weight: 700; color: #FF6600; font-size: medium;"></asp:Label>
           
          </div>
          <div class="content_chuyenmuc_right">           
  Ngày Đăng :<asp:Label 
            ID="lblNgayDang" runat="server" style="font-style: italic" Text="Label"></asp:Label>
        </div>
        <div style="clear:both"></div>    
      </div>
        <div class="space"></div>
    <div class="conent_main_head">
    
        <asp:Label ID="lblTieuDe" runat="server" style="font-weight: 700"></asp:Label>
       
        
    
    </div>
    <div class="content_main_list">
        <asp:Label ID="lblNoiDung" runat="server"></asp:Label>
    </div>
    <div class="footer_post">
    <div class="class_author">
    
        Tác Giả :<asp:Label ID="tacgia" CssClass="tacgia" runat="server" Text=""></asp:Label>
    
    </div>
    <div class="keyword">
        nguồn :<asp:Label ID="nguon" runat="server" Text=""></asp:Label>
    </div>
    <div style="clear:both">
    </div>

    <div class="clear">
    </div>
    </div>

    </div>
</asp:Content>

