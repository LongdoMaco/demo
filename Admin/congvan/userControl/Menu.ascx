<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="Admin_nhansu_UserControl_WebUserControl2" %>
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
<li><asp:HyperLink ID="mntrangchu" NavigateUrl="~/Admin/congvan/Default.aspx" runat="server">Trang chủ</asp:HyperLink></li>
<li><asp:HyperLink ID="mnqtct" NavigateUrl="" runat="server">Công văn đến</asp:HyperLink>
				<ul>
				<li> <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Admin/congvan/cvden.aspx">Quản trị công văn đến</asp:HyperLink></li>
               <li> <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/congvan/nhapcvden.aspx">Nhập công văn đến</asp:HyperLink></li>
                <li><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Admin/congvan/nhaplieucvden.aspx">Nhập liệu công văn đến</asp:HyperLink></li>
                
				</ul>	
</li>

<li><asp:HyperLink ID="mnkt"   NavigateUrl=""  runat="server">Công văn đi</asp:HyperLink>
<ul>
 <li> <asp:HyperLink ID="HyperLink3" NavigateUrl="~/Admin/congvan/cvdi.aspx" runat="server">Quản trị công văn đi</asp:HyperLink></li>
   <li> <asp:HyperLink ID="HyperLink10" NavigateUrl="~/Admin/congvan/nhapcvdi.aspx" runat="server">Nhập công văn đi</asp:HyperLink></li>
     <li><asp:HyperLink ID="HyperLink11" NavigateUrl="~/Admin/congvan/nhaplieucvdi.aspx" runat="server">Nhập liệu công văn đi</asp:HyperLink></li>
</ul>
</li>

   
</ul>			
		
	</div><!--End #container-->
	<div id="sitemapcongvan" >
	 <asp:SiteMapPath ID="SiteMapPath1" SiteMapProvider="W2" runat="server" 
            Font-Bold="True" Font-Names="Verdana" Font-Size="1em" PathSeparator=" : ">
         <PathSeparatorStyle Font-Bold="True" ForeColor="#990000" />
         <CurrentNodeStyle ForeColor="#333333" />
         <NodeStyle Font-Bold="True" ForeColor="#990000" />
         <RootNodeStyle Font-Bold="True" ForeColor="#FF8000" />
    </asp:SiteMapPath>
	
	</div>


