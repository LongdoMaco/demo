<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControl.ascx.cs" Inherits="Admin_nhansu_UserControl_WebUserControl2" %>
<style type="text/css">
*{margin:0; padding: 0}

#container {
margin: 20px 0px 0px 0px;
float: left;
width:100%;
font-size:100%;

}
#container ul {
float: left;
list-style: none;
width:auto;
 
    }
#container  li a,#container  li  li a.CURRENT:link,#container li li a.CURRENT:visited,#container li  li a.CURRENT:actived
{
	 background-color:Blue;
}

#container ul li {
position: relative;
float: left;
margin-right:1px;
font-size:1em;
}

#container li a {
display: block;
color:#FFFFFF;
font-weight: bold;
text-decoration: none;
padding: .3em 1px;
text-align:left;
margin-right:1px;
background:#3883CC none repeat scroll 0 0;

border:solid 1px #CCCCCC;

}
#container li a:hover {
color: #D8DFEA;
background: orange;
}

#container li ul{
background: #3883CC;
position: absolute;
display: none;
width :200px;
}
#container li ul li a
{
background-color:#3883CC;

}

#container li:hover ul{
display: block;
}

#container ul li ul li {
width: 100%;
}
#sitemapnhansu
{
	float:left;
	text-align:left;
	
}
#container ul li  a :hover, #container ul li ul li a:active {
	background: red;
}

</style>
<div id="container">		
<ul>
<li><asp:HyperLink ID="mntrangchu" NavigateUrl="~/Admin/nhansu/Default.aspx" runat="server">Trang chủ</asp:HyperLink></li>
<li><asp:HyperLink ID="mnbnn" NavigateUrl="~/Admin/nhansu/bonhiemngach.aspx" runat="server">Bổ nhiệm ngạch</asp:HyperLink></li>
<li><asp:HyperLink ID="mndt" NavigateUrl="~/Admin/nhansu/trinhdo.aspx" runat="server">Quá trình đào tạo</asp:HyperLink></li>
<li><asp:HyperLink ID="mnqtct" NavigateUrl="" runat="server">Hoạt động</asp:HyperLink>
				<ul>
               <li> <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/nhansu/qtct.aspx">Quá trình công tác</asp:HyperLink></li>
                <li><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Admin/nhansu/ranuocngoai.aspx">Quá trình ra nước ngoài</asp:HyperLink></li>                
                
                <li><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Admin/nhansu/in_doandang.aspx">Ngày vào Đoàn/Đảng</asp:HyperLink></li>
				</ul>	
</li>
<li><asp:HyperLink ID="mnqhgd" NavigateUrl="~/Admin/nhansu/qhgd.aspx" runat="server">Quan hệ gia đình</asp:HyperLink></li>
<li><asp:HyperLink ID="mncv"  NavigateUrl=""  runat="server">Chức vụ </asp:HyperLink>
<ul>
 <li><asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/Admin/nhansu/bncvdang.aspx">Chức vụ Đảng</asp:HyperLink></li>
     <li><asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/Admin/nhansu/bncvdoanthe.aspx">Chức vụ Đoàn Thể</asp:HyperLink></li>
      <li><asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/Admin/nhansu/bncvchinhquyen.aspx">Chức vụ Chính Quyền</asp:HyperLink></li>
</ul>
</li>
<li><asp:HyperLink ID="mnkt"   NavigateUrl=""  runat="server">Khen thưởng</asp:HyperLink>
<ul>
   <li> <asp:HyperLink ID="HyperLink10" NavigateUrl="~/Admin/khenthuong/kttapthe.aspx" runat="server">Khen thưởng tập thể</asp:HyperLink></li>
     <li><asp:HyperLink ID="HyperLink11" NavigateUrl="~/Admin/khenthuong/ktcanhan.aspx" runat="server">Khen thưởng cá nhân</asp:HyperLink></li>
</ul>
</li>
<li><asp:HyperLink ID="mnkl"  NavigateUrl=""  runat="server">Kỷ Luật</asp:HyperLink>
<ul>
 <li> <asp:HyperLink ID="HyperLink12" NavigateUrl="~/Admin/khenthuong/kyluattapthe.aspx" runat="server">Kỷ luật tập thể</asp:HyperLink></li>
      <li><asp:HyperLink ID="HyperLink13" NavigateUrl="~/Admin/khenthuong/kyluatcanhan.aspx" runat="server">Kỷ luật cá nhân</asp:HyperLink></li>
</ul>
</li>
<li><asp:HyperLink ID="mnk"    NavigateUrl=""  runat="server">Chức năng khác</asp:HyperLink>
<ul>
   <li> <asp:HyperLink ID="HyperLink16" NavigateUrl="~/Admin/nhansu/nhaplieu.aspx" runat="server">Nhập liệu</asp:HyperLink></li>
    <li><asp:HyperLink ID="HyperLink17" NavigateUrl="~/Admin/nhansu/danhba.aspx" runat="server">Danh bạ</asp:HyperLink></li>
    <li><asp:HyperLink ID="HyperLink2" NavigateUrl="~/Admin/nhansu/action.aspx" runat="server">Trạng thái NV</asp:HyperLink></li>
</ul>
</li>   
<li><asp:HyperLink ID="HyperLink4"    NavigateUrl=""  runat="server">Thống kê - Tìm kiếm</asp:HyperLink>
<ul>
 <li><asp:HyperLink ID="HyperLink5" NavigateUrl="~/Admin/nhansu/timkiem.aspx" runat="server">Tìm kiếm</asp:HyperLink></li>
  <li>  <asp:HyperLink ID="HyperLink18" NavigateUrl="~/Admin/nhansu/thongke.aspx" runat="server">Thống kê</asp:HyperLink></li>
   <li> <asp:HyperLink ID="HyperLink19" NavigateUrl="~/Admin/nhansu/tddnn.aspx" runat="server">Theo dõi đi nước ngoài</asp:HyperLink></li>
   
</ul>
</li>

</ul>			
		
	</div><!--End #container-->
	<div id="sitemapnhansu" >
	 <asp:SiteMapPath ID="SiteMapPath1" SiteMapProvider="W1" runat="server" 
            Font-Bold="True" Font-Names="Verdana" Font-Size="1em" PathSeparator=" : ">
         <PathSeparatorStyle Font-Bold="True" ForeColor="#990000" />
         <CurrentNodeStyle ForeColor="#333333" />
         <NodeStyle Font-Bold="True" ForeColor="#990000" />
         <RootNodeStyle Font-Bold="True" ForeColor="#FF8000" />
    </asp:SiteMapPath>
	
	</div>


