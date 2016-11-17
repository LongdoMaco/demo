<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master"  AutoEventWireup="true"
    CodeFile="thongtincanhan.aspx.cs" Inherits="Admin_nhansu_in_tt" Title="Thông Tin Cá Nhân" %>


<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table id="Table3" style="border-collapse: collapse" cellspacing="0" cellpadding="0"
        width="100%">
        <tr>
            <td style="height: 24px; text-align: center;" align="right" bgcolor="White">
                <uc1:WebUserControl ID="WebUserControl1" runat="server" />
            </td>
        </tr>
       
        <tr>
            <td style="height: 24px" align="right" bgcolor="White">
            <p><span class="style3">Chọn đơn vị
                </span><span class="style2">&nbsp;</span>&nbsp;
                <asp:DropDownList ID="dlChuyende" runat="server" Font-Size="Medium" Font-Names="Times New Roman"
                    AutoPostBack="True" Width="300px" 
                    OnSelectedIndexChanged="dlChuyende_SelectedIndexChanged" 
                    CssClass="Dropdownlist">
                </asp:DropDownList></p>
            </td>
        </tr>
        <tr>
            <td >
                <table cellpadding="0" cellspacing="10" class="style1"  width="100%" 
                    bgcolor="White"  >
                    <tr>
                        <td class="style6">
                            Mã số CBVC</td>
                        <td style="width:20%">
                            <asp:TextBox ID="txtmanhanvien" runat="server" Width="166px" CssClass="Textbox"></asp:TextBox>
                        </td>
                        <td class="style6">
                            Họ và tên
                        </td>
                        <td  style ="width:20%">
                            <input id="txthovaten" style="width: 168px; height: 20px" type="text" maxlength="100"
                                name="textTieude0" runat="server" language="javascript" 
                                onkeypress="return textTieude_onkeypress()" class="Textbox"></td>
                        <td class="style6">
                            Giới tính
                        </td>
                        <td style="width:20%">
                            <asp:DropDownList ID="dlgioitinh" runat="server" Width="169" 
                                CssClass="Dropdownlist">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left">
                            <span class="style7">Ngày sinh</span>
                        </td>
                        <td style="width: 217px">
                            <asp:TextBox ID="txtngaysinh" runat="server" Width="166px" CssClass="Textbox"></asp:TextBox>
                             <asp:CalendarExtender ID="txtdengay_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="txtngaysinh" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                        </td>
                        <td style="text-align: left">
                            <span class="style7">Nơi sinh</span>
                        </td>
                        <td>
                            <input id="txtnoisinh" runat="server" style="width: 168px; height: 20px" type="text"
                                maxlength="100">
                        </td>
                        <td style="text-align: left">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style8">
                            Số chứng minh
                        </td>
                        <td style="width: 217px">
                            <input id="txtsochungminh" style="width: 168px; height: 20px" type="text" maxlength="100"
                                name="textTieude3" runat="server" language="javascript" onkeypress="return textTieude_onkeypress()"></td>
                        <td class="style8">
                            Ngày cấp</td>
                        <td>
                            <asp:TextBox ID="txtngaycapcm" runat="server" Width="166px"></asp:TextBox>
                             <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                    Enabled="True" TargetControlID="txtngaycapcm" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                        </td>
                        <td class="style8">
                            Nơi cấp
                        </td>
                        <td>
                            <input id="txtnoicapcm" style="width: 168px; height: 20px" type="text" maxlength="100"
                                name="textTieude5" runat="server" language="javascript" onkeypress="return textTieude_onkeypress()"></td>
                    </tr>
                    <tr>
                        <td style="text-align: left">
                            <span class="style7">Số Passport</span>
                        </td>
                        <td style="width: 217px">
                            <input id="txtpassport" style="width: 168px; height: 20px" type="text" maxlength="100"
                                name="textTieude10" runat="server" language="javascript" onkeypress="return textTieude_onkeypress()"></td>
                        <td class="style8">
                            Ngày cấp</td>
                        <td>
                            <asp:TextBox ID="txtngaycappp" runat="server" Width="166px"></asp:TextBox>
                             <asp:CalendarExtender ID="CalendarExtender2" runat="server" 
                    Enabled="True" TargetControlID="txtngaycappp" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                        </td>
                        <td style="text-align: left">
                            <span class="style7">Nơi cấp</span>
                        </td>
                        <td>
                            <input id="txtnoicappp" style="width: 168px; height: 20px" type="text" maxlength="100"
                                name="textTieude7" runat="server" language="javascript" onkeypress="return textTieude_onkeypress()"/></td>
                    </tr>
                    <tr>
                        <td style="text-align: left" class="style4" 
                            colspan="6">
                            Nguyên Quán :</td>
                    </tr>
                    <tr>
                        <td class="style8">
                            Xã (phường )</td>
                        <td style="width: 217px">
                            <asp:TextBox ID="txtxanq" runat="server" Width="166px"></asp:TextBox>
                        </td>
                        <td class="style8">
                            Huyện(quận)</td>
                        <td>
                            <input id="txthuyennq" runat="server" style="width: 168px; height: 20px" type="text"
                                maxlength="100"></td>
                        <td class="style8">
                            Tỉnh</td>
                        <td>
                            <asp:DropDownList ID="ddlTinhNQ" runat="server" Width="168px" 
                                CssClass="Dropdownlist">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left" colspan="6" 
                            class="style4">
                            Nơi ở hiện nay :</td>
                    </tr>
                    <tr>
                        <td class="style8">
                            Số nhà :</td>
                        <td style="width: 217px">
                            <asp:TextBox ID="txtsonha" runat="server" Width="168px"></asp:TextBox>
                        </td>
                        <td class="style8">
                            Đường /Tổ</td>
                        <td>
                            <asp:TextBox ID="txtduong" runat="server" Width="168px"></asp:TextBox>
                        </td>
                        <td class="style8">
                            Xã/Phường</td>
                        <td>
                            <asp:TextBox ID="txtXaPhuong" runat="server" Width="168px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            Quận/Huyện:</td>
                        <td style="width: 217px">
                            <asp:TextBox ID="txthuyen" runat="server" Width="168px"></asp:TextBox>
                        </td>
                        <td class="style8">
                            Tỉnh/TP</td>
                        <td>
                            <asp:DropDownList ID="ddlTinhTP" runat="server" Width="168px" 
                                CssClass="Dropdownlist">
                            </asp:DropDownList>
                        </td>
                        <td class="style8">
                            QG</td>
                        <td>
                            <asp:DropDownList ID="dlquoctich" runat="server" Width="169" 
                                CssClass="Dropdownlist">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            Điện thoại
                        </td>
                        <td style="width: 217px">
                            <input id="txtdienthoai" style="width: 168px; height: 20px" type="text" maxlength="100"
                                name="textTieude9" runat="server" language="javascript" onkeypress="return textTieude_onkeypress()"></td>
                        <td class="style8">
                            Email</td>
                        <td>
                            <input id="txtemail" style="width: 168px; height: 20px" type="text" maxlength="100"
                                name="textTieude6" runat="server" language="javascript" onkeypress="return textTieude_onkeypress()"></td>
                        <td style="text-align: left">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="border: 0px solid #CCCCCC; text-align: left" colspan="6" 
                            class="style4">
                            Học vấn và nghề nghiệp&nbsp; :</td>
                    </tr>
                    <tr>
                        <td class="style8">
                            Học hàm
                            <asp:CheckBox ID="idcheck" runat="server" AutoPostBack="True" 
                                oncheckedchanged="idcheck_CheckedChanged" />
                        </td>
                        <td style="width: 217px">
                            <asp:DropDownList ID="dlhocham" runat="server" Width="169" 
                                CssClass="Dropdownlist">
                            </asp:DropDownList>
                        </td>
                        <td class="style8">
                            Trình độ
                        </td>
                        <td>
                            <asp:DropDownList ID="dlhocvi" runat="server" Width="169" 
                                CssClass="Dropdownlist">
                            </asp:DropDownList>
                        </td>
                        <td class="style8">
                            Chức danh</td>
                        <td>
                            <asp:DropDownList ID="dlchucdanh" runat="server" Width="169" 
                                CssClass="Dropdownlist">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left; height: 22px;">
                            <span class="style7">Tôn giáo</span>
                        </td>
                        <td style="height: 22px; width: 217px;">
                            <asp:DropDownList ID="dltongiao" runat="server" Width="169" 
                                CssClass="Dropdownlist">
                            </asp:DropDownList>
                        </td>
                        <td class="style9">
                            Chính trị</td>
                        <td style="height: 22px">
                            <asp:DropDownList ID="ddlchinhtri" runat="server" Width="169px" 
                                CssClass="Dropdownlist">
                            </asp:DropDownList>
                        </td>
                        <td style="text-align: left; height: 22px;">
                            <span class="style7">TT hôn nhân</span>
                        </td>
                        <td style="height: 22px">
                            <asp:DropDownList ID="dlkethon" runat="server" Width="169" 
                                CssClass="Dropdownlist">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style10">
                            Ngoại ngữ</td>
                        <td style="height: 42px; width: 217px;">
                            <asp:TextBox ID="txtngoaingu" runat="server" Width="162px"></asp:TextBox>
                        </td>
                        <td style="text-align: left; height: 42px;">
                            &nbsp;</td>
                        <td style="height: 42px">
                            &nbsp;</td>
                        <td style="text-align: left; height: 42px;">
                            &nbsp;</td>
                        <td style="height: 42px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style11" style="text-align: left">
                            Hình đại diện
                        </td>
                        <td colspan="5">
                            &nbsp;
                            &nbsp;
                            &nbsp;
                            &nbsp;
                            &nbsp;
                            <asp:FileUpload ID="FileUpload1" runat="server" Width="350px" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="right" style="text-align: center">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    Width="100%" AllowPaging="True" AllowSorting="True" PageSize="30"
                    onpageindexchanging="GridView1_PageIndexChanging" CssClass="Gridview">
                    <Columns>
                        <asp:TemplateField HeaderText="Stt">
                            <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:BoundField DataField="MANHANVIEN" HeaderText="Mã NV" />
                        <asp:TemplateField HeaderText="Họ Và Tên">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                    NavigateUrl='<%# Eval("ID","~/Admin/nhansu/chitietnv.aspx?IDNV={0}") %>' 
                                    Text='<%# Eval("HOVATEN") %>' Target="_blank"></asp:HyperLink>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HOVATEN") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DATESINH" HeaderText="Ngày Sinh" />
                        <asp:BoundField DataField="NOISINH" HeaderText="Nơi Sinh" />
                        <asp:BoundField DataField="DIENTHOAI" HeaderText="Số Điện Thoại" />
                        <asp:TemplateField HeaderText="Xem">
                            <ItemTemplate>
                                <asp:LinkButton ID="lblEdit" runat="server" onclick="lblEdit_Click" >Xem</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="cbitem" runat="server" />
                            </ItemTemplate>
                            <HeaderTemplate>
                                <asp:CheckBox ID="cbheader" runat="server" AutoPostBack="True" oncheckedchanged="cbheader_CheckedChanged" />
                            </HeaderTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#21abfa" Font-Bold="True" ForeColor="#21abfa" />
                    <PagerStyle CssClass="headergrid" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#ffffff" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#21abfa" CssClass="headergrid" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#fffffff" />
                </asp:GridView>
                <br />
                <asp:Button ID="btnThemMoi" runat="server" onclick="btnThemMoi_Click" 
                    Text="Thêm Mới" CssClass="btn" />
                <asp:Button ID="btnLuuSua" runat="server" onclick="btnLuuSua_Click" 
                    Text="Cập Nhật" CssClass="btn" />
                <asp:Button ID="idxoa" runat="server" onclick="idxoa_Click" style="width: 35px" 
                    Text="Xóa" CssClass="btn" Width="100px" />
                <asp:ConfirmButtonExtender ID="idxoa_ConfirmButtonExtender" runat="server" 
                    ConfirmText="Bạn có muốn xóa không ?" Enabled="True" TargetControlID="idxoa">
                </asp:ConfirmButtonExtender>
                <br />
                <asp:Label ID="Label5" runat="server" style="color: #FF0000"></asp:Label>
                <br />
                <br />
            </td>
        </tr>
    </table>
<script language="javascript" type="text/javascript">
// <!CDATA[

function txtmanhanvien_onclick() {

}

// ]]>
</script>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

   
    <style type="text/css">
        .style2
        {
            font-size: x-small;
        }
        .style3
        {
            font-size: medium;
        }
        .style4
        {
            color: #800000;
        }
        .style6
        {
            text-align: left;
            width: 10%;
            font-weight: normal;
        }
        .style7
        {
            font-weight: normal;
        }
        .style8
        {
            text-align: left;
            font-weight: normal;
        }
        .style9
        {
            text-align: left;
            height: 22px;
            font-weight: normal;
        }
        .style10
        {
            text-align: left;
            height: 42px;
            font-weight: normal;
        }
        .style11
        {
            font-size: x-small;
            font-weight: normal;
        }
    </style>


</asp:Content>

