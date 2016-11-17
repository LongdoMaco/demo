<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="nhaplieu.aspx.cs" Inherits="Admin_nhansu_nhaplieu" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

.pnl{
font-weight: bold;
background-color: #eeeeee;
padding: 5px;
cursor: pointer;
border: solid 1px #c0c0c0
}

  

        .style2
        {
            color: #006600;
        }

  

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="menu">   

    <uc1:WebUserControl ID="WebUserControl1" runat="server" />
    
</div>
<div>
<p>...</p>
<br/>
 <asp:Panel ID="Panel1" runat="server" CssClass="pnl">
<div style="float:left;">
    Đơn vị
</div>
<div style="float:right;">
<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel2" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <asp:GridView ID="GridView1" runat="server" 
    AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" 
        Width="668px">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
            ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="DONVI" HeaderText="DONVI" SortExpression="DONVI" />
            <asp:BoundField DataField="MADONVI" HeaderText="MADONVI" 
            SortExpression="MADONVI" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
    SelectCommand="SELECT * FROM [DONVI]" 
        DeleteCommand="DELETE FROM [DONVI] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [DONVI] ([DONVI], [MADONVI]) VALUES (@DONVI, @MADONVI)" 
        UpdateCommand="UPDATE [DONVI] SET [DONVI] = @DONVI, [MADONVI] = @MADONVI WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="DONVI" Type="String" />
            <asp:Parameter Name="MADONVI" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="DONVI" Type="String" />
            <asp:Parameter Name="MADONVI" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" 
        DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            ID:
            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            Đơn vị:
            <asp:TextBox ID="DONVITextBox" runat="server" Text='<%# Bind("DONVI") %>' />
            <br />
            Mã đơn vị:
            <asp:TextBox ID="MADONVITextBox" runat="server" Text='<%# Bind("MADONVI") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Đơn vị:
            <asp:TextBox ID="DONVITextBox" runat="server" Text='<%# Bind("DONVI") %>' />
            <br />
            Mã đơn vị:
            <asp:TextBox ID="MADONVITextBox" runat="server" Text='<%# Bind("MADONVI") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Thêm mới" />
        </ItemTemplate>
    </asp:FormView>
    <br />

</asp:Panel>
<asp:collapsiblepanelextender
    ID="CollapsiblePanelExtender2"
    runat="server"
    CollapseControlID="Panel1"
    Collapsed="true"
    ExpandControlID="Panel1"
    TextLabelID="Label1"
    CollapsedText="Hiện"
    ExpandedText="Ẩn"
    ExpandDirection="Vertical"
    TargetControlID="Panel2"
    ScrollContents="false"
   
    >
</asp:collapsiblepanelextender>
 <asp:Panel ID="Panel3" runat="server" CssClass="pnl">
<div style="float:left;">
    Thêm trình độ
</div>
<div style="float:right;">
<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel4" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <asp:GridView ID="GridView2" runat="server" 
    AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource2" 
        Width="481px">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
            ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="HOCVI" HeaderText="HOCVI" SortExpression="HOCVI" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
    DeleteCommand="DELETE FROM [HOCVI] WHERE [ID] = @ID" 
    InsertCommand="INSERT INTO [HOCVI] ([HOCVI]) VALUES (@HOCVI)" 
    SelectCommand="SELECT * FROM [HOCVI]" 
    UpdateCommand="UPDATE [HOCVI] SET [HOCVI] = @HOCVI WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="HOCVI" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="HOCVI" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
    <asp:FormView ID="FormView2" runat="server" DataKeyNames="ID" 
        DataSourceID="SqlDataSource2">
        <EditItemTemplate>
            ID:
            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            Học vị:
            <asp:TextBox ID="HOCVITextBox" runat="server" Text='<%# Bind("HOCVI") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Học vị:
            <asp:TextBox ID="HOCVITextBox" runat="server" Text='<%# Bind("HOCVI") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Thêm mới" />
        </ItemTemplate>
    </asp:FormView>

</asp:Panel>
<asp:collapsiblepanelextender
    ID="CollapsiblePanelExtender1"
    runat="server"
    CollapseControlID="Panel3"
    Collapsed="true"
    ExpandControlID="Panel3"
    TextLabelID="Label2"
    CollapsedText="Hiện"
    ExpandedText="Ẩn"
    ExpandDirection="Vertical"
    TargetControlID="Panel4"
    ScrollContents="false"
   
    >
</asp:collapsiblepanelextender>
 <asp:Panel ID="Panel5" runat="server" CssClass="pnl">
<div style="float:left;">
    Thêm quốc gia
</div>
<div style="float:right;">
<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel6" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <br />
    <asp:GridView ID="GridView4" runat="server" DataSourceID="SqlDataSource3">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
    ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
    DeleteCommand="DELETE FROM [QUOCGIA] WHERE [ID] = @ID" 
    InsertCommand="INSERT INTO [QUOCGIA] ([TENQUOCGIA]) VALUES (@TENQUOCGIA)" 
    SelectCommand="SELECT * FROM [QUOCGIA]" 
    
        UpdateCommand="UPDATE [QUOCGIA] SET [TENQUOCGIA] = @TENQUOCGIA WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="TENQUOCGIA" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="TENQUOCGIA" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
    <asp:FormView ID="FormView7" runat="server" DataKeyNames="ID" 
        DataSourceID="SqlDataSource3">
        <EditItemTemplate>
            ID:
            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            Tên quôc gia:
            <asp:TextBox ID="TENQUOCGIATextBox" runat="server" 
                Text='<%# Bind("TENQUOCGIA") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Tên quốc gia:
            <asp:TextBox ID="TENQUOCGIATextBox" runat="server" 
                Text='<%# Bind("TENQUOCGIA") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Thêm mới" />
        </ItemTemplate>
    </asp:FormView>

</asp:Panel>
<asp:collapsiblepanelextender
    ID="CollapsiblePanelExtender3"
    runat="server"
    CollapseControlID="Panel5"
    Collapsed="true"
    ExpandControlID="Panel5"
    TextLabelID="Label3"
    CollapsedText="Hiện"
    ExpandedText="Ẩn"
    ExpandDirection="Vertical"
    TargetControlID="Panel6"
    ScrollContents="false"
   
    >
</asp:collapsiblepanelextender>
 <asp:Panel ID="Panel7" runat="server" CssClass="pnl">
<div style="float:left;">
    Danh sách tỉnh thành</div>
<div style="float:right;">
<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel8" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <br />
    <asp:GridView ID="GridView5" runat="server" DataSourceID="SqlDataSource4">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
        DeleteCommand="DELETE FROM [TINHTHANHPHO] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [TINHTHANHPHO] ([TINHTHANHPHO]) VALUES (@TINHTHANHPHO)" 
        SelectCommand="SELECT * FROM [TINHTHANHPHO]" 
        UpdateCommand="UPDATE [TINHTHANHPHO] SET [TINHTHANHPHO] = @TINHTHANHPHO WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="TINHTHANHPHO" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="TINHTHANHPHO" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
    <asp:FormView ID="FormView4" runat="server" DataKeyNames="ID" 
        DataSourceID="SqlDataSource4">
        <EditItemTemplate>
            ID:
            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            Tĩnh /Thành Phố:
            <asp:TextBox ID="TINHTHANHPHOTextBox" runat="server" 
                Text='<%# Bind("TINHTHANHPHO") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Tĩnh /Thành Phố:
            <asp:TextBox ID="TINHTHANHPHOTextBox" runat="server" 
                Text='<%# Bind("TINHTHANHPHO") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Thêm mới" />
        </ItemTemplate>
    </asp:FormView>

</asp:Panel>
<asp:collapsiblepanelextender
    ID="CollapsiblePanelExtender4"
    runat="server"
    CollapseControlID="Panel7"
    Collapsed="true"
    ExpandControlID="Panel7"
    TextLabelID="Label4"
    CollapsedText="Hiện"
    ExpandedText="Ẩn"
    ExpandDirection="Vertical"
    TargetControlID="Panel8"
    ScrollContents="false"
   
    >
</asp:collapsiblepanelextender>
 <asp:Panel ID="Panel9" runat="server" CssClass="pnl">
<div style="float:left;">
    Quan hệ gia đình</div>
<div style="float:right;">
<asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel10" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <br />
    <asp:GridView ID="GridView6" runat="server" DataSourceID="SqlDataSource5">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
    ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
    DeleteCommand="DELETE FROM [QUANHE] WHERE [ID] = @ID" 
    InsertCommand="INSERT INTO [QUANHE] ([QUANHE]) VALUES (@QUANHE)" 
    SelectCommand="SELECT * FROM [QUANHE]" 
    UpdateCommand="UPDATE [QUANHE] SET [QUANHE] = @QUANHE WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="QUANHE" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="QUANHE" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
    <asp:FormView ID="FormView5" runat="server" DataKeyNames="ID" 
        DataSourceID="SqlDataSource5">
        <EditItemTemplate>
            ID:
            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            Quan hệ:
            <asp:TextBox ID="QUANHETextBox" runat="server" Text='<%# Bind("QUANHE") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Quan hệ:
            <asp:TextBox ID="QUANHETextBox" runat="server" Text='<%# Bind("QUANHE") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Thêm mới" />
        </ItemTemplate>
    </asp:FormView>

</asp:Panel>
<asp:collapsiblepanelextender
    ID="CollapsiblePanelExtender5"
    runat="server"
    CollapseControlID="Panel9"
    Collapsed="true"
    ExpandControlID="Panel9"
    TextLabelID="Label5"
    CollapsedText="Hiện"
    ExpandedText="Ẩn"
    ExpandDirection="Vertical"
    TargetControlID="Panel10"
    ScrollContents="false"
   
    >
</asp:collapsiblepanelextender>

<asp:Panel ID="Panel11" runat="server" CssClass="pnl">
<div style="float:left;">
    Mã Viên Chức</div>
<div style="float:right;">
<asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel12" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <asp:GridView ID="GridView7" runat="server" DataSourceID="SqlDataSource6">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
        DeleteCommand="DELETE FROM [MAVIENCHUC] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [MAVIENCHUC] ([MAVIENCHUC]) VALUES (@MAVIENCHUC)" 
        SelectCommand="SELECT * FROM [MAVIENCHUC]" 
        UpdateCommand="UPDATE [MAVIENCHUC] SET [MAVIENCHUC] = @MAVIENCHUC WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="MAVIENCHUC" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="MAVIENCHUC" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView6" runat="server" DataKeyNames="ID" 
        DataSourceID="SqlDataSource6">
        <EditItemTemplate>
            ID:
            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            Mã viên chức:
            <asp:TextBox ID="MAVIENCHUCTextBox" runat="server" 
                Text='<%# Bind("MAVIENCHUC") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Mã viên chức:
            <asp:TextBox ID="MAVIENCHUCTextBox" runat="server" 
                Text='<%# Bind("MAVIENCHUC") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Thêm mới" />
        </ItemTemplate>
    </asp:FormView>
    <br />

</asp:Panel>
<asp:collapsiblepanelextender
    ID="CollapsiblePanelExtender6"
    runat="server"
    CollapseControlID="Panel11"
    Collapsed="true"
    ExpandControlID="Panel11"
    TextLabelID="Label6"
    CollapsedText="Hiện"
    ExpandedText="Ẩn"
    ExpandDirection="Vertical"
    TargetControlID="Panel12"
    ScrollContents="false"
   
    >
</asp:collapsiblepanelextender>
<%--Trình độ chính trị--%>
<asp:Panel ID="Panel13" runat="server" CssClass="pnl">
<div style="float:left;">
    Trình độ chính trị</div>
<div style="float:right;">
<asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel14" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <asp:GridView ID="GridView3" runat="server" DataSourceID="SqlDataSource7" 
        AutoGenerateColumns="False" DataKeyNames="ID">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="CHINHTRI" HeaderText="CHINHTRI" 
                SortExpression="CHINHTRI" />
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
        DeleteCommand="DELETE FROM [CHINHTRI] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [CHINHTRI] ([CHINHTRI]) VALUES (@CHINHTRI)" 
        SelectCommand="SELECT * FROM [CHINHTRI]" 
        
        UpdateCommand="UPDATE [CHINHTRI] SET [CHINHTRI] = @CHINHTRI WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="CHINHTRI" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="CHINHTRI" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView8" runat="server" DataKeyNames="ID" 
        DataSourceID="SqlDataSource7">
        <EditItemTemplate>
            ID:
            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            Trình độ chính trị:
            <asp:TextBox ID="CHINHTRITextBox" runat="server" 
                Text='<%# Bind("CHINHTRI") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Trình độ chính trị:
            <asp:TextBox ID="CHINHTRITextBox" runat="server" 
                Text='<%# Bind("CHINHTRI") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Thêm mới" />
        </ItemTemplate>
    </asp:FormView>
    <br />

</asp:Panel>
<asp:collapsiblepanelextender
    ID="CollapsiblePanelExtender7"
    runat="server"
    CollapseControlID="Panel13"
    Collapsed="true"
    ExpandControlID="Panel13"
    TextLabelID="Label7"
    CollapsedText="Hiện"
    ExpandedText="Ẩn"
    ExpandDirection="Vertical"
    TargetControlID="Panel14"
    ScrollContents="false"
   
    >
</asp:collapsiblepanelextender>
<%--Ket thuc trinh do chinh trị--%>

<%--Bắt đầu loại hợp đồng--%>
<asp:Panel ID="Panel15" runat="server" CssClass="pnl">
<div style="float:left;">
    Thêm loại hợp đồng:</div>
<div style="float:right;">
<asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel16" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <asp:GridView ID="GridView8" runat="server" DataSourceID="SqlDataSource8" 
        AutoGenerateColumns="False" DataKeyNames="ID">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="LOAIHOPDONG" HeaderText="Loại hợp đồng" 
                SortExpression="LOAIHOPDONG" />
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
        DeleteCommand="DELETE FROM [LOAIHOPDONG] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [LOAIHOPDONG] ([LOAIHOPDONG]) VALUES (@LOAIHOPDONG)" 
        SelectCommand="SELECT * FROM [LOAIHOPDONG]" 
        
        
        UpdateCommand="UPDATE [LOAIHOPDONG] SET [LOAIHOPDONG] = @LOAIHOPDONG WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="LOAIHOPDONG" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="LOAIHOPDONG" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView9" runat="server" DataKeyNames="ID" 
        DataSourceID="SqlDataSource8">
        <EditItemTemplate>
            ID:
            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            Loại hợp đồng:
            <asp:TextBox ID="LOAIHOPDONGTextBox" runat="server" 
                Text='<%# Bind("LOAIHOPDONG") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Loại hợp đồng:
            <asp:TextBox ID="LOAIHOPDONGTextBox" runat="server" 
                Text='<%# Bind("LOAIHOPDONG") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<br />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Thêm mới" />
        </ItemTemplate>
    </asp:FormView>
    <br />

</asp:Panel>
<asp:collapsiblepanelextender
    ID="CollapsiblePanelExtender8"
    runat="server"
    CollapseControlID="Panel15"
    Collapsed="true"
    ExpandControlID="Panel15"
    TextLabelID="Label8"
    CollapsedText="Hiện"
    ExpandedText="Ẩn"
    ExpandDirection="Vertical"
    TargetControlID="Panel16"
    ScrollContents="false"
   
    >
</asp:collapsiblepanelextender>
<%--Kết thúc loại hợp đồng--%>
<%--Bắt đầu lí do đi nước ngoài--%>
<asp:Panel ID="Panel17" runat="server" CssClass="pnl">
<div style="float:left;">
    Thêm lí do đi nước ngoài:</div>
<div style="float:right;">
<asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel18" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <asp:GridView ID="GridView9" runat="server" DataSourceID="SqlDataSource9" 
        AutoGenerateColumns="False" DataKeyNames="ID">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="LIDO" HeaderText="LIDO" 
                SortExpression="LIDO" />
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
        DeleteCommand="DELETE FROM [DMLIDODINUOCNGOAI] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [DMLIDODINUOCNGOAI] ([LIDO]) VALUES (@LIDO)" 
        SelectCommand="SELECT * FROM [DMLIDODINUOCNGOAI]" 
        
        
        
        UpdateCommand="UPDATE [DMLIDODINUOCNGOAI] SET [LIDO] = @LIDO WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="LIDO" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="LIDO" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView10" runat="server" DataKeyNames="ID" 
        DataSourceID="SqlDataSource9">
        <EditItemTemplate>
            ID:
            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            Lí do:
            <asp:TextBox ID="LIDOTextBox" runat="server" Text='<%# Bind("LIDO") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Lí do:
            <asp:TextBox ID="LIDOTextBox" runat="server" Text='<%# Bind("LIDO") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            <br />
            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Thêm mới" />
        </ItemTemplate>
    </asp:FormView>
    <br />

</asp:Panel>
<asp:collapsiblepanelextender
    ID="CollapsiblePanelExtender9"
    runat="server"
    CollapseControlID="Panel17"
    Collapsed="true"
    ExpandControlID="Panel17"
    TextLabelID="Label9"
    CollapsedText="Hiện"
    ExpandedText="Ẩn"
    ExpandDirection="Vertical"
    TargetControlID="Panel18"
    ScrollContents="false"
   
    >
</asp:collapsiblepanelextender>
<%--Kết thúc lí do đi nước ngoài--%>
<hr />
<h4 class="style2">Chức vụ đảng</h4>
<%--Bắt đầu chức vụ đảng--%>
<asp:Panel ID="Panel19" runat="server" CssClass="pnl">
<div style="float:left;">
    Thêm&nbsp; chức vụ đảng</div>
<div style="float:right;">
<asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel20" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <asp:GridView ID="GridView10" runat="server" DataSourceID="SqlDataSource10" 
        AutoGenerateColumns="False" DataKeyNames="ID">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" 
                ReadOnly="True" SortExpression="ID" InsertVisible="False" />
            <asp:BoundField DataField="CHUCVU" HeaderText="CHUCVU" 
                SortExpression="CHUCVU" />
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource10" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
        DeleteCommand="DELETE FROM [DMCVDANG] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [DMCVDANG] ([CHUCVU]) VALUES (@CHUCVU)" 
        SelectCommand="SELECT * FROM [DMCVDANG]" 
        
        
        
        UpdateCommand="UPDATE [DMCVDANG] SET [CHUCVU] = @CHUCVU WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="CHUCVU" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="CHUCVU" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView18" runat="server" DataKeyNames="ID" 
        DataSourceID="SqlDataSource10">
        <EditItemTemplate>
            ID:
            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            CHUCVU:
            <asp:TextBox ID="CHUCVUTextBox" runat="server" Text='<%# Bind("CHUCVU") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            CHUCVU:
            <asp:TextBox ID="CHUCVUTextBox" runat="server" Text='<%# Bind("CHUCVU") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Thêm mới" />
        </ItemTemplate>
    </asp:FormView>
    <br />

</asp:Panel>
<asp:collapsiblepanelextender
    ID="CollapsiblePanelExtender10"
    runat="server"
    CollapseControlID="Panel19"
    Collapsed="true"
    ExpandControlID="Panel19"
    TextLabelID="Label10"
    CollapsedText="Hiện"
    ExpandedText="Ẩn"
    ExpandDirection="Vertical"
    TargetControlID="Panel20"
    ScrollContents="false"
   
    >
</asp:collapsiblepanelextender>
<%--Kết thúc chức vụ đảng--%>
<%--Bắt đầu hệ số lương chức vụ đảng--%>
<asp:Panel ID="Panel21" runat="server" CssClass="pnl">
<div style="float:left;">
    Thêm&nbsp; hệ số lương chức vụ đảng</div>
<div style="float:right;">
<asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel22" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <asp:GridView ID="GridView11" runat="server" DataSourceID="SqlDataSource11" 
        AutoGenerateColumns="False" DataKeyNames="ID">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" 
                ReadOnly="True" SortExpression="ID" InsertVisible="False" />
            <asp:BoundField DataField="HS" HeaderText="HS" 
                SortExpression="HS" />
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource11" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
        DeleteCommand="DELETE FROM [DMHSLDANG] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [DMHSLDANG] ([HS]) VALUES (@HS)" 
        SelectCommand="SELECT * FROM [DMHSLDANG]" 
        
        
        
        UpdateCommand="UPDATE [DMHSLDANG] SET [HS] = @HS WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="HS" Type="Double" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="HS" Type="Double" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView12" runat="server" DataKeyNames="ID" 
        DataSourceID="SqlDataSource11">
        <EditItemTemplate>
            ID:
            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            HS:
            <asp:TextBox ID="HSTextBox" runat="server" Text='<%# Bind("HS") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            HS:
            <asp:TextBox ID="HSTextBox" runat="server" Text='<%# Bind("HS") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<br />
            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Thêm mới" />
        </ItemTemplate>
    </asp:FormView>
    <br />

</asp:Panel>
<asp:collapsiblepanelextender
    ID="CollapsiblePanelExtender11"
    runat="server"
    CollapseControlID="Panel21"
    Collapsed="true"
    ExpandControlID="Panel21"
    TextLabelID="Label11"
    CollapsedText="Hiện"
    ExpandedText="Ẩn"
    ExpandDirection="Vertical"
    TargetControlID="Panel22"
    ScrollContents="false"
   
    >
</asp:collapsiblepanelextender>
<%--Bắt đầu hệ số lương chức vụ đảng--%>
<h4 class="style2">Chức vụ Đoàn Thể </h4>
<hr />
<%--Bắt đầu chức vụ đoàn thể--%>
<asp:Panel ID="Panel23" runat="server" CssClass="pnl">
<div style="float:left;">
    Thêm&nbsp; chức vụ đoàn thể:</div>
<div style="float:right;">
<asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel24" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <asp:GridView ID="GridView12" runat="server" DataSourceID="SqlDataSource12" 
        AutoGenerateColumns="False" DataKeyNames="ID">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="CHUCVU" HeaderText="CHUCVU" 
                SortExpression="CHUCVU" />
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource12" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
        DeleteCommand="DELETE FROM [DMCHUCVUDOAN] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [DMCHUCVUDOAN] ([CHUCVU]) VALUES (@CHUCVU)" 
        SelectCommand="SELECT * FROM [DMCHUCVUDOAN]"        
        UpdateCommand="UPDATE [DMCHUCVUDOAN] SET [CHUCVU] = @CHUCVU WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="CHUCVU" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="CHUCVU" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView13" runat="server" DataKeyNames="ID" 
        DataSourceID="SqlDataSource12">
        <EditItemTemplate>
            ID:
            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            CHUCVU:
            <asp:TextBox ID="CHUCVUTextBox" runat="server" Text='<%# Bind("CHUCVU") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Chức vụ đoàn thể:
            <asp:TextBox ID="CHUCVUTextBox" runat="server" Text='<%# Bind("CHUCVU") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Thêm mới" />
        </ItemTemplate>
    </asp:FormView>
    <br />

</asp:Panel>
<asp:collapsiblepanelextender
    ID="CollapsiblePanelExtender12"
    runat="server"
    CollapseControlID="Panel23"
    Collapsed="true"
    ExpandControlID="Panel23"
    TextLabelID="Label12"
    CollapsedText="Hiện"
    ExpandedText="Ẩn"
    ExpandDirection="Vertical"
    TargetControlID="Panel24"
    ScrollContents="false"
   
    >
</asp:collapsiblepanelextender>
<%--kết thúc chức vụ đoàn thể--%>
<%--Bắt đầu hệ số lương đoàn thể--%>
<asp:Panel ID="Panel25" runat="server" CssClass="pnl">
<div style="float:left;">
    Thêm&nbsp; hệ số lương đoàn thể</div>
<div style="float:right;">
<asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel26" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <asp:GridView ID="GridView13" runat="server" DataSourceID="SqlDataSource13" 
        AutoGenerateColumns="False" DataKeyNames="ID">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                SortExpression="ID" />
            <asp:BoundField DataField="HS" HeaderText="HS" SortExpression="HS" />
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource13" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
        DeleteCommand="DELETE FROM [DMHSLDOANTHE] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [DMHSLDOANTHE] ([ID], [HS]) VALUES (@ID, @HS)" 
        SelectCommand="SELECT * FROM [DMHSLDOANTHE]" 
        
        
        
        
        UpdateCommand="UPDATE [DMHSLDOANTHE] SET [HS] = @HS WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="HS" Type="Double" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="HS" Type="Double" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView17" runat="server" DataKeyNames="ID" 
        DataSourceID="SqlDataSource13">
        <EditItemTemplate>
            ID:
            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            HS:
            <asp:TextBox ID="HSTextBox" runat="server" Text='<%# Bind("HS") %>' />
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
            HS:
            <asp:TextBox ID="HSTextBox" runat="server" Text='<%# Bind("HS") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<br />
            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Thêm mới" />
        </ItemTemplate>
    </asp:FormView>
    <br />

</asp:Panel>
<asp:collapsiblepanelextender
    ID="CollapsiblePanelExtender13"
    runat="server"
    CollapseControlID="Panel25"
    Collapsed="true"
    ExpandControlID="Panel25"
    TextLabelID="Label13"
    CollapsedText="Hiện"
    ExpandedText="Ẩn"
    ExpandDirection="Vertical"
    TargetControlID="Panel26"
    ScrollContents="false"
   
    >
</asp:collapsiblepanelextender>
<%--kết thúc hệ số lương đoàn thể--%>

<h4 class="style2">Chức vụ chính quyền</h4>
<hr />
<%--Bắt đầu danh mục chức vụ chính quyền--%>
<asp:Panel ID="Panel27" runat="server" CssClass="pnl">
<div style="float:left;">
    Thêm&nbsp; chức vụ chính&nbsp; quyền:</div>
<div style="float:right;">
<asp:Label ID="Label14" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel28" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <asp:GridView ID="GridView14" runat="server" DataSourceID="SqlDataSource14" 
        AutoGenerateColumns="False" DataKeyNames="ID">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="CHUCVU" HeaderText="CHUCVU" 
                SortExpression="CHUCVU" />
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource14" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
        DeleteCommand="DELETE FROM [DMCHUCVUCQ] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [DMCHUCVUCQ] ([CHUCVU]) VALUES (@CHUCVU)" 
        SelectCommand="SELECT * FROM [DMCHUCVUCQ]" 
        
        
        
        
        
        UpdateCommand="UPDATE [DMCHUCVUCQ] SET [CHUCVU] = @CHUCVU WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="CHUCVU" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="CHUCVU" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView15" runat="server" DataKeyNames="ID" 
        DataSourceID="SqlDataSource14">
        <EditItemTemplate>
            ID:
            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            CHUCVU:
            <asp:TextBox ID="CHUCVUTextBox" runat="server" Text='<%# Bind("CHUCVU") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Chức vụ:
            <asp:TextBox ID="CHUCVUTextBox" runat="server" Text='<%# Bind("CHUCVU") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<br />
            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Thêm mới" />
        </ItemTemplate>
    </asp:FormView>
    <br />

</asp:Panel>
<asp:collapsiblepanelextender
    ID="CollapsiblePanelExtender14"
    runat="server"
    CollapseControlID="Panel27"
    Collapsed="true"
    ExpandControlID="Panel27"
    TextLabelID="Label14"
    CollapsedText="Hiện"
    ExpandedText="Ẩn"
    ExpandDirection="Vertical"
    TargetControlID="Panel28"
    ScrollContents="false"
   
    >
</asp:collapsiblepanelextender>

<%--Kết thúc chức vụ chính quyền--%>
<%--Bắt đầu hệ số lương chính quyền--%>
<asp:Panel ID="Panel29" runat="server" CssClass="pnl">
<div style="float:left;">
    Thêm&nbsp; hệ số lương:</div>
<div style="float:right;">
<asp:Label ID="Label15" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel30" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <asp:GridView ID="GridView15" runat="server" DataSourceID="SqlDataSource15" 
        AutoGenerateColumns="False" DataKeyNames="ID">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="HESOLUONG" HeaderText="HESOLUONG" 
                SortExpression="HESOLUONG" />
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource15" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
        DeleteCommand="DELETE FROM [HESOLUONG] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [HESOLUONG] ([HESOLUONG]) VALUES (@HESOLUONG)" 
        SelectCommand="SELECT * FROM [HESOLUONG]" 
        
        
        
        
        
        
        UpdateCommand="UPDATE [HESOLUONG] SET [HESOLUONG] = @HESOLUONG WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="HESOLUONG" Type="Double" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="HESOLUONG" Type="Double" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView16" runat="server" DataKeyNames="ID" 
        DataSourceID="SqlDataSource15">
        <EditItemTemplate>
            ID:
            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            HESOLUONG:
            <asp:TextBox ID="HESOLUONGTextBox" runat="server" 
                Text='<%# Bind("HESOLUONG") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            HESOLUONG:
            <asp:TextBox ID="HESOLUONGTextBox" runat="server" 
                Text='<%# Bind("HESOLUONG") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Thêm mới" />
        </ItemTemplate>
    </asp:FormView>
    <br />

</asp:Panel>
<asp:collapsiblepanelextender
    ID="CollapsiblePanelExtender15"
    runat="server"
    CollapseControlID="Panel29"
    Collapsed="true"
    ExpandControlID="Panel29"
    TextLabelID="Label15"
    CollapsedText="Hiện"
    ExpandedText="Ẩn"
    ExpandDirection="Vertical"
    TargetControlID="Panel30"
    ScrollContents="false"
   
    >
</asp:collapsiblepanelextender>
<%--kết thúc hệ số lương chính quyền--%>
</div>
</asp:Content>

