using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using UNI.Class;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using DAL;
using System.Globalization;
using System.Text.RegularExpressions;

public partial class Admin_nhansu_in_tt : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
   
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["nguoisudung_ID"] == null)
            Response.Redirect("~/DangNhap.aspx");
        string url = HttpContext.Current.Request.Url.AbsoluteUri;
        string[] MangTach = url.Split('/');
        if (!PhanQuyen.KiemTra(MangTach[MangTach.Length - 2].ToString(), int.Parse(Session["nguoisudung_ID"].ToString())))
        {
            Response.Redirect("~/public/UnauthorizedAccess.aspx");
        }

        if (!IsPostBack)
        {
            InitData();
           // InnitDataloaidh();
            InnitDatachucvu();
            InnitDatagioitinh();
            InnitDatatongiao();
            InnitDataquoctich();
            InnitDatakethon();
            LoadChucDanh();
            InnitDatahocham();
            InnitDatahocvi();
            LoadGridView();
            ChinhTri();
            LoadTPHN();
            LoadTINHNQ();
           LoadNgayThang();
            dlhocham.Enabled = false;
        }
        //btSua.Visible = false;
        //btThemmoi.Visible = false;
        btnLuuSua.Visible = false;


    }
    #region KhoiTao
    private void InitData()
    {
       
        dtsv.LoadDropDownList(dlChuyende,"ns_getAll_donvi","DONVI","ID");        //dlChuyende.Items.Insert(0, "Chọn đơn vị công tác");
      
    }
    //private void InnitDataloaidh()
    //{
       
    //    dtsv.LoadDropDownList(dlloaihopdong,"ns_getAll_loaihd","LOAIHOPDONG","ID");
    //    //dlloaihopdong.Items.Insert(0, "Chọn loại hợp đồng");
    //}
    private void InnitDatachucvu()
    {
     
        dtsv.FillDropDownListSQL(dlchucdanh,"select * from CHUCDANH","CHUCDANH","ID");
        // dlchucvu.Items.Insert(0, "Chọn chức vụ");
    }
    private void InnitDatahocvi()
    {
      
        dtsv.LoadDropDownList(dlhocvi,"ns_getAll_hocvi","HOCVI","ID");
    }
    private void InnitDatahocham()
    {
     
        dtsv.LoadDropDownList(dlhocham,"ns_getAll_hocham","HOCHAM","ID");
    }
  
    private void ChinhTri()
    {
        dtsv.LoadDropDownList(ddlchinhtri, "ns_get_chinhtri", "CHINHTRI", "ID");
    }
    private void InnitDatagioitinh()
    {
   
        dtsv.LoadDropDownList(dlgioitinh,"ns_getAll_gioitinh","GIOITINH","ID");
    }
    private void InnitDatatongiao()
    {
        
        dtsv.LoadDropDownList(dltongiao,"ns_getAll_tongiao","TONGIAO","ID");
    }
    private void InnitDataquoctich()
    {
       dtsv.LoadDropDownList(dlquoctich,"ns_get_allQuocGia","TENQUOCGIA","ID");
          
    }
    private void InnitDatakethon()
    {
               dtsv.LoadDropDownList(dlkethon,"ns_getAll_kethon","KETHON","ID");
    }
    private void LoadChucDanh()
    {
        dtsv.LoadDropDownList(dlchucdanh, "ns_get_chucdanh", "CHUCDANH", "ID");
    }
    private void LoadTINHNQ()
    {
        dtsv.LoadDropDownList(ddlTinhNQ, "ns_get_pp", "TINHTHANHPHO", "ID");
    }
    protected void dlChuyende_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadGridView();
    }
    private void LoadTPHN()
    {
        dtsv.LoadDropDownList(ddlTinhTP, "ns_get_pp", "TINHTHANHPHO", "ID");
    }
#endregion
    protected void btxemall_Click(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
      

    }
    private void clear()
    {
        txtmanhanvien.Text = "";
        txthovaten.Value = "";
        txtngaysinh.Text = "";
        txtnoisinh.Value = "";
        txtdienthoai.Value = "";
        txtemail.Value = "";
        txtsochungminh.Value = "";
        txtngaycapcm.Text = "";
        txtsochungminh.Value = "";
        txtnoicapcm.Value = "";
        txtpassport.Value = "";
        txtngaycappp.Text = "";
        txtnoicappp.Value = "";
        txtsonha.Text = "";
        txtduong.Text = "";
        txthuyen.Text = "";
        txtXaPhuong.Text = "";
        txtxanq.Text = "";
        txthuyennq.Value = "";
        
     
    }
    private void LoadGridView()
    {
        SqlParameter param=new SqlParameter("@DONVI_ID",dlChuyende.SelectedValue);
        dtsv.LoadGridView(GridView1, "ns_Get_tt_theoDonvi", param);
    }
        /// <summary>
        ///Xem và edit nhân viên
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
    protected void lblEdit_Click(object sender, EventArgs e)
    {
        Label5.Text = "";
        btnLuuSua.Visible = true;
        
        dlChuyende.AutoPostBack = false;


        try
        {
            LinkButton lbt = (LinkButton)sender;
            Label lbl = (Label)lbt.Parent.FindControl("ID");
            int ID = int.Parse(lbl.Text);
            Session["ID_TT"]= ID;
            //GetTen();
            SqlParameter param = new SqlParameter("@ID", ID);
            DataTable dt = dtsv.ExcuteTable("ns_get_tt_id", param);

            if (dt.Rows.Count != 0)
            {
               
              
                dlChuyende.SelectedValue = dt.Rows[0]["IDDONVI"].ToString();
                txtmanhanvien.Text = dt.Rows[0]["MANHANVIEN"].ToString();
                txthovaten.Value = dt.Rows[0]["HOVATEN"].ToString();
              //  dlloaihopdong.SelectedValue=dt.Rows[0]["IDLOAIHOPDONG"].ToString();
                txtngaysinh.Text=dt.Rows[0]["DATESINH"].ToString();
                txtnoisinh.Value=dt.Rows[0]["NOISINH"].ToString();
                txtpassport.Value=dt.Rows[0]["SOPASSPORT"].ToString();
                txtdienthoai.Value=dt.Rows[0]["DIENTHOAI"].ToString();
                dlhocham.SelectedValue=dt.Rows[0]["IDHOCHAM"].ToString();
                dltongiao.SelectedValue=dt.Rows[0]["IDTONGIAO"].ToString();              
                txtngaycapcm.Text=dt.Rows[0]["NGAYCAP"].ToString();
                txtngaycappp.Text=dt.Rows[0]["NGAYCAPPP"].ToString();
                txtemail.Value=dt.Rows[0]["EMAIL"].ToString();
                dlhocvi.SelectedValue=dt.Rows[0]["IDHOCVI"].ToString();
                dlquoctich.SelectedValue=dt.Rows[0]["IDQUOCTICH"].ToString();
                //txtnguyenquan.Value=dt.Rows[0]["NGUYENQUAN"].ToString();
                txtnoicapcm.Value=dt.Rows[0]["NOICAP"].ToString();
                txtnoicappp.Value=dt.Rows[0]["NOICAPPP"].ToString();
                dlchucdanh.SelectedValue=dt.Rows[0]["IDCHUCDANH"].ToString();
                dlgioitinh.SelectedValue=dt.Rows[0]["IDGIOITINH"].ToString();
                dlkethon.SelectedValue=dt.Rows[0]["IDKETHON"].ToString();
                txtsochungminh.Value = dt.Rows[0]["SOCHUNGMINH"].ToString();
                txtngoaingu.Text=dt.Rows[0]["NGOAINGU"].ToString();
                ddlchinhtri.SelectedValue = dt.Rows[0]["IDCHINHTRI"].ToString();
                txtsonha.Text = dt.Rows[0]["SONHA"].ToString();
                txtduong.Text = dt.Rows[0]["DUONG"].ToString();
                txtXaPhuong.Text = dt.Rows[0]["XA"].ToString();
                txthuyen.Text = dt.Rows[0]["HUYEN"].ToString();
                txthuyennq.Value = dt.Rows[0]["HUYENNQ"].ToString();
                txtxanq.Text = dt.Rows[0]["XANQ"].ToString();
                ddlTinhNQ.SelectedValue = dt.Rows[0]["TINHNQ"].ToString();
                ddlTinhTP.SelectedValue = dt.Rows[0]["IDTINH"].ToString();
                
                
                      
                                               


            }
            else
            {
                Label5.Text = "Không Thể Edit Được";

            }

        }
        catch 
        {
            Label5.Text = "Không Thể Edit Được";
        }
    }
    /// <summary>
    /// Cắt chuổi bên phải
    /// </summary>
    /// <param name="s"></param>
    /// <param name="count"></param>
    /// <returns></returns>
    static string Right(string s, int count)
    {
        string newString = String.Empty;
        if (s != null && count > 0)
        {
            int startIndex = s.Length - count;
            if (startIndex > 0)
                newString = s.Substring(startIndex, count);
            else
                newString = s;
        }
        return newString;
    }
    /// <summary>
    /// Tạo mã nhân viên
    /// </summary>
    /// <returns></returns>
    /// 
    private void LoadNgayThang()
    {
        // Tao ra ngay
        
        ArrayList ngay = new ArrayList();
        for (int i = 1; i <= 31; i++)
            ngay.Add(i);
        ddlNgay.DataSource = ngay;
        ddlNgay.DataBind();

        //Tao ra thang
        ArrayList thang = new ArrayList();
        for (int i = 1; i <= 12; i++)
            thang.Add(i);
        ddlThang.DataSource = thang;
        ddlThang.DataBind();

        // Tao ra nam

        ArrayList nam = new ArrayList();
        for (int i = 1900; i <= 2011; i++)
            nam.Add(i);
        ddlNam.DataSource = nam;
        ddlNam.DataBind();
       
    }
    private string TaoMaNV()
    {
        string ma;
     

        DataTable dt = dtsv.ExcuteTable("ns_tt_laymanv", dtsv.CreateParameter("@IDDONVI", dlChuyende.SelectedValue));
        string MANV=dt.Rows[0]["MANHANVIEN"].ToString();
        string MADONVI=dt.Rows[0]["MADONVI"].ToString();
       
        if (MANV=="")
        {
            ma = MADONVI + "00000";
        }
        else
        {
            int sohoa = int.Parse(Right(MANV,5));
            sohoa += 1;
            ma = MADONVI + sohoa.ToString("00000");
        }
        return ma;
            
       

    }
    protected void btnThemMoi_Click(object sender, EventArgs e)
    {
        int tb = 0;
        string Error = "";
        try
        {
          
            if (txtemail.Value != "")
            {
                Regex check = new Regex("(?<user>[^@]+)@(?<host>.+)");
                Match m = check.Match(txtemail.Value);
                if (!m.Success)
                {
                    Label5.Text = "Định dạng email không đúng";
                    return;
                }
            }
            string tenfilethat = "";
            string dd = Server.MapPath("~/Admin/nhansu/anhdaidien/");
            if (FileUpload1.HasFile)
            {
                tenfilethat = Guid.NewGuid().ToString() + "." + FileUpload1.PostedFile.FileName.Split('.')[1];
                dd += "/" + tenfilethat;
                FileUpload1.PostedFile.SaveAs(dd);
            }

            // Xu ly du lieu datetime
            DateTime dt = DateTime.Parse(txtngaysinh.Text, CultureInfo.GetCultureInfo("vi-VN"));

            SqlParameter[] param = new SqlParameter[] 
        {
            dtsv.CreateParameter("@IDDONVI",dlChuyende.SelectedValue),
            dtsv.CreateParameter("@MANHANVIEN",TaoMaNV()),
            dtsv.CreateParameter("@HOVATEN",txthovaten.Value),
            //dtsv.CreateParameter("@IDLOAIHOPDONG",dlloaihopdong.SelectedValue),
            dtsv.CreateParameter("@NGAYSINH",dt),
            dtsv.CreateParameter("@SOCHUNGMINH",txtsochungminh.Value),           
            dtsv.CreateParameter("@SOPASSPORT",txtpassport.Value),
            dtsv.CreateParameter("@DIENTHOAI",txtdienthoai.Value),
            dtsv.CreateParameter("@IDHOCHAM",dlhocham.SelectedValue),
            dtsv.CreateParameter("@IDTONGIAO",dltongiao.SelectedValue),
            dtsv.CreateParameter("@NOISINH",txtnoisinh.Value),
            dtsv.CreateParameter("@NGAYCAP",txtngaycapcm.Text),
            dtsv.CreateParameter("@NGAYCAPPP",txtngaycappp.Text),
            dtsv.CreateParameter("@EMAIL",txtemail.Value),
            dtsv.CreateParameter("@IDHOCVI",dlhocvi.SelectedValue),
            dtsv.CreateParameter("@IDQUOCTICH",dlquoctich.SelectedValue),
          //  dtsv.CreateParameter("@NGUYENQUAN",txtnguyenquan.Value),
            dtsv.CreateParameter("@NOICAP",txtnoicapcm.Value),
            dtsv.CreateParameter("@NOICAPPP",txtnoicappp.Value),
            dtsv.CreateParameter("@IDCHUCDANH",dlchucdanh.SelectedValue),
            dtsv.CreateParameter("@IDKETHON",dlkethon.SelectedValue),
            dtsv.CreateParameter("@IDGIOITINH",dlgioitinh.SelectedValue),
            dtsv.CreateParameter("@NGOAINGU",txtngoaingu.Text),
            dtsv.CreateParameter("@IDCHINHTRI",ddlchinhtri.SelectedValue),
            dtsv.CreateParameter("@checkemall",0),
            dtsv.CreateParameter("@HINHANH",tenfilethat),
            dtsv.CreateParameter("@SONHA",txtsonha.Text),
            dtsv.CreateParameter("@DUONG",txtduong.Text),
            dtsv.CreateParameter("@XA",txtXaPhuong.Text),
            dtsv.CreateParameter("@HUYEN",txthuyen.Text),
            dtsv.CreateParameter("@XANQ",txtxanq.Text),
            dtsv.CreateParameter("@HUYENNQ",txthuyennq.Value),
            dtsv.CreateParameter("@TINHNQ",ddlTinhNQ.SelectedValue),
            dtsv.CreateParameter("@IDTINH",ddlTinhTP.SelectedValue), 
           

        };
            param[22].Direction = ParameterDirection.Output;
            tb = dtsv.ExecuteNonQuery("ns_insert_ttcn", param);
             int kiemtra=int.Parse(param[22].Value.ToString());
            if(kiemtra!=0)
                Error="Email này đã tồn tại ";
            
            
        }
        catch
        {
            Label5.Text = Error;
 
        }
        if (tb > 0)
            Label5.Text = "Thêm thành công";
        else Label5.Text = Error;
      LoadGridView();
      clear();

    }
    /// <summary>
    /// Cap nhap thong tin khi  sua xong
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void btnLuuSua_Click(object sender, EventArgs e)
    {


        int tb = 0;
        try
        {
            // Kiem tra hinh co ton tai hinh dai dien khong
            string tenfilethat = "";
            string dd = Server.MapPath("~/Admin/nhansu/anhdaidien/");
            if (FileUpload1.HasFile)
            {
               tenfilethat = Guid.NewGuid().ToString() + "." + FileUpload1.PostedFile.FileName.Split('.')[1];
                dd += "/" + tenfilethat;
                FileUpload1.PostedFile.SaveAs(dd);
            }

            // Kiem tra di dang email
            if (txtemail.Value != "")
            {
                Regex check = new Regex("(?<user>[^@]+)@(?<host>.+)");
                Match m = check.Match(txtemail.Value);
                if (!m.Success)
                {
                    Label5.Text = "Định dạng email không đúng";
                    return;
                }
            }

            // Xu ly du lieu datetime
            DateTime dt = DateTime.Parse(txtngaysinh.Text, CultureInfo.GetCultureInfo("vi-VN"));
            SqlParameter[] param = new SqlParameter[] 
        {
            dtsv.CreateParameter("@IDDONVI",dlChuyende.SelectedValue),
            dtsv.CreateParameter("@MANHANVIEN",txtmanhanvien.Text),
            dtsv.CreateParameter("@HOVATEN",txthovaten.Value),
           // dtsv.CreateParameter("@IDLOAIHOPDONG",dlloaihopdong.SelectedValue),
            dtsv.CreateParameter("@NGAYSINH",dt),
            dtsv.CreateParameter("@SOCHUNGMINH",txtsochungminh.Value),           
            dtsv.CreateParameter("@SOPASSPORT",txtpassport.Value),
            dtsv.CreateParameter("@DIENTHOAI",txtdienthoai.Value),
            dtsv.CreateParameter("@IDHOCHAM",dlhocham.SelectedValue),
            dtsv.CreateParameter("@IDTONGIAO",dltongiao.SelectedValue),
            dtsv.CreateParameter("@NOISINH",txtnoisinh.Value),
            dtsv.CreateParameter("@NGAYCAP",txtngaycapcm.Text),
            dtsv.CreateParameter("@NGAYCAPPP",txtngaycappp.Text),
            dtsv.CreateParameter("@EMAIL",txtemail.Value),
            dtsv.CreateParameter("@IDHOCVI",dlhocvi.SelectedValue),
            dtsv.CreateParameter("@IDQUOCTICH",dlquoctich.SelectedValue),
          //  dtsv.CreateParameter("@NGUYENQUAN",txtnguyenquan.Value),
            dtsv.CreateParameter("@NOICAP",txtnoicapcm.Value),
            dtsv.CreateParameter("@NOICAPPP",txtnoicappp.Value),
            dtsv.CreateParameter("@IDCHUCDANH",dlchucdanh.SelectedValue),
            dtsv.CreateParameter("@IDKETHON",dlkethon.SelectedValue),
            dtsv.CreateParameter("@IDGIOITINH",dlgioitinh.SelectedValue),
            dtsv.CreateParameter("@HINHANH",tenfilethat),
            dtsv.CreateParameter("@NGOAINGU",txtngoaingu.Text),
            dtsv.CreateParameter("@IDCHINHTRI",ddlchinhtri.SelectedValue),
            dtsv.CreateParameter("@SONHA",txtsonha.Text),
            dtsv.CreateParameter("@DUONG",txtduong.Text),
            dtsv.CreateParameter("@XA",txtXaPhuong.Text),
            dtsv.CreateParameter("@HUYEN",txthuyen.Text),
            dtsv.CreateParameter("@XANQ",txtxanq.Text),
            dtsv.CreateParameter("@HUYENNQ",txthuyennq.Value),
            dtsv.CreateParameter("@TINHNQ",ddlTinhNQ.SelectedValue),
            dtsv.CreateParameter("@IDTINH",ddlTinhTP.SelectedValue),
            dtsv.CreateParameter("@ID",int.Parse(Session["ID_TT"].ToString()))

        };
            tb = dtsv.ExecuteNonQuery("ns_update_ttcn", param);
        }
        catch 
        {
            Label5.Text ="Không thành công";

        }
        if (tb > 0)
            Label5.Text = "  Thành Công";
        //else Label5.Text = "Thêm Không Thành Công";
        LoadGridView();

        btnThemMoi.Visible = true;
        dlChuyende.AutoPostBack = true;


    }
    /// <summary>
    ///  Xoa nhan vien
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void idxoa_Click(object sender, EventArgs e)
    {
        int tb = 0;
        try
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox remove = (CheckBox)GridView1.Rows[i].FindControl("cbitem");

                if (remove.Checked)
                {
                    Label lb = (Label)GridView1.Rows[i].FindControl("ID");
                    int ID = int.Parse(lb.Text);
                    SqlParameter param = new SqlParameter("@ID", ID);

                    tb = dtsv.ExecuteNonQuery("ns_del_ttcn", param);


                }

            }
            if (tb >0)
            {
                Label5.Text = "Xoá  Thành Công";

            }
            else Label5.Text="Xóa Không Thành Công";
        }
        catch 
        {
            Label5.Text = "Xóa Không Thành Công";
        }
        LoadGridView();
    }
    protected void cbheader_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox checkhead = (CheckBox)GridView1.HeaderRow.FindControl("cbheader");
        if (checkhead.Checked)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox item = (CheckBox)GridView1.Rows[i].FindControl("cbitem");
                item.Checked = true;

            }
        }
        else
        {

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox item = (CheckBox)GridView1.Rows[i].FindControl("cbitem");
                item.Checked = false;

            }
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        LoadGridView();
    }
    protected void idcheck_CheckedChanged(object sender, EventArgs e)
    {
        if (idcheck.Checked == true)
        {
            dlhocham.Enabled = true;
        }
        else dlhocham.Enabled = false;
    }
}

