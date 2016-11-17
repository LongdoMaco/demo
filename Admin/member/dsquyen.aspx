<%@ Page Language="C#"  MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="dsquyen.aspx.cs" Inherits="Admin_quanlyuser_QuanLyTruyCap" %>

<%@ Register src="Usercontrol/menu.ascx" tagname="menu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    
        <table align="center" class="style1" style="border: 1px Solid #CCCCCC">
            <tr>
                <td align="center" bgcolor="White">
                    <uc1:menu ID="menu1" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <b>DANH SÁCH&nbsp; QUYỀN TRUY CẬP</b></td>
            </tr>
            <tr>
                <td align="center" bgcolor="White" valign="top">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" 
                        Width="100%" GridLines="Horizontal">
                        <RowStyle BackColor="White" ForeColor="#330099" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" 
                                SortExpression="ID" ReadOnly="True" />
                            <asp:BoundField DataField="Tenquyen" HeaderText="Tenquyen" 
                                SortExpression="Tenquyen" />
                        </Columns>
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    </asp:GridView>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" 
                        DataSourceID="SqlDataSource1">
                        <EditItemTemplate>
                            ID:
                            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                            <br />
                            Tenquyen:
                            <asp:TextBox ID="TenquyenTextBox" runat="server" 
                                Text='<%# Bind("Tenquyen") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            ID:
                            <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                            <br />
                            Tenquyen:
                            <asp:TextBox ID="TenquyenTextBox" runat="server" 
                                Text='<%# Bind("Tenquyen") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <br />
                            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                CommandName="New" Text="New" />
                        </ItemTemplate>
                    </asp:FormView>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
                        DeleteCommand="DELETE FROM [Quyentruycap] WHERE [ID] = @ID" 
                        InsertCommand="INSERT INTO [Quyentruycap] ([ID], [Tenquyen]) VALUES (@ID, @Tenquyen)" 
                        SelectCommand="SELECT * FROM [Quyentruycap]" 
                        
                        
                        UpdateCommand="UPDATE [Quyentruycap] SET [Tenquyen] = @Tenquyen WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Tenquyen" Type="String" />
                            <asp:Parameter Name="ID" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                            <asp:Parameter Name="Tenquyen" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <br />
    
    </div>
</asp:Content>