<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_nhansu_Default" Title="Quản lí nhân sự" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
     
     
   <table width="100%">
        <tr>
            <th colspan="3">
                Chức năng chính</th>
            <th style="text-align:right  ">
               &nbsp;</th>
        </tr>
        <tr>
            <td  >
                <img alt="" src="../../Image/Icons/user.png" 
                    style="width: 40px; height: 83px" /><br />
                <asp:HyperLink ID="HyperLink2" 
                    runat="server" NavigateUrl="~/Admin/nhansu/thongtincanhan.aspx">Hướng dẫn sử dụng</asp:HyperLink>
                <br />
            </td>
            <td >
                <img alt="" src="../../Image/Icons/bonhiemngach.png" 
                    style="width: 66px; height: 76px" /><br />
                <asp:HyperLink ID="HyperLink3" 
                    runat="server" NavigateUrl="~/Admin/Taichinh/khoitao.aspx">Khởi tạo lương tháng</asp:HyperLink>
            </td>
            <td  >
                <br />
                <img alt="" src="../../Image/Icons/daotao.png" 
                    style="width: 84px; height: 83px" /><br />
                <asp:HyperLink ID="HyperLink4" 
                    runat="server" NavigateUrl="~/Admin/Taichinh/chitietluongthang.aspx">Xem chi tiết lương</asp:HyperLink>
            </td>
            <td >
                <br />
                <img alt="" src="../../Image/Icons/congtac.png" 
                    style="width: 105px; height: 83px" /><br />
                <asp:HyperLink ID="HyperLink13" 
                    runat="server" NavigateUrl="~/Admin/Taichinh/phucapkhac.aspx">Phụ cấp hàng tháng</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td >
                &nbsp;<img alt="" src="../../Image/Icons/giadinh.png" 
                    style="width: 60px; height: 83px" /><br />
                <asp:HyperLink ID="HyperLink5" 
                    runat="server" NavigateUrl="~/Admin/Taichinh/TamUng.aspx">Tạm ứng lương</asp:HyperLink>
            </td>
            <td >
                <img alt="" src="../../Image/Icons/dicongtac.png" 
                    style="width: 84px; height: 83px" /><br />
                <asp:HyperLink ID="HyperLink14" 
                    runat="server" NavigateUrl="~/Admin/nhansu/ranuocngoai.aspx">Quá trình ra nước ngoài</asp:HyperLink>
            </td>
            <td >
                <img alt="" src="../../Image/Icons/chucvu.png" 
                    style="width: 92px; height: 83px" /><br />
                <asp:HyperLink ID="HyperLink6" 
                    runat="server" NavigateUrl="~/Admin/nhansu/bncvdang.aspx">Yêu cầu chức năng</asp:HyperLink>
            </td>
            <td >
                <br />
            </td>
        </tr>
    </table>
    <table width="100%">
        <tr>
            <th>
                Các chức năng khác
            </th>
        </tr>
       
        </table>
    
</asp:Content>
