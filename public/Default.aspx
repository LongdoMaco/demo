<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterpagePublic.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="UNI.PUBLIC.public_Default" Title=".:: Trang thông tin ::." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../App_Themes/PublicTheme/Default_page.css" rel="stylesheet" type="text/css" />
 
    
    
    <link href="../App_Themes/tintuc.css" rel="stylesheet" type="text/css" />
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="main_content">
<div id="featured">
   
    <div id="featrued_left">
    <asp:FormView ID="FormView1" runat="server" Width="100%" style="height: 245px" 
            ondatabound="FormView1_DataBound">
        <ItemTemplate>
            <table class="style1">
                <tr>
                    <td style="text-align: center">
                        <asp:Image ID="Image1" runat="server" Height="194px"  CssClass="image_left"
                            ImageUrl='<%# Eval("HinhAnh","~/Image/imagetintuc/{0}") %>' Width="250px" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:HyperLink ID="HyperLink2" runat="server"  CssClass="txttieudeleft"
                            NavigateUrl='<%# Eval("BanTinID","~/public/chitiet.aspx?ID={0}") %>' 
                            Text='<%# Eval("TIEUDE") %>'></asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label1" runat="server" 
                            Text='<%# Eval("TrichDan") %>'></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
</div>
<div id="featrued_right"> 
    <asp:DataList ID="DataList1" runat="server" BackColor="White" 
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        GridLines="Both" Height="250px" Width="100%" style="margin-bottom: 16px">
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <ItemTemplate>
            <table class="style1">
                <tr>
                    <td class="style4">
                        <asp:Image ID="Image2" runat="server" Height="60px" 
                            ImageUrl='<%# Eval("HinhAnh","~/Image/imagetintuc/{0}") %>' Width="65px" />
                           
                    </td>
                    <td valign="top" style="padding-left:3px;">
                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="title_right" 
                            NavigateUrl='<%# Eval("BanTinID","~/public/chitiet.aspx?ID={0}") %>' 
                            Text='<%# Eval("TIEUDE") %>'></asp:HyperLink>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <ItemStyle ForeColor="#000066" />
        <SelectedItemStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
    </asp:DataList>
</div>
<div class="clear"></div>
</div><!-- end feuter-->
<%--beign list content--%>
<div id="content_list">
    <asp:DataList ID="DataList2" runat="server" Width="100%">
        <ItemTemplate>
             <table class="style1">
                <tr>
                    <td colspan="3" class="style3">
                        <asp:HyperLink ID="ChuyenMuc" CssClass="txtchuyenmuc" runat="server" Text='<%# Eval("TenChuyenDe") %>' 
                            NavigateUrl='<%# Eval("ChuyenDeID","~/public/dmchuyende.aspx?IDCD={0}") %>'></asp:HyperLink>
                    </td>
                </tr>
                <tr class="noidungtomtat">
                    <td class="style2" align="left" valign="top" width="20%">
                        <asp:Image ID="HinhAnh" runat="server" Height="100px" Width="140px" />
                    </td>
                    <td valign="top" class="style5" width="40%">
                   
                        <asp:HyperLink ID="TieuDeMoi" runat="server" CssClass="title2">[TieuDeMoi]</asp:HyperLink>
                        
                        <asp:Label ID="TomTatMoi" runat="server"></asp:Label>
                       
                    </td>
                    <td class="style6" valign="top">
                        <asp:DataList ID="BaiLienQuan" runat="server" BackColor="White" 
                            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                            ForeColor="Black" GridLines="Horizontal" 
                            onselectedindexchanged="BaiLienQuan_SelectedIndexChanged" Width="100%">
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <ItemTemplate>
                                <asp:HyperLink ID="LinkSite" runat="server" 
                                    NavigateUrl='<%# Eval("BanTinID","~/public/chitiet.aspx?ID={0}") %>' 
                                    Text='<%# Eval("TieuDe") %>'></asp:HyperLink>
                            </ItemTemplate>
                            <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        </asp:DataList>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
</div>
<%--end list content--%>
<div class="clear">
</div>
</div> <%--ket thuc --%>


    
</asp:Content>

