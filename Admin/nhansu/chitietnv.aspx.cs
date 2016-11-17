using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using DAL;

public partial class Admin_thongtinchitiet : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["nguoisudung_ID"] == null)
            Response.Redirect("~/DangNhap.aspx");
        //string url = HttpContext.Current.Request.Url.AbsoluteUri;
        //string[] MangTach = url.Split('/');
        //if (!PhanQuyen.KiemTra(MangTach[MangTach.Length - 2].ToString(), int.Parse(Session["nguoisudung_ID"].ToString())))
        //{
        //    Response.Redirect("~/public/UnauthorizedAccess.aspx");
        //}

        if (!IsPostBack)
        {
            if (Request.QueryString["IDNV"] == null)
                Response.Redirect("~/Admin/nhansu/Default.aspx", true);
            int ID = int.Parse(Request.QueryString["IDNV"]);

            LoadThongTinCoBan(ID);
            LoadTrinhDo(ID);
            GetNamHocHam(ID);
            DoanThe(ID);
            BONHIEMNGACH(ID);
            CHUCVUDAMNHIEM(ID);
            GetAllQuocGia(ID);
            DanhSachQuanHe(ID);
            QuanTrinhCongTac(ID);
            KLCANHAN(ID);
            KTCANHAN(ID);
        }

    }

    private void LoadThongTinCoBan(int ID)
    {
        try
        {
            SqlParameter param = new SqlParameter("@IDNV", ID);
            DataSet  ds = dtsv.ExcuteDataset("ns_get_lilichcanhan", param);

            if (ds.Tables[0].Rows.Count != 0)
            {
                // Tong tin co ban ve ca nhan
                lblHovaTen.Text = ds.Tables[0].Rows[0]["HOVATEN"].ToString();
                lblngaysinh.Text = ds.Tables[0].Rows[0]["NGAYSINH"].ToString();
                lblNoiSinh.Text = ds.Tables[0].Rows[0]["NOISINH"].ToString();
                txtchinhtri.Text = ds.Tables[0].Rows[0]["CHINHTRI"].ToString();
                txtngoaingu.Text = ds.Tables[0].Rows[0]["NGOAINGU"].ToString();
                lbldonvicongtac.Text = ds.Tables[0].Rows[0]["DONVI"].ToString();
                // Load hinh anh
                if (ds.Tables[0].Rows[0]["HINHANH"].ToString() == "")
                    HINHANH.ImageUrl = "~/Admin/nhansu/anhdaidien/no_image.gif";
                else
                    HINHANH.ImageUrl = "~/Admin/nhansu/anhdaidien/" + ds.Tables[0].Rows[0]["HINHANH"].ToString();
              
             
               // Thong tin ve noi o
                lblsnhn.Text = ds.Tables[0].Rows[0]["SONHA"].ToString();
                lblDuongHN.Text = ds.Tables[0].Rows[0]["DUONG"].ToString();
                xahn.Text = ds.Tables[0].Rows[0]["XA"].ToString();
                huyenhn.Text = ds.Tables[0].Rows[0]["HUYEN"].ToString();
                Tinhhn.Text = ds.Tables[0].Rows[0]["TINHTHANHPHO"].ToString(); 
                  
                sdthn.Text = ds.Tables[0].Rows[0]["DIENTHOAI"].ToString();
                lblTonGiao.Text = ds.Tables[0].Rows[0]["TONGIAO"].ToString();
                // Lay Ten Trinh Do
                lbltdhn.Text = ds.Tables[0].Rows[0]["HOCVI"].ToString();
                // kiem tra co Null hay khong  
                
               // lblCN.Text = ds.Tables[0].Rows[0]["CHUYENMON"].ToString();
                // Trinh do ngoai ngu
                txtngoaingu.Text = ds.Tables[0].Rows[0]["NGOAINGU"].ToString();
                // trinh do chinh tri
                txtchinhtri.Text = ds.Tables[0].Rows[0]["CHINHTRI"].ToString();

                // Thong tin ve doan dang
                lblngayvaodoan.Text = ds.Tables[0].Rows[0]["NGAYVAODOAN"].ToString();
                lblngayvaodang.Text = ds.Tables[0].Rows[0]["NGAYVAODANG"].ToString();
                lblngaychuyen.Text = ds.Tables[0].Rows[0]["NGAYCHUYENCT"].ToString();

                // thong tin bao nhiem ngach

                lblngaybatdau.Text = ds.Tables[0].Rows[0]["NGAYBATDAU"].ToString();
                lblngaytuyendung.Text = ds.Tables[0].Rows[0]["NGAYTUYENDUNG"].ToString();
                lblngayBN.Text = ds.Tables[0].Rows[0]["NGAYBONHIEM"].ToString();
                MANGACH.Text = ds.Tables[0].Rows[0]["MAVIENCHUC"].ToString();
                hsluong.Text = ds.Tables[0].Rows[0]["HESOLUONG"].ToString();
                huongtt.Text = ds.Tables[0].Rows[0]["NGAYHUONGLUONG"].ToString();
                cvdanglam.Text = ds.Tables[0].Rows[0]["CONGVIECBONHIEM"].ToString();                   

                


            }
            if (ds.Tables[1].Rows.Count != 0)
            {
                lblCN.Text = ds.Tables[1].Rows[0]["CHUYENMON"].ToString();
            }
        }
        catch
        {
            throw;
        }

    }
    private string getTenTP(int ID)
    {
        return dtsv.ExcuteScalary("ns_get_tentp_ma", dtsv.CreateParameter("@ID", ID)).ToString();
    }
    private string getTenTD(int ID)
    {
        return dtsv.ExcuteScalary("ns_gettentrinhdo_ma", dtsv.CreateParameter("@IDTRINHDO", ID)).ToString();
    }
    private void LoadTrinhDo(int ID)
    {
        int index = 5;
        SqlParameter[] param1 = new SqlParameter[]
        {
            dtsv.CreateParameter("@ID",ID),
            dtsv.CreateParameter("@index",index)
        };
        DataTable dt = dtsv.ExcuteTable("ns_get_trinhdo_nvll", param1);
        if (dt.Rows.Count != 0)
        {
            lbldaihoc.Text = dt.Rows[0]["NAM"].ToString();
            lblcndaihoc.Text = dt.Rows[0]["CHUYENMON"].ToString();
            lblcsdtdaihoc.Text = dt.Rows[0]["COSODAOTAO"].ToString();
            lblndtdh.Text = dt.Rows[0]["TENQUOCGIA"].ToString();


        }
        index = 6;
        SqlParameter[] param2 = new SqlParameter[]
        {
            dtsv.CreateParameter("@ID",ID),
            dtsv.CreateParameter("@index",index)
        };
        dt = dtsv.ExcuteTable("ns_get_trinhdo_nvll", param2);
        if (dt.Rows.Count != 0)
        {
            lblbvthsnam.Text = dt.Rows[0]["NAM"].ToString();
            cnths.Text = dt.Rows[0]["CHUYENMON"].ToString();
            lblcsdtths.Text = dt.Rows[0]["COSODAOTAO"].ToString();
            lblndtths.Text = dt.Rows[0]["TENQUOCGIA"].ToString();


        }
        index = 7;
        SqlParameter[] param3 = new SqlParameter[]
        {
            dtsv.CreateParameter("@ID",ID),
            dtsv.CreateParameter("@index",index)
        };
        dt = dtsv.ExcuteTable("ns_get_trinhdo_nvll", param3);
        if (dt.Rows.Count != 0)
        {
            tsnam.Text = dt.Rows[0]["NAM"].ToString();
            cnts.Text = dt.Rows[0]["CHUYENMON"].ToString();
            csdtts.Text = dt.Rows[0]["COSODAOTAO"].ToString();
            ndtts.Text = dt.Rows[0]["TENQUOCGIA"].ToString();


        }



    }

    private void GetNamHocHam(int ID)
    {
        int check = 1;
        string nam = "";
        SqlParameter[] param1 = new SqlParameter[] 
        {
            dtsv.CreateParameter("@ID",ID),
            dtsv.CreateParameter("@index",check)
        };
        object MYO = dtsv.ExcuteScalary("ns_hocham_laynam", param1);
        if (MYO == null)
            nam = "";
        else nam = MYO.ToString();
        lblpgs.Text = nam;
        check = 2;
        SqlParameter[] param2 = new SqlParameter[] 
        {
            dtsv.CreateParameter("@ID",ID),
            dtsv.CreateParameter("@index",check)
        };
        MYO = dtsv.ExcuteScalary("ns_hocham_laynam", param2);
        if (MYO == null)
            nam = "";
        else nam = MYO.ToString();
        lblgs.Text = nam;
        check = 3;
        SqlParameter[] param3 = new SqlParameter[] 
        {
            dtsv.CreateParameter("@ID",ID),
            dtsv.CreateParameter("@index",check)
        };
        MYO = dtsv.ExcuteScalary("ns_hocham_laynam", param3);
        if (MYO == null)
            nam = "";
        else nam = MYO.ToString();
        lblngut.Text = nam;
        check = 4;
        SqlParameter[] param4 = new SqlParameter[] 
        {
            dtsv.CreateParameter("@ID",ID),
            dtsv.CreateParameter("@index",check)
        };
        MYO = dtsv.ExcuteScalary("ns_hocham_laynam", param4);
        if (MYO == null)
            nam = "";
        else nam = MYO.ToString();
        lblngnd.Text = nam;




    }
    private void DoanThe(int ID)
    {
        SqlParameter param = new SqlParameter("@ID", ID);
        DataTable dt = dtsv.ExcuteTable("get_doanthe_ll", param);
        if (dt.Rows.Count != 0)
        {
            lblngayvaodoan.Text = dt.Rows[0]["NGAYVAODOAN"].ToString();
            lblngayvaodang.Text = dt.Rows[0]["NGAYVAODANG"].ToString();
            lblngaychuyen.Text = dt.Rows[0]["NGAYCHUYENCT"].ToString();


        }
    }
    private void BONHIEMNGACH(int ID)
    {
        try
        {
            SqlParameter param = new SqlParameter("@ID", ID);
            DataTable dt = dtsv.ExcuteTable("ns_ll_get", param);
            if (dt.Rows.Count != 0)
            {
                lblngaybatdau.Text = dt.Rows[0]["NGAYBATDAU"].ToString();
                lblngaytuyendung.Text = dt.Rows[0]["NGAYTUYENDUNG"].ToString();
                lblngayBN.Text = dt.Rows[0]["NGAYBONHIEM"].ToString();
                MANGACH.Text = dt.Rows[0]["MAVIENCHUC"].ToString();
                hsluong.Text = dt.Rows[0]["HESOLUONG"].ToString();
                huongtt.Text = dt.Rows[0]["NGAYHUONGLUONG"].ToString();
                cvdanglam.Text = dt.Rows[0]["CONGVIECBONHIEM"].ToString();




            }
        }
        catch
        {

        }
    }
    
    private void CHUCVUDAMNHIEM(int ID)
    {
        try
        {
            SqlParameter param = new SqlParameter("@ID", ID);
            DataSet ds = dtsv.ExcuteDataset("ll_bncv", param);
            if (ds.Tables[0].Rows.Count != 0)
            {
                lblcvdang.Text = ds.Tables[0].Rows[0]["CHUCVU"].ToString();
                txttunkd.Text = ds.Tables[0].Rows[0]["TUNGAY"].ToString();
                txtdennkd.Text = ds.Tables[0].Rows[0]["DENNGAY"].ToString();


            }
            if (ds.Tables[1].Rows.Count != 0)
            {
                lblcvdoan.Text = ds.Tables[1].Rows[0]["CHUCVU"].ToString();
                txttunkdoan.Text = ds.Tables[1].Rows[0]["TUNGAY"].ToString();
                txtdennkdoan.Text = ds.Tables[1].Rows[0]["DENNGAY"].ToString();


            }
            if (ds.Tables[2].Rows.Count != 0)
            {
                lblchinhquyen.Text = ds.Tables[2].Rows[0]["CHUCVU"].ToString();
                txttucq.Text = ds.Tables[2].Rows[0]["TUNGAY"].ToString();
                txtdennkdcq.Text = ds.Tables[2].Rows[0]["DENNGAY"].ToString();
            }
        }
        catch
        {
 
        }
      
 
    }
    // Danh sach nhung nuoc da den
    private void GetAllQuocGia(int ID)
    {

        try
        {
            SqlParameter param = new SqlParameter("@IDNV", ID);
            GridView1.DataSource = dtsv.ExcuteTable("ns_Get_tt_ThongTinNuocNgoai", param);
            GridView1.DataBind();
        }
        catch
        {
          
        }


    }
    // Danh sach quan he gia dinh voi nhan vien do
    private void DanhSachQuanHe(int ID)
    {
        try
        {

            SqlParameter param = new SqlParameter("@IDNV",ID);
            GridView6.DataSource = dtsv.ExcuteTable("ns_Get_tt_QuanheGiaDinh",param);
            GridView6.DataBind();
        }
        catch
        {

        }

    }
    // Quan trinh cong tac cua nhan vien
    private void QuanTrinhCongTac(int ID)
    {
        try
        {
            SqlParameter param = new SqlParameter("@IDTHONGTIN", ID);
            GridView3.DataSource = dtsv.ExcuteTable("ns_Get_all_qtct", param);
            GridView3.DataBind();
        }
        catch 
        {

        }


    }
    // Ky luat ca nhan cua nhan vien
    private void KLCANHAN(int ID)
    {
        try
        {
              dtsv.LoadGridView(GridView4, "get_kl_ll", dtsv.CreateParameter("@ID", ID));
        }
        catch 
        {
            
          
        }
    }
    // Khen thuong ca nhan
    private void KTCANHAN(int ID)
    {
        try
        {
            dtsv.LoadGridView(GridView5, "get_ktll", dtsv.CreateParameter("@ID", ID));
        }
        catch 
        {
            
           
        }
    }
    //
    protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    // Lay ten quan he
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {if (e.Row.DataItem != null)
            e.Row.Cells[2].Text = dtsv.ExcuteScalary("ns_get_tenquanhe", dtsv.CreateParameter("@IDQuanHe", e.Row.Cells[2].Text)).ToString();

        }
        catch 
        {
            
           
        }

    }
    protected void GridView5_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        this.form1.Style.Remove("Table1");
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=FileName.doc");
        Response.ContentEncoding = System.Text.Encoding.UTF7;
        Response.ContentType = "application/vnd.word";
        System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
        this.form1.RenderControl(oHtmlTextWriter);
        Response.Output.Write(oStringWriter.ToString());
        Response.Flush();
        Response.End();
    }
    public override void VerifyRenderingInServerForm(Control control)
    {

    }
}
