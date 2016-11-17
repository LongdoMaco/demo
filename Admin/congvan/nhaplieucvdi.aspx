<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="nhaplieucvdi.aspx.cs" Inherits="Admin_congvan_nhaplieucvdi" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="usercontrol/Menu.ascx" tagname="Menu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

.pnl{
font-weight: bold;
background-color: #eeeeee;
padding: 5px;
cursor: pointer;
border: solid 1px #c0c0c0
}

  

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="menu">   

        <uc1:Menu ID="Menu1" runat="server" />

</div>
<div>
<p>Nhập thông tin cơ bản cho công văn đi</p>
<br/>
 <asp:Panel ID="Panel1" runat="server" CssClass="pnl">
<div style="float:left;">
    Loại công văn đi
</div>
<div style="float:right;">
<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel2" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Maloai" DataSourceID="SqlDataSource1" Width="40%">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Maloai" HeaderText="Maloai" InsertVisible="False" 
                ReadOnly="True" SortExpression="Maloai" />
            <asp:BoundField DataField="Tenloai" HeaderText="Tenloai" 
                SortExpression="Tenloai" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
        DeleteCommand="DELETE FROM [LoaiCongvandi] WHERE [Maloai] = @Maloai" 
        InsertCommand="INSERT INTO [LoaiCongvandi] ([Tenloai]) VALUES (@Tenloai)" 
        SelectCommand="SELECT * FROM [LoaiCongvandi]" 
        
        UpdateCommand="UPDATE [LoaiCongvandi] SET [Tenloai] = @Tenloai WHERE [Maloai] = @Maloai">
        <DeleteParameters>
            <asp:Parameter Name="Maloai" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Tenloai" Type="String" />
            <asp:Parameter Name="Maloai" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Tenloai" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView6" runat="server" DataKeyNames="Maloai" 
        DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            Maloai:
            <asp:Label ID="MaloaiLabel1" runat="server" Text='<%# Eval("Maloai") %>' />
            <br />
            Tenloai:
            <asp:TextBox ID="TenloaiTextBox" runat="server" 
                Text='<%# Bind("Tenloai") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Tenloai:
            <asp:TextBox ID="TenloaiTextBox" runat="server" 
                Text='<%# Bind("Tenloai") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Thêm" />
        </ItemTemplate>
    </asp:FormView>
    <br />
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
    Bộ phận soạn thảo
</div>
<div style="float:right;">
<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel4" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <br />
    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="MaBophan" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="MaBophan" HeaderText="MaBophan" InsertVisible="False" 
                ReadOnly="True" SortExpression="MaBophan" />
            <asp:BoundField DataField="TenBophan" HeaderText="TenBophan" 
                SortExpression="TenBophan" />
        </Columns>
    </asp:GridView>
    <asp:FormView ID="FormView7" runat="server" DataKeyNames="MaBophan" 
        DataSourceID="SqlDataSource2">
        <EditItemTemplate>
            MaBophan:
            <asp:Label ID="MaBophanLabel1" runat="server" Text='<%# Eval("MaBophan") %>' />
            <br />
            TenBophan:
            <asp:TextBox ID="TenBophanTextBox" runat="server" 
                Text='<%# Bind("TenBophan") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            TenBophan:
            <asp:TextBox ID="TenBophanTextBox" runat="server" 
                Text='<%# Bind("TenBophan") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Thêm" />
        </ItemTemplate>
    </asp:FormView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
        DeleteCommand="DELETE FROM [BophanSoanthao] WHERE [MaBophan] = @MaBophan" 
        InsertCommand="INSERT INTO [BophanSoanthao] ([TenBophan]) VALUES (@TenBophan)" 
        SelectCommand="SELECT * FROM [BophanSoanthao]" 
        
        UpdateCommand="UPDATE [BophanSoanthao] SET [TenBophan] = @TenBophan WHERE [MaBophan] = @MaBophan">
        <DeleteParameters>
            <asp:Parameter Name="MaBophan" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenBophan" Type="String" />
            <asp:Parameter Name="MaBophan" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="TenBophan" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>

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
    Mã công văn</div>
<div style="float:right;">
<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel6" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ID" DataSourceID="SqlDataSource3">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="MaCongvandi" HeaderText="MaCongvandi" 
                SortExpression="MaCongvandi" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
        DeleteCommand="DELETE FROM [MaCongvandi] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [MaCongvandi] ([MaCongvandi]) VALUES (@MaCongvandi)" 
        SelectCommand="SELECT * FROM [MaCongvandi]" 
        
        UpdateCommand="UPDATE [MaCongvandi] SET [MaCongvandi] = @MaCongvandi WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="MaCongvandi" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="MaCongvandi" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView8" runat="server" DataKeyNames="ID" 
        DataSourceID="SqlDataSource3">
        <EditItemTemplate>
            ID:
            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            MaCongvandi:
            <asp:TextBox ID="MaCongvandiTextBox" runat="server" 
                Text='<%# Bind("MaCongvandi") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            MaCongvandi:
            <asp:TextBox ID="MaCongvandiTextBox" runat="server" 
                Text='<%# Bind("MaCongvandi") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Thêm" />
        </ItemTemplate>
    </asp:FormView>
    <br />

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

</div>
</asp:Content>

