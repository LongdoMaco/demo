<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterpagePublic.master" AutoEventWireup="true" CodeFile="dmchuyende.aspx.cs" Inherits="public_dmchuyende" Title="Untitled Page" %>
<%@ Register TagPrefix="cc1" Namespace="SiteUtils"
Assembly="CollectionPager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 145px;
            text-align: center;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="chuyende_connten">
<div id="chuyende_connten_title">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <hr />
    
</div>
<div id="chuyende_content_list">
    <asp:DataList ID="DataList1" runat="server" Width="100%">
        <ItemTemplate>
            <table class="style1" 
                style="border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: #000000">
                <tr>
                    <td class="style2" rowspan="2" valign="top" align="left" 
                        style="border-right-style: dotted; border-right-width: 1px; border-right-color: #CCCCCC">
                        <asp:Image ID="Image1" runat="server" 
                            ImageUrl='<%# Eval("HinhAnh","~/Image/imagetintuc/{0}") %>' Height="116px" 
                            Width="115px" />
                    </td>
                    <td style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #CCCCCC">
                        <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("TieuDe") %>' 
                            NavigateUrl='<%# Eval("BanTinID","~/public/chitiet.aspx?ID={0}") %>'></asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        &nbsp;
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("TrichDan") %>'></asp:Label>
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
   <CC1:COLLECTIONPAGER id="CollectionPager1" runat="server">
</CC1:COLLECTIONPAGER>
    
</div>
</div>
</asp:Content>

