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
using System.Globalization;

public partial class Admin_nhansu_bncvdang : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["quyenid"] == null)
        //    Response.Redirect("~/DangNhap.aspx");
        //if (!(Session["quyenid"].ToString() == "5" || Session["quyenid"].ToString() == "1"))
        //{
        //    Response.Redirect("~/public/UnauthorizedAccess.aspx");
        //}

        if(Session["nguoisudung_ID"]==null)
            Response.Redirect("~/DangNhap.aspx");
        string url=HttpContext.Current.Request.Url.AbsoluteUri;
        string [] MangTach=url.Split('/');
        if (!PhanQuyen.KiemTra(MangTach[MangTach.Length - 2].ToString(), int.Parse(Session["nguoisudung_ID"].ToString())))
        {
            Response.Redirect("~/public/UnauthorizedAccess.aspx");
        }

        if (!IsPostBack)
        {
            GetAllDonVi();
            GetNhanVien();
           
            LoadChucVu();
            LoadHSLuong();
       
            LoadGridView();
            btnCapNhat.Visible = false;
        }

    }
    public void GetAllDonVi()
    {
        ddlDonVi.DataSource = dtsv.ExcuteTable("ns_getAll_donvi");
        ddlDonVi.DataTextField = "DONVI";
        ddlDonVi.DataValueField = "ID";
        ddlDonVi.DataBind();
        if (ddlDonVi.Items.Count < 0)
            Label1.Text = "Chưa có đơn vị nào cả";



    }
    private void LoadHSLuong()
    {
        dtsv.LoadDropDownList(ddlHeSoLuong, "ns_get_dm_hsldang", "HS", "ID");
    }
    public void GetNhanVien()
    {

        SqlParameter param = new SqlParameter("@DONVI_ID", ddlDonVi.SelectedValue);
        ddlNhanVien.DataSource = dtsv.ExcuteTable("ns_Get_tt_theoDonvi", param);
        ddlNhanVien.DataTextField = "HOVATEN";
        ddlNhanVien.DataValueField = "ID";
        ddlNhanVien.DataBind();
        if (ddlNhanVien.Items.Count == 0)
            Label1.Text = "Chưa có nhân viên nào";

    }
    // Hien thi chuc vu
    private void LoadChucVu()
    {
        dtsv.LoadDropDownList(ddlDVDang, "ns_get_DMCHUCVUDANG", "CHUCVU", "ID");
    }
   
    protected void ddlDonVi_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label5.Text = "";
        Label1.Text = "";
        GetNhanVien();
        GetTen();
        LoadGridView();
        btnCapNhat.Visible = false;
        
    }
    // Load GridView
    private void LoadGridView()
    {

        dtsv.LoadGridView(GridView1, "ns_get_cvdang", dtsv.CreateParameter("@IDDONVI", ddlDonVi.SelectedValue));
    }
    public void GetTen()
    {
        try
        {

            SqlParameter param = new SqlParameter("@IDNV", ddlNhanVien.SelectedValue);
            Label1.Text = dtsv.ExcuteScalary("ns_gethoten", param).ToString();
        }
        catch
        {
            Label1.Text = "Chưa có nhân viên";
        }

    }
    protected void ddlNhanVien_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label5.Text = "";
        Label1.Text = "";
        GetTen();
        btnCapNhat.Visible = false;
    }
    protected void btnthemmoi_Click(object sender, EventArgs e)
    {
        int tb = 0;
       if(txtngaybonhiem.Text=="")
       {
           Label5.Text = "Vui lòng nhập ngày bổ nhiêm !";
           return;
       }
        try
        {
            SqlParameter[] param = new SqlParameter[] {
            dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
            dtsv.CreateParameter("@IDCHUCVU",ddlDVDang.SelectedValue),
             dtsv.CreateParameter("@IDHESOLUONG",ddlHeSoLuong.SelectedValue),
              dtsv.CreateParameter("@NGAYBONHIEM",txtngaybonhiem.Text),
            dtsv.CreateParameter("@TUNGAY",txtTuNgay.Text),
             dtsv.CreateParameter("@DENNGAY",txtDenNgay.Text),
           

   
            
        };
            tb = dtsv.ExecuteNonQuery("ns_bn_cvdang", param);
            if (tb > 0)
                Label5.Text = "Thêm thành công";
            else Label5.Text = "Thêm không thành công";
        }
        catch
        {
            Label5.Text = "Bạn nhập thông tin không chính xác !";
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
    protected void lbl_Click(object sender, EventArgs e)
    {

        btnCapNhat.Visible = true;

        LinkButton lbt = (LinkButton)sender;
        Label lbl = (Label)lbt.Parent.FindControl("ID");


        Session["ID_BN_CVD"] = Convert.ToInt32(lbl.Text);
        SqlParameter param = new SqlParameter("@ID", int.Parse(lbl.Text));
      
        DataTable dt = dtsv.ExcuteTable("ns_get_bncvdang", param);
        if (dt.Rows.Count != 0)
        {
            ddlNhanVien.SelectedValue = dt.Rows[0]["IDTHONGTIN"].ToString();
            ddlDVDang.SelectedValue = dt.Rows[0]["IDCHUCVU"].ToString();
            txtDenNgay.Text = dt.Rows[0]["DENNGAY"].ToString();
            txtTuNgay.Text = dt.Rows[0]["TUNGAY"].ToString();
            ddlHeSoLuong.SelectedValue = dt.Rows[0]["IDHESOLUONG"].ToString();
            txtngaybonhiem.Text = dt.Rows[0]["NGAYBONHIEM"].ToString();

          
        }
        GetTen();
    }

    protected void btnCapNhat_Click(object sender, EventArgs e)
    {
        int tb = 0;
        SqlParameter[] param = new SqlParameter[] {
            dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
            dtsv.CreateParameter("@IDCHUCVU",ddlDVDang.SelectedValue),
            dtsv.CreateParameter("@ID",int.Parse(  Session["ID_BN_CVD"].ToString())),
            dtsv.CreateParameter("@NGAYBONHIEM",txtngaybonhiem.Text),
            dtsv.CreateParameter("@TUNGAY",txtTuNgay.Text),
            dtsv.CreateParameter("@DENNGAY",txtDenNgay.Text),
            dtsv.CreateParameter("@IDHESOLUONG",ddlHeSoLuong.SelectedValue),
        };
        try
        {
            tb = dtsv.ExecuteNonQuery("ns_bn_capnhat", param);
            if (tb > 0)
                Label5.Text = "Cập nhật thành công";
            else Label5.Text = "Cập nhật  không thành công";
        }
        catch
        {
            Label5.Text = "Cập nhật không thành công";
        }

        LoadGridView();
        btnCapNhat.Visible = false;

    }
    protected void btnxoa_Click(object sender, EventArgs e)
    {
        int tb = 0;
        try
        {

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {

                CheckBox cbitem = (CheckBox)GridView1.Rows[i].FindControl("cbitem");
                if (cbitem.Checked)
                {
                    Label lb = (Label)GridView1.Rows[i].FindControl("ID");
                    int ID = int.Parse(lb.Text);
                    SqlParameter param = new SqlParameter("@ID", ID);
                    tb = dtsv.ExecuteNonQuery("ns_del_bncvdang", param);
                }

            }
            if (tb > 0)
                Label5.Text = "Xoá thành công";
            else
            {
                Label5.Text = "Xóa không thành công";
            }
        }
        catch
        {
            Label5.Text = "Xóa không thành công";
        }
        LoadGridView();
    }
}
