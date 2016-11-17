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
                    runat="server" NavigateUrl="~/Admin/nhansu/thongtincanhan.aspx">Thông tin cá nhân</asp:HyperLink>
                <br />
            </td>
            <td >
                <img alt="" src="../../Image/Icons/bonhiemngach.png" 
                    style="width: 66px; height: 76px" /><br />
                <asp:HyperLink ID="HyperLink3" 
                    runat="server" NavigateUrl="~/Admin/nhansu/bonhiemngach.aspx">Bổ nhiệm ngạch</asp:HyperLink>
            </td>
            <td  >
                <br />
                <img alt="" src="../../Image/Icons/daotao.png" 
                    style="width: 84px; height: 83px" /><br />
                <asp:HyperLink ID="HyperLink4" 
                    runat="server" NavigateUrl="~/Admin/nhansu/trinhdo.aspx">Quá trình đào tạo</asp:HyperLink>
            </td>
            <td >
                <br />
                <img alt="" src="../../Image/Icons/congtac.png" 
                    style="width: 105px; height: 83px" /><br />
                <asp:HyperLink ID="HyperLink13" 
                    runat="server" NavigateUrl="~/Admin/nhansu/qtct.aspx">Quá trình công tác</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td >
                &nbsp;<img alt="" src="../../Image/Icons/giadinh.png" 
                    style="width: 60px; height: 83px" /><br />
                <asp:HyperLink ID="HyperLink5" 
                    runat="server" NavigateUrl="~/Admin/nhansu/qhgd.aspx">Quan hệ gia đình</asp:HyperLink>
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
                    runat="server" NavigateUrl="~/Admin/nhansu/bncvdang.aspx">Bổ nhiệm chức vụ</asp:HyperLink>
            </td>
            <td >
                <img alt="" src="../../Image/Icons/khenthuong.png" 
                    style="width: 98px; height: 83px" /><br />
                <asp:HyperLink ID="HyperLink15" 
                    runat="server" NavigateUrl="~/Admin/khenthuong/kttapthe.aspx">Khen thưởng/Kỉ luật</asp:HyperLink>
            </td>
        </tr>
    </table>
    <table width="100%">
        <tr>
            <th colspan="4">
                Các chức năng khác
            </th>
        </tr>
       
        <tr>
            <td>
                &nbsp;<img alt="" src="../../Image/Icons/search.png" 
                    style="width: 54px; height: 81px" /><br />
                <asp:HyperLink 
                    ID="HyperLink9" runat="server" NavigateUrl="~/Admin/nhansu/timkiem.aspx">Tìm kiếm </asp:HyperLink>
            </td>
            <td>
                &nbsp;<img alt="" src="../../Image/Icons/thongke.png" 
                    style="width: 78px; height: 83px" /><br />
                <asp:HyperLink ID="HyperLink8" 
                    runat="server" NavigateUrl="~/Admin/nhansu/thongke.aspx">Thống kê</asp:HyperLink>
            </td>
            <td>
                <img alt="" src="../../Image/Icons/nhaplieu.png" 
                    style="width: 74px; height: 83px" /><br />
                <asp:HyperLink ID="HyperLink10" 
                    runat="server" NavigateUrl="~/Admin/nhansu/nhaplieu.aspx">Nhập liệu</asp:HyperLink>
&nbsp;</td>
            <td>
                <img alt="" src="../../Image/Icons/danhba.png" 
                    style="width: 95px; height: 83px" /><br />
                <asp:HyperLink ID="HyperLink12" runat="server" 
                    NavigateUrl="~/Admin/nhansu/danhba.aspx">Danh bạ</asp:HyperLink>
                <br />
                </td>
        </tr>
        <tr>
            <td>
                <img alt="" src="../../Image/Icons/quyen.png" 
                    style="width: 84px; height: 81px" /><br />
                <br />
                <asp:HyperLink ID="HyperLink16" runat="server" 
                    NavigateUrl="~/Admin/member/them.aspx">Thêm người dùng</asp:HyperLink>
                <br />
                <br />
                <br />
                <br />
            </td>
            <td>
                <img alt="" src="../../Image/Icons/daotao.png" 
                    style="width: 84px; height: 83px" /><br />
                <asp:HyperLink ID="HyperLink17" runat="server" 
                    NavigateUrl="~/Admin/nhansu/dspcgiangday.aspx">Phụ cấp giảng dạy</asp:HyperLink>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
    
</asp:Content>
