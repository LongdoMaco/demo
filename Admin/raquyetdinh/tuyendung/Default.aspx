<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_raquyetdinh_tuyendung_Default" %>

<%@ Register assembly="DundasWebOlapDataProviderAdomdNet" namespace="Dundas.Olap.Data.AdomdNet" tagprefix="DODPN" %>
<%@ Register assembly="DundasWebUIControls" namespace="Dundas.Olap.WebUIControls" tagprefix="DOCWC" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <DODPN:AdomdNetDataProvider ID="AdomdNetDataProvider1" runat="server" 
            ConnectionString="Data Source=localhost; Catalog=Ra_quyetdinh_Tuyendung;">
        </DODPN:AdomdNetDataProvider>
    
    </div>
    <DOCWC:OlapClient ID="OlapClient1" runat="server" 
        DataProviderID="AdomdNetDataProvider1" height="540px" width="900px"><ToolbarSettings><Maximize Description="Switch to simple view"></Maximize>
</ToolbarSettings><ToolbarStyle BackColor="White" BorderColor="" BorderWidth="" PageColor="" ToolbarStyle="Flat1"></ToolbarStyle></DOCWC:OlapClient>
    </form>
</body>
</html>
