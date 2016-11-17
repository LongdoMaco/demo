<%@ Page  Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="bonhiemngach.aspx.cs" Inherits="Admin_nhansu_bonhiemngach" Title="Bổ nhiệm ngạch" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style4
        {
            font-size: medium;
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style2">
        <tr>
            <td colspan="4">
                <uc1:WebUserControl ID="WebUserControl1" runat="server" />
            </td>
        </tr>
        <tr>
            <td style=" width:20%">
								               
								                Đơn vị</td>
            <td style=" width:30%">
								                    <asp:dropdownlist id="dlChuyende" runat="server" AutoPostBack="True" 
                                                    Width="100%" onselectedindexchanged="dlChuyende_SelectedIndexChanged" 
                                                        CssClass="Dropdownlist"></asp:dropdownlist>
								            </td>
            <td style=" width:20%">
                Chọn CBVC</td>
            <td style=" width:30%">
								                <asp:DropDownList ID="dlthongtin" 
                    runat="server" Width="100%" CssClass="Dropdownlist" AutoPostBack="True" 
                                                    onselectedindexchanged="dlthongtin_SelectedIndexChanged" ></asp:DropDownList>
								            </td>
        </tr>
        <tr>
            <td>
                Ngày bắt đầu làm việc</td>
            <td>
                                                <asp:TextBox ID="txtngaybatdau" runat="server" Width="100%"></asp:TextBox>
                                                 <asp:CalendarExtender ID="txttungay_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="txtngaybatdau" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                                            </td>
            <td>
                Ngày tuyển dụng</td>
            <td>
                                                <asp:TextBox ID="txtngaytuyendung" 
                    runat="server" Width="100%"></asp:TextBox>
                                                 <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                    Enabled="True" TargetControlID="txtngaytuyendung" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                                            </td>
        </tr>
        <tr>
            <td>
                Loại hợp đồng</td>
            <td>
                            <asp:DropDownList ID="dlloaihopdong" runat="server" Width="239px" 
                                CssClass="Dropdownlist">
                            </asp:DropDownList>
                                            </td>
            <td>
                Ngày hết tập sự </td>
            <td>
                                                <asp:TextBox ID="txtngayhettapsu" 
                    runat="server" Width="100%"></asp:TextBox>
                                                 <asp:CalendarExtender ID="CalendarExtender2" runat="server" 
                    Enabled="True" TargetControlID="txtngayhettapsu" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                                            </td>
        </tr>
        <tr>
            <td>
                Ngày tăng lương trước thời hạn&nbsp;</td>
            <td>
                                                <asp:TextBox ID="txttangluong" runat="server" 
                    Width="100%"  ></asp:TextBox>
                                                 <asp:CalendarExtender ID="CalendarExtender3" runat="server" 
                    Enabled="True" TargetControlID="txttangluong" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                                            </td>
            <td>
                Ngày bổ nhiệm ngạch</td>
            <td>
                                                <asp:TextBox ID="txtngaybonhiem" runat="server" 
                    Width="100%"></asp:TextBox>
                                                          <asp:CalendarExtender ID="CalendarExtender5" runat="server" 
                    Enabled="True" TargetControlID="txtngaybonhiem" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                                            </td>
        </tr>
        <tr>
            <td>
                Bậc trong ngạch</td>
            <td>
                                                <asp:TextBox ID="txtbactrongngach" 
                    runat="server" Width="100%"></asp:TextBox>
                                            </td>
            <td>
                                                Mã ngạch</td>
            <td>
                                                <asp:DropDownList ID="dlmavienchuc" 
                    runat="server" Width="100%" 
                                                    style="text-align: left" CssClass="Dropdownlist"> </asp:DropDownList>	</td>
        </tr>
        <tr>
            <td>
                                                Hệ số lương</td>
            <td>
                                                <asp:DropDownList ID="dlhesoluong" 
                    runat="server" Width="239px" CssClass="Dropdownlist" > </asp:DropDownList>	</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Thời gian nâng bậc lương lần sau:</td>
            <td>
                                                <asp:TextBox ID="txtngayhuongluong" 
                    runat="server" Width="100%"></asp:TextBox>
                                                 <asp:CalendarExtender ID="CalendarExtender4" runat="server" 
                    Enabled="True" TargetControlID="txtngayhuongluong" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                                            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Phụ cấp thâm niên vượt khung</td>
            <td>
									            <asp:TextBox ID="txthesothamnien" 
                    runat="server" Width="100%"></asp:TextBox>
                                            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Công việc đang làm</td>
            <td colspan="3">
                                                <INPUT id="txtdanglam" style="WIDTH: 403px; HEIGHT: 30px; text-align: left;" 
                                                    type="text" maxLength="100"
														name="txtdanglam" runat="server" language="javascript" ></td>
        </tr>
        <tr>
            <td colspan="4">
									<asp:GridView ID="GridView1" CssClass="Gridview" runat="server" 
                                        AutoGenerateColumns="False" Width="100%" 
                                        PageSize="2">
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="cbheader" runat="server" AutoPostBack="True" 
                                                        oncheckedchanged="cbheader_CheckedChanged1" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="cbitem" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="MAVIENCHUC" HeaderText="Mã ngạch" />
                                            <asp:BoundField DataField="HOVATEN" HeaderText="Họ và tên" />
                                            <asp:BoundField DataField="NGAYBATDAU" HeaderText="Ngày bắt dầu" />
                                            <asp:BoundField DataField="NGAYTUYENDUNG" HeaderText="Ngày TD" />
                                            <asp:BoundField DataField="NGAYBONHIEM" HeaderText="Ngày bổ nhiệm" />
                                            <asp:BoundField DataField="HESOLUONG" HeaderText="HS lương" />
                                            <asp:BoundField DataField="NGAYHUONGLUONG" HeaderText="Ngày hưởng" />
                                            <asp:BoundField DataField="CONGVIECBONHIEM" HeaderText="Công việc đang làm" />
                                            <asp:TemplateField HeaderText="Xem">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtedit" runat="server" onclick="lbtedit_Click">Xem</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                    <PagerStyle CssClass="headergrid" />
                    <HeaderStyle CssClass="headergrid" />
                                        <EmptyDataTemplate>
                                            <b><span class="style4">Chưa Có Dữ Liệu </span></b>
                                        </EmptyDataTemplate>
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#2461BF" />
                                    </asp:GridView>
                                    </td>
        </tr>
        <tr>
            <td align="center" colspan="4" >
                                    <asp:Button ID="btnThemMoi" runat="server" onclick="btnThemMoi_Click" 
                                        Text="Thêm Mới" CssClass="btn" />
                                    <asp:Button ID="btnCapNhat" runat="server" Text="Cập Nhật" 
                                        onclick="btnCapNhat_Click" CssClass="btn" />
                                    <asp:Button ID="btnXoa" runat="server" Text="Xóa" onclick="btnXoa_Click" 
                                        CssClass="btn" Width="55px" />
                                    </td>
        </tr>
        <tr>
            <td colspan="4">
                                    <asp:Label ID="Label5" runat="server" 
                    style="color: #FF0000"></asp:Label>
                                    </td>
        </tr>
    </table>
</asp:Content>

