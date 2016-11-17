<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterpagePublic.master" AutoEventWireup="true" CodeFile="tapchi.aspx.cs" Inherits="public_Default2" Title="Tạp chí" %>
<%@ Register TagPrefix="cc1" Namespace="SiteUtils"
Assembly="CollectionPager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../App_Themes/TapChi.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            font-weight: normal;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
  
    <asp:DataList ID="DataList1" runat="server" Width="100%">
        <ItemTemplate>
              <div class="item">
    <div class="left"> 
        <asp:Image ID="Image1" runat="server"  Width="75px" Height="75px" 
            ImageUrl='<%# Eval("HINHANH","~/Image/imagetapchi/{0}") %>' />
    
    </div> <%-- end div left--%>
    
    <div class="right">
    <div class="title">
        <asp:HyperLink ID="HyperLink2" runat="server"  CssClass="txttieude " 
            NavigateUrl='<%# Eval("ID","~/public/chitiettapchi.aspx?MaSo={0}") %>' 
            Text='<%# Eval("TIEUDE") %>'></asp:HyperLink>
    </div> <%--end div title--%>
    <div class="Author">
        <asp:Label ID="txtauthor" CssClass="txtauthor" runat="server" 
            Text='<%# Eval("HOVATEN") %>'></asp:Label>
        &nbsp;<span class="style1">gởi vào ngày ngày </span>
        <asp:Label ID="txtngaygoi" runat="server" Text='<%# Eval("NGAYDANG") %>' 
            CssClass="txtngaygoi"></asp:Label>
        </div>
      <div class="quote">
          <asp:Label ID="txttomtat"  CssClass="txttomtat" runat="server" Text='<%# Eval("TOMTAT") %>'></asp:Label>
        </div>
        <div class="continue">
        
            <asp:Label ID="lblloai" CssClass="lblloai" Text='<%# Eval("LOAI") %>' 
                runat="server"></asp:Label>
        
        </div>
   </div><%-- end div right--%>
   <div style="clear:both"></div>
    </div>
    <div style="clear:both"></div>
   
        </ItemTemplate>
    </asp:DataList>
    <CC1:COLLECTIONPAGER id="CollectionPager1" runat="server" 
        ResultsFormat="Kết quả hiển thị {0}-{1} (of {2})">
</CC1:COLLECTIONPAGER>
  
</asp:Content>

