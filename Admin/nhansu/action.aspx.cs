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
using DAL;
using System.Data.SqlClient;

public partial class Admin_nhansu_action : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["nguoisudung_ID"] == null)
        //    Response.Redirect("~/DangNhap.aspx");
        //string url = HttpContext.Current.Request.Url.AbsoluteUri;
        //string[] MangTach = url.Split('/');
        //if (!PhanQuyen.KiemTra(MangTach[MangTach.Length - 2].ToString(), int.Parse(Session["nguoisudung_ID"].ToString())))
        //{
        //    Response.Redirect("~/public/UnauthorizedAccess.aspx");
        //}

        if (!IsPostBack)
        {
            GetAllDonVi();
            GetNhanVien();
            LoadTrangThai();
            LoadGridView();
            GetTen();

        }

    }
    #region KhoiTao
    public void GetAllDonVi()
    {
        ddlDonVi.DataSource = dtsv.ExcuteTable("ns_getAll_donvi");
        ddlDonVi.DataTextField = "DONVI";
        ddlDonVi.DataValueField = "ID";
        ddlDonVi.DataBind();
        if (ddlDonVi.Items.Count < 0)
            Label5.Text = "Chưa có đơn vị nào cả";



    }
    private void LoadTrangThai()
    {
        dtsv.LoadDropDownList(ddlTrangThai, "ns_get_trangthai", "TRANGTHAI", "ID");
    }
    public void GetNhanVien()
    {
        
        SqlParameter param = new SqlParameter("@DONVI_ID", ddlDonVi.SelectedValue);
        ddlNhanVien.DataSource = dtsv.ExcuteTable("ns_Get_tt_theoDonvi", param);
        ddlNhanVien.DataTextField = "HOVATEN";
        ddlNhanVien.DataValueField = "ID";
        ddlNhanVien.DataBind();
        if (ddlNhanVien.Items.Count == 0)
            Label5.Text = "Chưa có nhân viên nào";

    }
    public void GetTen()
    {
        try
        {
            int IDNV = int.Parse(ddlNhanVien.SelectedValue);
            SqlParameter param = new SqlParameter("@IDNV", IDNV);
            lblnhanvien.Text = dtsv.ExcuteScalary("ns_gethoten", param).ToString();
        }
        catch
        {
            Label5.Text = "Chưa tồn tại nhân viên";
        }

    }
    private void LoadGridView()
    {
        
        SqlParameter parma=new SqlParameter ("@IDDONVI",ddlDonVi.SelectedValue);
        dtsv.LoadGridView(GridView1, "ns_get_action", parma);
        int stt = 0;
        for (int i=0; i<GridView1.Rows.Count;i++)
        {
            stt = i + 1;
        }
 
    }
    #endregion
    protected void ddlDonVi_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetNhanVien();
        LoadGridView();
    }
    protected void lblEdit_Click(object sender, EventArgs e)
    {
       
        try
        {
            LinkButton lb = (LinkButton)sender;
            Label lbl = (Label)lb.Parent.FindControl("ID");
            int ID = int.Parse(lbl.Text);
           Session["IDAC"] = ID;
            SqlParameter param = new SqlParameter("@IDTHONGTIN", ID);
            DataTable dt = dtsv.ExcuteTable("ns_get_suatrangthai", param);
            if (dt.Rows.Count != 0)
            {
                ddlNhanVien.SelectedValue = dt.Rows[0]["IDTHONGTIN"].ToString();
                ddlTrangThai.SelectedValue = dt.Rows[0]["IDTRANGTHAI"].ToString();
                txtngaybatdau.Text = dt.Rows[0]["NGAYBATDAU"].ToString();
                txtghichu.Text = dt.Rows[0]["GHICHU"].ToString();
            }
        }
        catch(Exception ex)
        {
            Label5.Text = ex.Message;
        }
    }
    protected void bntCapNhat_Click(object sender, EventArgs e)
    { int tb=0;
        try
        {


            SqlParameter[] parm = new SqlParameter[] {
                dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
                dtsv.CreateParameter("@IDTRANGTHAI",ddlTrangThai.SelectedValue),
                dtsv.CreateParameter("@NGAYBATDAU",txtngaybatdau.Text),
                dtsv.CreateParameter("@GHICHU",txtghichu.Text)
            };
            tb=dtsv.ExecuteNonQuery("ns_insert_actionnhanvien", parm);
            if(tb>0)
                Label5.Text="Cập Nhật Thành Công";
            else Label5.Text="Cập Nhật Không Thành Công";
        }
        catch 
        {
            
            Label5.Text="Cập Nhật Không Thành Công";
        }
        LoadGridView();
    }

    protected void bntXoa_Click(object sender, EventArgs e)
    {
        Label5.Text = "Xóa thành công!";
    }
}
