<%@ Control Language="C#" AutoEventWireup="true" CodeFile="menu.ascx.cs" Inherits="Admin_nhansu_UserControl_WebUserControl2" %>
<style type="text/css">
*{margin:0; padding: 0}

#container {
margin: 20px 0px 0px 0px;
float: left;
width:100%;

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
}

#container li a {
display: block;
color:#FFFFFF;
font-weight: bold;
text-decoration: none;
padding: .3em 3px;
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
<li><asp:HyperLink ID="mntrangchu" NavigateUrl="~/Admin/member/Default.aspx" runat="server">Trang chủ</asp:HyperLink></li>
<li><asp:HyperLink ID="mnbnn" NavigateUrl="~/Admin/member/them.aspx" runat="server">Thêm Người Dùng </asp:HyperLink></li>
<li><asp:HyperLink ID="HyperLink1" NavigateUrl="~/Admin/member/dsmodule.aspx" runat="server">Thêm Module</asp:HyperLink></li>
<li><asp:HyperLink ID="HyperLink2" NavigateUrl="~/Admin/member/dsquyen.aspx" runat="server">Thêm Quyền</asp:HyperLink></li>
<li><asp:HyperLink ID="HyperLink3" NavigateUrl="~/Admin/member/help.aspx" runat="server">Trợ giúp</asp:HyperLink></li>
</ul>			
		
	</div><!--End #container-->
	<div id="sitemapnhansu" >
	
	</div>


