<%@ Page Title="Công văn đến chưa xem" Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="updatecvdi.aspx.cs" Inherits="Admin_congvan_nhaptin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>

<%@ Register src="usercontrol/Menu.ascx" tagname="Menu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
            font-size: medium;
            font-weight: bold;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style2">
        <tr>
            <td colspan="4"> 
                <uc1:Menu ID="Menu1" runat="server" />
            </td>
        </tr>
        <tr>
            <td  style="width:15%"> 
                Mã CV :</td>
            <td   style="width:35%">
															<asp:dropdownlist id="ddlMaCV" 
                    runat="server" Width="80%" Font-Size="X-Small" Font-Names="Tahoma"
														ForeColor="Blue" BackColor="White" Height="23px"></asp:dropdownlist></td>
            <td   style="width:15%">
                Ngày ký&nbsp; :</td>
            <td   style="width:35%">
                <asp:TextBox ID="txtSoLuu" runat="server" Width="90%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  style="width:15%"> 
                Số/Ký hiệu :</td>
            <td   style="width:35%">
                <asp:TextBox ID="txtSoKyHieu" runat="server" Width="80%"></asp:TextBox>
            </td>
            <td   style="width:15%">
                Nơi nhận :</td>
            <td   style="width:35%">
                <asp:TextBox ID="txtNoiNhan" runat="server" Width="90%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  style="width:15%"> 
                Ngày đi :</td>
            <td   style="width:35%">
                <asp:TextBox ID="txtNgayDen" runat="server" Width="80%"></asp:TextBox>
                <asp:CalendarExtender ID="txtNgayDen_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="txtNgayDen"  Format="dd/MM/yyyy" >
                </asp:CalendarExtender>
            </td>
            <td   style="width:15%">
                Nơi lưu :</td>
            <td   style="width:35%">
                <asp:TextBox ID="txtNoiLuu" runat="server" Width="90%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  style="width:15%"> 
                Ngày ban hành :</td>
            <td   style="width:35%">
                <asp:TextBox ID="txtNBH" runat="server" Width="80%"></asp:TextBox>
                <asp:CalendarExtender ID="txtNBH_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="txtNBH" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
            </td>
            <td   style="width:15%">
                &nbsp;</td>
            <td   style="width:35%">
                &nbsp;</td>
        </tr>
        <tr>
            <td  style="width:15%"> 
                CQ ban hành </td>
            <td   style="width:35%">
                <asp:DropDownList ID="ddlCQBH" runat="server" Width="80%">
                </asp:DropDownList>
            </td>
            <td   style="width:15%">
                Loại công văn :</td>
            <td   style="width:35%">
                <asp:DropDownList ID="ddlLCV" runat="server" Width="90%">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="4"> 
                Trích yếu nội dung công văn</td>
        </tr>
        <tr>
            <td colspan="4"> 
                <asp:TextBox ID="txtTrichYeu" runat="server" Height="75px" TextMode="MultiLine" 
                    Width="100%" MaxLength="100" ToolTip="Chỉ nhập tối đa 100 kí tự"></asp:TextBox>
             
                </td>
        </tr>
        <tr>
            <td  style="width:15%"> 
                Nội dung </td>
            <td colspan="3">
                <asp:FileUpload ID="FileUpload1" runat="server" Width="70%" />
            </td>
        </tr>
        <tr>
            <td colspan="4"> 
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4"> 
                <asp:Button ID="btnCapNhat" runat="server" Text="Cập nhật" Width="118px" 
                    onclick="btnGoiCV_Click" />
                <br />
                <asp:Label ID="lblThongBao" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

