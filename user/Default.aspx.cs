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
using System.Globalization;
using DAL;

public partial class user_MyProfile : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["nguoisudung_ID"] == null)
            Response.Redirect("~/Dangnhap.aspx");
       
        int ID = int.Parse(Session["nguoisudung_ID"].ToString());
        if (!IsPostBack)
        {
            KhoiTao();
            LoadThongTin(ID);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {


        int tb = 0;
        try
        {
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
            dtsv.CreateParameter("@NGAYCAP",txtnoicapcm.Value),
            dtsv.CreateParameter("@NGAYCAPPP",txtngaycappp.Text),
            dtsv.CreateParameter("@EMAIL",txtemail.Value),
            dtsv.CreateParameter("@IDHOCVI",dlhocvi.SelectedValue),
            dtsv.CreateParameter("@IDQUOCTICH",dlquoctich.SelectedValue),
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
            dtsv.CreateParameter("@IDTINH",ddlTinhTP.SelectedValue),
            dtsv.CreateParameter("@XANQ",txtXaNQ.Text),
            dtsv.CreateParameter("@HUYENNQ",txtHuyenNQ.Text),
            dtsv.CreateParameter("@TINHNQ",ddlTPNQ.SelectedValue),
            dtsv.CreateParameter("@ID",int.Parse(Session["nguoisudung_ID"].ToString()))

        };
            tb = dtsv.ExecuteNonQuery("ns_update_user", param);
        }
        catch 
        {
            lblthongbao.Text = "Không thành công";

        }
        if (tb > 0)
            lblthongbao.Text = "  Thành Công";

    }
    private void LoadThongTin( int ID)
    {
        lblthongbao.Text = "";

        try
        {
          
            //GetTen();
            SqlParameter param = new SqlParameter("@ID", ID);
            DataTable dt = dtsv.ExcuteTable("ns_get_tt_id", param);

            if (dt.Rows.Count != 0)
            {
                Session["ID_DV_CN"] = dt.Rows[0]["IDDONVI"].ToString();
                txtmanhanvien.Text = dt.Rows[0]["MANHANVIEN"].ToString();
                txthovaten.Value = dt.Rows[0]["HOVATEN"].ToString();              
                txtngaysinh.Text = dt.Rows[0]["DATESINH"].ToString();
                txtnoisinh.Value = dt.Rows[0]["NOISINH"].ToString();
                txtpassport.Value = dt.Rows[0]["SOPASSPORT"].ToString();
                txtdienthoai.Value = dt.Rows[0]["DIENTHOAI"].ToString();
                dlhocham.SelectedValue = dt.Rows[0]["IDHOCHAM"].ToString();
                dltongiao.SelectedValue = dt.Rows[0]["IDTONGIAO"].ToString();
                txtngaycapcm.Text = dt.Rows[0]["NGAYCAP"].ToString();
                txtngaycappp.Text = dt.Rows[0]["NGAYCAPPP"].ToString();
                txtemail.Value = dt.Rows[0]["EMAIL"].ToString();
                dlhocvi.SelectedValue = dt.Rows[0]["IDHOCVI"].ToString();
                dlquoctich.SelectedValue = dt.Rows[0]["IDQUOCTICH"].ToString();
                
                txtnoicapcm.Value = dt.Rows[0]["NOICAP"].ToString();
                txtnoicappp.Value = dt.Rows[0]["NOICAPPP"].ToString();
                dlchucdanh.SelectedValue = dt.Rows[0]["IDCHUCDANH"].ToString();
                dlgioitinh.SelectedValue = dt.Rows[0]["IDGIOITINH"].ToString();
                dlkethon.SelectedValue = dt.Rows[0]["IDKETHON"].ToString();
                txtsochungminh.Value = dt.Rows[0]["SOCHUNGMINH"].ToString();
                txtngoaingu.Text = dt.Rows[0]["NGOAINGU"].ToString();
                ddlchinhtri.SelectedValue = dt.Rows[0]["IDCHINHTRI"].ToString();
                txtsonha.Text = dt.Rows[0]["SONHA"].ToString();
                txtduong.Text = dt.Rows[0]["DUONG"].ToString();
                txtXaPhuong.Text = dt.Rows[0]["XA"].ToString();
                txthuyen.Text = dt.Rows[0]["HUYEN"].ToString();
                ddlTinhTP.SelectedValue = dt.Rows[0]["IDTINH"].ToString();
                txtXaNQ.Text = dt.Rows[0]["XANQ"].ToString();
                txtHuyenNQ.Text = dt.Rows[0]["HUYENNQ"].ToString();
                ddlTPNQ.SelectedValue = dt.Rows[0]["TINHNQ"].ToString();




            }
            else
            {
                lblthongbao.Text = "Không Thể Edit Được";

            }

        }
        catch
        {
            Response.Redirect("~/DangNhap.aspx");
        }
    }
    #region Khoi tao cac dropdownlist

    private void KhoiTao()
    {

              //dlloaihopdong.Items.Insert(0, "Chọn loại hợp đồng");
        
        dtsv.LoadDropDownList(dlchucdanh, "ns_getAll_chucvu", "CHUCDANH", "ID");
        // dlchucvu.Items.Insert(0, "Chọn chức vụ");


        dtsv.LoadDropDownList(dlhocvi, "ns_getAll_hocvi", "HOCVI", "ID");



        dtsv.LoadDropDownList(dlhocham, "ns_getAll_hocham", "HOCHAM", "ID");



        dtsv.LoadDropDownList(ddlchinhtri, "ns_get_chinhtri", "CHINHTRI", "ID");



        dtsv.LoadDropDownList(dlgioitinh, "ns_getAll_gioitinh", "GIOITINH", "ID");


        dtsv.LoadDropDownList(dltongiao, "ns_getAll_tongiao", "TONGIAO", "ID");


        dtsv.LoadDropDownList(dlquoctich, "ns_getAll_quoctich", "QUOCTICH", "ID");

        dtsv.LoadDropDownList(dlkethon, "ns_getAll_kethon", "KETHON", "ID");


        dtsv.LoadDropDownList(dlchucdanh, "ns_get_chucdanh", "CHUCDANH", "ID");
        dtsv.LoadDropDownList(ddlTinhTP, "ns_get_pp", "TINHTHANHPHO", "ID");
        dtsv.LoadDropDownList(ddlTPNQ, "ns_get_pp", "TINHTHANHPHO", "ID");
    }
    
    #endregion
    protected void idcheck_CheckedChanged(object sender, EventArgs e)
    {

        if (idcheck.Checked == true)
        {
            dlhocham.Enabled = true;
        }
        else dlhocham.Enabled = false;
    }
}
