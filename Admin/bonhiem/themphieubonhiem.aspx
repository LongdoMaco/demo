<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="themphieubonhiem.aspx.cs" Inherits="Admin_bonhiem_themphieubonhiem" Title="Thêm Phiếu Bổ Nhiệm" %>

<%@ Register src="usercontrol/menu.ascx" tagname="menu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style2">
        <tr>
            <td colspan="2">
                <uc1:menu ID="menu1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                Tên phiếu bổ nhiêm</td>
            <td>
                <asp:TextBox ID="txtthem" runat="server" Width="331px"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" Text="Thêm" onclick="Button1_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="ID" DataSourceID="SqlDataSource1" Width="100%" 
                    AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#3366CC" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="4">
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <Columns>
                        <asp:BoundField DataField="TENBONHIEM" HeaderText="Tên Bổ Nhiệm" 
                            SortExpression="TENBONHIEM" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
                    DeleteCommand="DELETE FROM [TBLPHIEUBONHIEM] WHERE [ID] = @ID" 
                    InsertCommand="INSERT INTO [TBLPHIEUBONHIEM] ([TENBONHIEM]) VALUES (@TENBONHIEM)" 
                    SelectCommand="SELECT * FROM [TBLPHIEUBONHIEM] ORDER BY [ID] DESC" 
                    
                    UpdateCommand="UPDATE [TBLPHIEUBONHIEM] SET [TENBONHIEM] = @TENBONHIEM WHERE [ID] = @ID">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="TENBONHIEM" Type="String" />
                        <asp:Parameter Name="ID" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="TENBONHIEM" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblthongbao" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

