<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master"  AutoEventWireup="true" CodeFile="thongke.aspx.cs" Inherits="Admin_NhanSus_ThongKeNS" Title="Untitled Page" %>

<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <table bgcolor="White" style="border: 1px solid #CCCCCC;" align="center" 
        cellspacing="10" width="100%">
        <tr>
            <td colspan="3" 
                style="text-align: left; font-size: large; ">
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="~/Admin/nhansu/Default.aspx">Trang chủ</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="3" class="style2" 
               >
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thống 
                kê nhân sự</td>
        </tr>
        <tr>
            <td style="width: 30%">
                Tổng cộng :</td>
                                <td style="width: 30%">
                                    <asp:Label ID="lblTongNV" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                                <td style="color: #FF0000; width:40%">
                                    <b>Tỉ Lệ:%</b></td>
                            </tr>
                            <tr>
                                <td style=" text-align:left">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Nam</td>
                                <td style="width: 182px">
                                    <asp:Label ID="lblNam" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbltlnam" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 197px; text-align: center">
                                    * Nữ
                                </td>
                                <td style="width: 182px">
                                    <asp:Label ID="lblNu" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbltlnu" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 197px">
                                    Đảng viên:<td style="width: 182px">
                                    <asp:Label ID="lblTongdangvien" runat="server" style="font-weight: 700"></asp:Label>
            <td>
                <asp:Label ID="lbltldv" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 197px; text-align: center">
                                    *Nam:</td>
                                <td style="width: 182px">
                                    <asp:Label ID="lblnamdv" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 197px; text-align: center">
                                    *Nữ:</td>
                                <td style="width: 182px">
                                    <asp:Label ID="lblnudv" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 197px">
                                    Học hàm(GS,PGS):</td>
                                <td style="width: 182px">
                                    <asp:Label ID="lblhgs" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="tlhamgs" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 197px">
                                    GV cao cấp:</td>
                                <td style="width: 182px">
                                    <asp:Label ID="lblgvcc" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="tlgvcc" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 197px">
                                    Giảng viên chính:</td>
                                <td style="width: 182px">
                                    <asp:Label ID="lblgvc" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="tlgvc" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 197px">
                                    Giảng viên:</td>
                                <td style="width: 182px">
                                    <asp:Label ID="lblgv" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="tlgv" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 197px">
                                    Trợ giảng:</td>
                                <td style="width: 182px">
                                    <asp:Label ID="lbltrogiang" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="tltg" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 197px">
                                    Tiến sĩ, TSKH:</td>
                                <td style="width: 182px">
                                    <asp:Label ID="lbltiensi" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="tlts" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 197px">
                                    Thạc sĩ:</td>
                                <td style="width: 182px">
                                    <asp:Label ID="lblthacsi" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="tlths" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 197px">
                                    Kỹ sư,cử nhân:</td>
                                <td style="width: 182px">
                                    <asp:Label ID="lblDaiHoc" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="tldh" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 197px">
                                    Cao đẳng</td>
                                <td style="width: 182px">
                                    <asp:Label ID="lblCaoDang" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="tlcd" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 197px">
                                    THCN</td>
                                <td style="width: 182px">
                                    <asp:Label ID="lbltrungcapcn" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="tltccn" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 197px">
                                    Trình độ khác<td>
            <td style="width: 182px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 197px">
                TrTr.do khác</td>
                                <td style="width: 182px">
                                    <asp:Label ID="lblTDK" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="tlkhac" runat="server" style="font-weight: 700"></asp:Label>
            </td>
                            </tr>
                            <tr>
                                <td style="width: 197px">
                                    Cán bộ PVGD:</td>
            <td style="width: 182px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 197px">
                Cán bộ GD:</td>
            <td style="width: 182px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 197px">
                &nbsp;</td>
            <td style="width: 182px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
   
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
    .style2
    {
        font-size: xx-large;
        font-weight: bold;
    }
</style>






</asp:Content>


