<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master"AutoEventWireup="true" CodeFile="ktcanhan.aspx.cs" Inherits="Admin_nhansu_in_ktcanhan" Title="KHEN THƯỞNG CÁ NHÂN" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>



<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>



<%@ Register src="../nhansu/UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc2" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%" bgcolor="White" cellpadding="5px">
        <tr>
            <td colspan="4" style="text-align: center">
                                                <uc2:WebUserControl ID="WebUserControl1" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="4">
                                                &nbsp;Bạn đang xem thông tin của :
                                                <asp:Label ID="Label6" runat="server" Font-Bold="True"></asp:Label>
                                            </td>
        </tr>
        <tr>
            <td>
                                                <asp:Label ID="lbldonvi" runat="server" style="font-weight: 700" 
                                                    Text="Chọn đơn vị:"></asp:Label>
                                                :&nbsp;</td>
            <td>
                                                <asp:DropDownList ID="ddlDonVi" runat="server" Width="250px" AutoPostBack="True" 
                                                    CssClass="Dropdownlist" 
                                                    onselectedindexchanged="ddlDonVi_SelectedIndexChanged">
                                                </asp:DropDownList>
            </td>
            <td>
                <b>Chọn CBVC</b></td>
            <td>
                                                <asp:DropDownList ID="ddlNhanVien" runat="server" Width="300px" 
                                                    AutoPostBack="True" CssClass="Dropdownlist" 
                                                    onselectedindexchanged="ddlNhanVien_SelectedIndexChanged">
                                                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Hình thức</td>
            <td>
                                                <asp:DropDownList ID="dlhinhthuc" runat="server" AutoPostBack="True" Width="160" 
                                                    style="text-align: left" 
                                                    onselectedindexchanged="dlhinhthuc_SelectedIndexChanged" 
                                                    CssClass="Dropdownlist"> </asp:DropDownList>	
            </td>
            <td>
                Được tặng
            </td>
            <td>
                                                <asp:DropDownList ID="dlduoctang" runat="server" Width="300px" 
                                                    AutoPostBack="True" 
                                                    CssClass="Dropdownlist" 
                                                    onselectedindexchanged="dlduoctang_SelectedIndexChanged" > </asp:DropDownList>	
            </td>
        </tr>
        <tr>
            <td class="style2">
                Năm học
            </td>
            <td class="style2">
                                                <asp:DropDownList ID="dlnamhoc" runat="server" Width="160px" AutoPostBack="True" 
                                                    CssClass="Dropdownlist" > </asp:DropDownList>	
            </td>
            <td class="style2">
                </td>
            <td class="style2">
                </td>
        </tr>
        <tr>
            <td>
                Nội dung:</td>
            <td colspan="3">
                                                <asp:TextBox ID="txtnoidung" runat="server" Height="55px" TextMode="MultiLine" 
                                                    Width="710px"></asp:TextBox>
                                            </td>
        </tr>
        <tr>
            <td>
                Quyến định số
            </td>
            <td>
                                                <asp:TextBox ID="txtQD" runat="server" Width="200px"></asp:TextBox>
                                            </td>
            <td>
                Người ký</td>
            <td>
                                                <asp:TextBox ID="txtNguoiKi" runat="server" Width="200px"></asp:TextBox>
                                            </td>
        </tr>
        <tr>
            <td>
                Ngày ký</td>
            <td>
                                                <asp:TextBox ID="txtngayki" runat="server" Width="200px"></asp:TextBox><asp:CalendarExtender TargetControlID="txtngayki"
                                                    ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy">
                                                </asp:CalendarExtender>
                                                
                                            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                                                Những tập thể được khen thưởng trong năm <b>&nbsp;<asp:Label ID="lblnamhoc" 
                                                    runat="server" ForeColor="White" 
                                                    style="color: #000000"></asp:Label>
                                                </b>
            </td>
        </tr>
        <tr>
            <td colspan="4">
									<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                        DataKeyNames="ID" AllowPaging="True" 
                                        AllowSorting="True" Width="100%" 
                                        onpageindexchanging="GridView1_PageIndexChanging">
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="cbheader" runat="server" AutoPostBack="True" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="cbitem" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="HOVATEN" HeaderText="Họ Và Tên" />
                                            <asp:BoundField DataField="DUOCTANG" HeaderText="Khen thưởng" />
                                            <asp:BoundField DataField="NAMHOC" HeaderText="Năm học" />
                                            <asp:TemplateField HeaderText="Xem">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtEdit" runat="server">Xem</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EmptyDataTemplate>
                                            <span class="style6"><b>Không Có Khen Thưởng Nào Cả</b></span>
                                        </EmptyDataTemplate>
                                         <FooterStyle BackColor="#21abfa" Font-Bold="True" ForeColor="#21abfa" />
                    <PagerStyle CssClass="headergrid" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#ffffff" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#21abfa" CssClass="headergrid" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#fffffff" />
                                    </asp:GridView>
                                    </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                                    <br />
                        <asp:Button ID="btnTaoMoi" runat="server" Text="Thêm mới" 
                            onclick="btnTaoMoi_Click" style="height: 26px" CssClass="btn" />
                        <asp:Button ID="btnCapNhat" runat="server" Text="Cập nhật" 
                            onclick="btnCapNhat_Click1" CssClass="btn" />
                        <asp:Button ID="btnXoa" runat="server" Text="Xóa" Width="79px" 
                            onclick="btnXoa_Click1" CssClass="btn" 
                                        onclientclick="return confirm(&quot;Ban Có Muốn Xóa Nó Không&quot;);" />
                        <br />
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                    </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

   
    <style type="text/css">
        .style2
        {
            height: 120px;
        }
    </style>


</asp:Content>


