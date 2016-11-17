<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="lichtuan.aspx.cs" Inherits="Admin_lichtuan_lichtuan"  EnableEventValidation="false" %>

<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    <table width="1000" cellspacing="10" cellpadding="0" border="0" style="background-color: White;">
        <tbody align ="center">
            <tr>
                <td align="left" class="auto-style5" style="width: 100%;">Đăng ký lịch tuần</td>
            </tr>
            <tr>
                <td valign="top" align="center" style="border: 1px solid rgb(223, 223, 223); background-color: rgb(246, 246, 246);">
                    <table bgcolor="White" style="width: 80%;" cellspacing="10" class="auto-style6">
                        <tr align="center">
                            <td class="auto-style9">Tuần :</td>
                            <td style="height: 23px">
                                <asp:DropDownList ID="ddMaTuan" runat="server" Width="200px" AutoPostBack="True" CssClass="Dropdownlist" OnSelectedIndexChanged="ddMaTuan_SelectedIndexChanged">
                                </asp:DropDownList>                                 
                            </td>
                            <td style="height: 23px">&nbsp;</td>
                            <td style="height: 23px">
                                <asp:TextBox ID="txttungay" runat="server" Width="200px" CssClass="auto-style6"></asp:TextBox>
                            </td>
                            <td style="height: 23px">&nbsp;</td>
                            <td style="height: 23px">
                                <asp:TextBox ID="txtdenngay" runat="server" Width="200px" CssClass="auto-style6"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style10">Thứ:</td>
                            <td>
                                <asp:DropDownList ID="ddMaThu" runat="server" Width="200px" CssClass="auto-style6">
                                </asp:DropDownList>
                            </td>
                            <td>Ngày</td>
                            <td>
                                <asp:TextBox ID="txtNgay" runat="server" Width="200px" CssClass="auto-style6"></asp:TextBox>
                                <asp:CalendarExtender ID="txtNgay_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtNgay"  Format="dd/MM/yyyy" >
                </asp:CalendarExtender>
                            </td>
                            <td>Lúc</td>
                            <td>
                                <asp:TextBox ID="txtThoigian" runat="server" Width="200px" CssClass="auto-style6"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td class="auto-style10">Địa điểm:</td>
                            <td colspan="5">
                                <asp:DropDownList ID="ddMaHoitruong" runat="server" Width="200px" CssClass="auto-style6">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">Chủ trì:</td>
                            <td class="style11" colspan="5">
                                <asp:TextBox ID="txtChutri" runat="server" Width="500px" CssClass="auto-style6"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td class="auto-style10">Nội dung:</td>
                            <td colspan="5">
                                <FTB:FreeTextBox ID="txtNoidung" runat="server" Height="220px"
                                    ImageGalleryPath="~/Image/imagetapchi/"
                                    ToolbarLayout="ToolbarLayout=&quot;ParagraphMenu, FontFacesMenu, FontSizesMenu, FontForeColorsMenu, bold,italic,underline, bulletedlist, numberedlist|;Superscript, Subscript, CreateLink, Unlink, RemoveFormat, JustifyLeft, JustifyRight, JustifyCenter, JustifyFull, Indent, Outdent, Cut, Copy|;Paste, Delete, Undo, Redo, Print, SymbolsMenu, InsertHtmlMenu, InsertRule, InsertDate,InsertImage, InsertTime, WordClean,; InsertTable, EditTable, InsertTableRowBefore, InsertTableRowAfter, DeleteTableRow, InsertTableColumnBefore, InsertTableColumnAfter,Delete, DeleteTableColumn, InsertForm, InsertForm, Preview;| InsertTextBox, InsertTextArea, InsertRadioButton, InsertCheckBox, InsertDropDownList, InsertButton, InsertDiv, InsertImageFromGallery, SelectAll, EditStyle&quot; SupportFolder=&quot;../aspnet_client/FreeTextBox/&quot; ImageGalleryPath=&quot;/Image/imagetapchic/&quot;"
                                    Width="100%">
                                </FTB:FreeTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Thành phần</td>
                            <td class="style10" colspan="5">
                                <FTB:FreeTextBox ID="txttrichdan" runat="server" Height="150px"
                                    ImageGalleryPath="~/Image/imagetapchi/"
                                    ToolbarLayout="ToolbarLayout=&quot; EditStyle&quot; SupportFolder=&quot;../aspnet_client/FreeTextBox/&quot; ImageGalleryPath=&quot;/Image/imagetapchi/&quot;"
                                    Width="100%">
                                </FTB:FreeTextBox>
                            </td>
                        </tr>
                        <!--
                        <tr>
                            <td style="width: 155px" class="auto-style2">
                                File đính kèm</td>
                            <td colspan="5">
                                <asp:FileUpload ID="fuldinhkem" runat="server" CssClass="auto-style6" />
                            </td>
                        </tr>
                        -->
                        <tr>
                            <td class="auto-style11">&nbsp;</td>
                            <td colspan="5" class="auto-style7">
                                <asp:Button ID="btnDang" runat="server" Text="Đăng" OnClick="btnDang_Click" CssClass="auto-style6" Width="98px" />
                                &nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click"
                                    Text="Cập Nhật" CssClass="auto-style6" />
                                <br />
                                <asp:Label ID="Label1" runat="server" Style="color: #FF3300"></asp:Label>
                            &nbsp;<br />
                                <asp:Label ID="lblTenlich" runat="server" Text="Lịch của đơn vị đã đăng ký" CssClass="auto-style8"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td colspan="6">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                    BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px"
                                    CellPadding="4" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                                    Width="100%" CssClass="auto-style6">
                                    <RowStyle BackColor="White" ForeColor="#330099" />
                                    <Columns>
                                        <asp:TemplateField Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="MaLichtuan" runat="server" Text='<%# Eval("MaLichtuan") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Thu" HeaderText="Thứ" />
                                        <asp:BoundField DataField="Ngay" HeaderText="Ngày" />
                                        <asp:BoundField DataField="ThoiGian" HeaderText="Thời gian" />
                                        <asp:TemplateField Visible="true" HeaderText="Nội dung">
                                            <ItemTemplate>
                                                <asp:Label ID="Noidung" runat="server" Text='<%# Eval("Noidung") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="true" HeaderText="Thành phần">
                                            <ItemTemplate>
                                                <asp:Label ID="Thanhphan" runat="server" Text='<%# Eval("Thanhphan") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Chutri" HeaderText="Chủ trì" />
                                        <asp:BoundField DataField="TenHoitruong" HeaderText="Địa điểm" />
                                        <asp:BoundField DataField="HOVATEN" HeaderText="Người ĐK" />
                                        <asp:TemplateField HeaderText="Sửa">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Sửa</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Xóa">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" OnClientClick="return confirm(&quot;Bạn có muốn xóa nó không/&quot;);">Xóa</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Duyệt">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click"><%# Eval("Trangthai") %></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                    <EmptyDataTemplate>
                                        Chưa có giáo trình nào cả
                                    </EmptyDataTemplate>
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 125px">
                    <asp:Button ID="btXuatcel" runat="server" OnClick="btXuatcel_Click" Text="Xuất lịch tuần ra Excel" />
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

 
    <style type="text/css">
        .style8
        {
            width: 155px;
            font-weight: bold;
            height: 31px;
        }
        .style9
        {
            width: 155px;
            height: 44px;
        }
        .style10
        {
            height: 44px;
        }
        .style11
        {
            height: 31px;
        }
        .auto-style2 {
            font-weight: bold;
        }
        .auto-style3 {
            width: 954px;
            height: 44px;
            font-weight: bold;
        }
        .auto-style4 {
            width: 954px;
            font-weight: bold;
            height: 31px;
            min-height: 800px;
            }
        .auto-style5 {
            background: #fff url('../App_Themes/usertheme/images/Title_bg.jpg');
            line-height: 24px;
            height: 25px;
            border: 1px solid #CCC;
            margin: 0px 0px 0px 0px;
            font-weight: bold;
            text-align: center;
        }
        .auto-style6 {
            font-size: small;
        }
        .auto-style7 {
            text-align: center;
        }
        .auto-style8 {
            font-size: medium;
        }
        .auto-style9 {
            font-weight: bold;
            left: 0px;
            top: 0px;
            height: 23px;
            width: 954px;
        }
        .auto-style10 {
            font-weight: bold;
            left: 0px;
            top: 0px;
            width: 954px;
        }
        .auto-style11 {
            width: 954px;
        }
    </style>


</asp:Content>


