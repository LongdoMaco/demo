<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="kyluattapthe.aspx.cs" Inherits="Admin_khenthuong_kiluattapthe" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../nhansu/UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
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
            <td>
                Đơn vị bị kỉ luật:</td>
            <td>
                <asp:DropDownList ID="ddlDonVi" runat="server" Width="250px" CssClass="Dropdownlist" 
                                                  >
                                                </asp:DropDownList>
                                            </td>
            <td>
                Kỉ luật bởi :</td>
            <td>
                <asp:TextBox ID="txtkiluat" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Năm học :</td>
            <td>
                                                <asp:DropDownList ID="ddlnamhockl" 
                    runat="server" Width="160px" AutoPostBack="True" 
                                                    
                  S onselectedindexchanged="ddlnamhockl_SelectedIndexChanged" CssClass="Dropdownlist" > </asp:DropDownList>	
            </td>
            <td>
                Hình thức:</td>
            <td>
                                                                        <asp:DropDownList ID="ddlhinhthuckl" runat="server" Width="200px" Height="25px" 
                                                                            CssClass="Dropdownlist">
                                                                        </asp:DropDownList >
                                                                    </td>
        </tr>
        <tr>
            <td>
                Lí do</td>
            <td colspan="3">
                <asp:TextBox ID="txtlido" runat="server" Height="61px" TextMode="MultiLine" 
                    Width="500px" CssClass="btn"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnThem" runat="server" onclick="btnThem_Click" Text="Thêm" 
                    Width="75px" CssClass="btn" />
                <asp:Button ID="btnCapNhat" runat="server" onclick="btnCapNhat_Click" 
                    Text="Cập Nhật" CssClass="btn" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    Width="100%" CssClass="Gridview">
                    <Columns>
                        <asp:BoundField DataField="DONVI" HeaderText="Tên đơn vị bị kỉ luật" />
                        <asp:BoundField DataField="DONVIKILUAT" HeaderText="Cơ quan kỉ luật" />
                        <asp:BoundField DataField="LIDO" HeaderText="Lí Do" />
                      
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                               
                            
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lblxem" runat="server" onclick="lblxem_Click">xem</asp:LinkButton>
                               
                            
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lblxoa" runat="server" onclick="lblXóa_Click">Xóa</asp:LinkButton>
                                <asp:ConfirmButtonExtender ID="lblXóa_ConfirmButtonExtender" runat="server" 
                                    ConfirmText="Bạn có muốn xóa nó không" Enabled="True" TargetControlID="lblxoa">
                                </asp:ConfirmButtonExtender>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                     <FooterStyle BackColor="#21abfa" Font-Bold="True" ForeColor="#21abfa" />
                    <PagerStyle CssClass="headergrid" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#ffffff" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#21abfa" CssClass="headergrid" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#fffffff" />
                    <EmptyDataTemplate>
                        <span class="style3">Chưa có kỉ luật nào cả</span>
                    </EmptyDataTemplate>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="lblthongbao" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

