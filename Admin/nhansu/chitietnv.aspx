<%@ Page Language="C#" AutoEventWireup="true" CodeFile="chitietnv.aspx.cs" Inherits="Admin_thongtinchitiet" ValidateRequest="false" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thông tin chi tiết nhân viên</title>
   <%-- <link href="../../App_Themes/Basic/Site.css" rel="stylesheet" type="text/css" />--%>
    <style type="text/css">
        .style3
        {
            width: 100%;
        }
        .style4
        {
            width: 602px;
            text-align:center;
        }
        .style5
        {
            width: 491px;
        }
        .style6
        {
        }
        .style7
        {
            font-size: large;
            font-weight: bold;
        }
        .style12
        {
        	
        }
        .style13
        {
            width: 224px;
            font-weight: bold;
            text-align: left;
        }
        .style14
        {
            text-align: center;
            font-weight: bold;
            font-size: xx-large;
        }
        table td
        {
        border:0px ;
        padding:5px;
        text-align:justify;
        }
         table td
        {
            border:0px;
            padding:6px 5px;
            text-align:left;
        }
        
      
        
        .style15
        {
            font-weight: bold;
        }
        
      
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table bgcolor="White" style=" width: 100%" 
        cellpadding="5px" cellspacing="5" width="800px;" align="center"   >
        <tr>
            <td class="style13" valign="top">
                ĐẠI HỌC ĐÀ NẴNG<br />
                Trường Đại Học Bách Khoa</td>
            <td style="text-align: center">
                <table class="style3">
                    <tr>
                        <td class="style4" valign="top">
                            <span class="style7">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br />
                            </span><b>&nbsp;Độc Lập - Tự Do -Hạnh Phúc</b>&nbsp;&nbsp;
                                </td>
                                <td align="left" rowspan="2">
                <asp:Image ID="HINHANH" runat="server" Height="118px" Width="118px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </td>
        </tr>
        <tr>
            <td colspan="2" class="style14">
                LÍ LỊCH CÁ NHÂN</td>
        </tr>
        <tr style="border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: #CCCCCC">
            <td class="style12" colspan="2">
                <b>I. SƠ LƯỢC VỀ BẢN THÂN:</b></td>
        </tr>
        <tr>
            <td class="style12" colspan="2">
                Họ và tên đang dùng :&nbsp;
                <asp:Label ID="lblHovaTen" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
        </tr>
        <tr>
            <td class="style12" colspan="2">
            Đơn vị công tác :&nbsp;
                <asp:Label ID="lbldonvicongtac" runat="server" style="font-weight: 700"></asp:Label>
                            </td>
        </tr>
        <tr>
            <td class="style6" colspan="2">
                Ngày sinh :&nbsp; <asp:Label ID="lblngaysinh" runat="server" 
                    style="font-weight: 700"></asp:Label>
                                &nbsp;
                Nơi Sinh&nbsp; :<asp:Label ID="lblNoiSinh" runat="server" 
                    style="font-weight: 700"></asp:Label>
                                </td>
        </tr>
        <tr>
            <td class="style15" colspan="2">
                Nơi ở hiện nay</td>
        </tr>
        <tr>
            <td class="style12" colspan="2">
                &nbsp;Số Nhà :&nbsp;&nbsp;<asp:Label ID="lblsnhn" runat="server" 
                    style="font-weight: 700"></asp:Label>
            &nbsp; Đường :&nbsp;&nbsp; <asp:Label ID="lblDuongHN" runat="server" style="font-weight: 700"></asp:Label>
&nbsp; Xã /Phường&nbsp;
                <asp:Label ID="xahn" runat="server" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style12" colspan="2">
                Quận huyện :&nbsp; <asp:Label ID="huyenhn" runat="server" style="font-weight: 700"></asp:Label>
            &nbsp;
                Tình (TP):&nbsp;
                <asp:Label ID="Tinhhn" runat="server" style="font-weight: 700"></asp:Label>
&nbsp;&nbsp;Số ĐT liên hệ :<asp:Label 
                    ID="sdthn" runat="server" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style12" colspan="2">
                Tôn Giáo: <asp:Label ID="lblTonGiao" runat="server" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style12" colspan="2">
                Trình độ chuyên môn hiện nay&nbsp;:&nbsp;<asp:Label ID="lbltdhn" runat="server" style="font-weight: 700"></asp:Label>
                &nbsp;&nbsp;Chuyên Ngành :&nbsp;
                <asp:Label ID="lblCN" runat="server" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style12" colspan="2">
                TN ĐH năm :&nbsp; <asp:Label ID="lbldaihoc" runat="server" 
                    style="font-weight: 700"></asp:Label>
            &nbsp; Chuyên ngành :&nbsp; <asp:Label ID="lblcndaihoc" runat="server" 
                    style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style12" colspan="2">
                Cơ sở ĐT :
                <asp:Label ID="lblcsdtdaihoc" runat="server" style="font-weight: 700"></asp:Label>
            &nbsp;Nước ĐT :
                <asp:Label ID="lblndtdh" runat="server" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style12" colspan="2">
                Bảo vệ Th.s năm:
                <asp:Label ID="lblbvthsnam" runat="server" style="font-weight: 700"></asp:Label>
&nbsp;&nbsp;&nbsp;Chuyên ngành :<asp:Label ID="cnths" runat="server" 
                    style="font-weight: 700"></asp:Label>
                                </td>
        </tr>
        <tr>
            <td class="style12" colspan="2">
                Cơ sở ĐT :<asp:Label ID="lblcsdtths" runat="server" style="font-weight: 700"></asp:Label>
            &nbsp;
                Nước ĐT :<asp:Label ID="lblndtths" runat="server" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style12" colspan="2">
                Bảo vệ tiến sỉ năm : <asp:Label ID="tsnam" runat="server" 
                    style="font-weight: 700"></asp:Label>
                &nbsp; Chuyên ngành&nbsp; :<asp:Label ID="cnts" runat="server" style="font-weight: 700"></asp:Label>
                                </td>
        </tr>
        <tr>
            <td class="style12" colspan="2">
                Cơ sở ĐT :<asp:Label ID="csdtts" runat="server" style="font-weight: 700"></asp:Label>
            &nbsp;&nbsp;
                Nước ĐT<asp:Label ID="ndtts" runat="server" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style12" colspan="2">
                Học hàm: PGS năm : <asp:Label ID="lblpgs" runat="server" 
                    style="font-weight: 700"></asp:Label>
            &nbsp;GS năm : <asp:Label ID="lblgs" runat="server" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style12" colspan="2">
                Nhà giáo ưu tú năm :&nbsp;
                <asp:Label ID="lblngut" runat="server" style="font-weight: 700"></asp:Label>
&nbsp;&nbsp;&nbsp; Nhà giáo ND : <asp:Label ID="lblngnd" runat="server" 
                    style="font-weight: 700"></asp:Label>
                                </td>
        </tr>
        <tr>
            <td class="style12" colspan="2">
                Trình độ ngoại ngữ :<asp:Label ID="txtngoaingu" runat="server" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style12" colspan="2">
                Trình độ lí luân chính trị :<asp:Label ID="txtchinhtri" runat="server" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style12" colspan="2">
                Ngày vào đoàn TNCSHCM :&nbsp;
                <asp:Label ID="lblngayvaodoan" runat="server" style="font-weight: 700"></asp:Label>
            &nbsp;Ngày vào đảng&nbsp; :
                <asp:Label ID="lblngayvaodang" runat="server" style="font-weight: 700"></asp:Label>
            &nbsp;Ngày chuyển&nbsp;chính thức :<asp:Label ID="lblngaychuyen" runat="server" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style12" colspan="2">
                Ngày bắt đầu làm việc tại ĐN&nbsp; :&nbsp;<asp:Label ID="lblngaybatdau" runat="server" style="font-weight: 700"></asp:Label>
                &nbsp;Ngày Tuyển Dụng :<asp:Label 
                    ID="lblngaytuyendung" runat="server" style="font-weight: 700"></asp:Label>
            </td>&nbsp;&nbsp;
                </tr>
        <tr>
            <td class="style12" colspan="2">
                Ngày bổ&nbsp; nhiệm ngạch viên chức :<asp:Label ID="lblngayBN" runat="server" style="font-weight: 700"></asp:Label>
            &nbsp;
                Mã ngạch chức :<asp:Label ID="MANGACH" runat="server" 
                    style="font-weight: 700"></asp:Label>
            &nbsp;Hệ số lương :
                <asp:Label ID="hsluong" runat="server" style="font-weight: 700"></asp:Label>
&nbsp;&nbsp;&nbsp; Hưởng từ:&nbsp;
                <asp:Label ID="huongtt" runat="server" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style12" colspan="2">
                Công việc đang làm :<asp:Label ID="cvdanglam" runat="server" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
           
            <td class="style15" colspan="2">
                Chức vụ đảm nhiệm </td>
        </tr>
        <tr>
           
            <td class="style12" colspan="2">
                Đảng :
                <asp:Label ID="lblcvdang" runat="server" style="font-weight: 700"></asp:Label>
            &nbsp;Nhiệm kỳ&nbsp; từ :
                <asp:Label ID="txttunkd" runat="server" style="font-weight: 700"></asp:Label>
&nbsp; đến
                <asp:Label ID="txtdennkd" runat="server" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
           
            <td class="style12" colspan="2">
                Đoàn thể&nbsp; :<asp:Label ID="lblcvdoan" runat="server" style="font-weight: 700"></asp:Label>
            &nbsp;Nhiệm kỳ&nbsp; từ :<asp:Label ID="txttunkdoan" runat="server" 
                    style="font-weight: 700"></asp:Label>
                &nbsp; đến
                <asp:Label ID="txtdennkdoan" runat="server" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
           
            <td class="style12" colspan="2">
                Chính quyền :<asp:Label ID="lblchinhquyen" runat="server" 
                    style="font-weight: 700"></asp:Label>
            &nbsp;Nhiệm kỳ từ&nbsp;
                <asp:Label ID="txttucq" runat="server" style="font-weight: 700"></asp:Label>
&nbsp;đến
                <asp:Label ID="txtdennkdcq" runat="server" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <b>II.Đã đi nước ngoài (ghi rõ tên nước,thời gian và lí do)</b></td></tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server" Width="100%" 
                    AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="TENQUOCGIA" HeaderText="Tên nước" />
                        <asp:BoundField DataField="TUNGAY" HeaderText="Từ ngày" />
                        <asp:BoundField DataField="DENNGAY" HeaderText="Đến ngày" />
                        <asp:BoundField DataField="LIDO" HeaderText="Lí do" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="2"  valign="top">
                <b>III QUAN HỆ GIA ĐÌNH&nbsp; :</b><br />
                (Ghi rõ họ và tên,tuổi,nghề nghiệp,......)</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" 
                    Width="100%" >
                    <Columns>
                        <asp:BoundField DataField="HOVATEN" HeaderText="Họ Và Tên" />
                        <asp:BoundField DataField="NGAYSINH" HeaderText="Ngày Sinh" />
                        <asp:BoundField DataField="QUANHE" HeaderText="Quan Hệ" />
                        <asp:BoundField DataField="DUONG" HeaderText="Địa Chỉ" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="style12">
                <b>VI QUÁ TRÌNH CÔNG TÁC :</b></td>
            <td class="style5">
                <b></b></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView3" runat="server" onselectedindexchanged="GridView3_SelectedIndexChanged" 
                    Width="100%" AutoGenerateColumns="False">
                    <Columns>
                         <asp:BoundField DataField="BeginDate" HeaderText="Ngày Bắt Đầu" />
                                            <asp:BoundField DataField="EndDate" HeaderText="Ngày Kết Thúc" />
                                            <asp:BoundField DataField="LAMGI" HeaderText="Công Việc" />
                                            <asp:BoundField DataField="ODAU" HeaderText="Ở Đâu" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <b>V KHEN THƯỞNG KỈ LUẬT :</b></td>
        </tr>
        <tr>
            <td colspan="2">
                1.Khen Thưởng :</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False"
                    onselectedindexchanged="GridView5_SelectedIndexChanged" Width="100%">
                    <Columns>
                         <asp:BoundField DataField="HOVATEN" HeaderText="Họ và Tên" />
                                            <asp:BoundField DataField="CHUCDANH" HeaderText="Chức Vụ" />
                                            <asp:BoundField DataField="DUOCTANG" HeaderText="Được Tặng" />
                                            <asp:BoundField DataField="NAMHOC" HeaderText="NĂM HỌC" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                2.Kỷ Luật</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView4" runat="server" Width="100%" 
                    AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="TENDONVI" HeaderText="Tên Đơn Vị Kỷ Luật" />
                        <asp:BoundField DataField="HINHTHUC" HeaderText="Hình Thức" />
                        <asp:BoundField DataField="NAMHOC" HeaderText="Năm Học" />
                    </Columns>
                </asp:GridView>
            </td>
            
            </tr>
            
        </tr>
        <tr>
        <td>
            <asp:Button ID="Button1" runat="server" Text="In" OnClick="Button1_Click" 
                Width="57px" Visible="False" />
        </td>
        </tr>
        </table>
    </div>
    </form>
</body>
</html>
