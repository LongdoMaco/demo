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

public partial class Admin_daotao_giogiang : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            KhoiTao();
            LoadGridView();
            btnSua.Visible = false;
        }

    }
    // Them moi nhan vien
    protected void lbtNhanVien_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/nhansu/thongtincanhan.aspx");
    }
    // them mon hoc moi
    protected void lbtMonHoc_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/daotao/Themdulieu/monhoc.aspx");
    }
    // Them nam hoc
    protected void lbtNamHoc_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/daotao/Themdulieu/Namhoc.aspx");

    }
    // Them hoc ky
    protected void lbtHocKy_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/daotao/Themdulieu/Hocky.aspx");
    }
    #region Khoi tao du lieu 
    // Load don vi
    private void LoadDonVi()
    {
        ddlDonVi.DataSource = dtsv.ExcuteTable("ns_getAll_donvi");
        ddlDonVi.DataTextField = "DONVI";
        ddlDonVi.DataValueField = "ID";
        ddlDonVi.DataBind();
        LoadNhanVien();
    }
    // Load Nhan vien
    private void LoadNhanVien()
    {
        SqlParameter param = new SqlParameter("@DONVI_ID", ddlDonVi.SelectedValue);
        ddlNhanVien.DataSource = dtsv.ExcuteTable("ns_Get_tt_theoDonvi", param);
        ddlNhanVien.DataTextField = "HOVATEN";
        ddlNhanVien.DataValueField = "ID";
        ddlNhanVien.DataBind();
    }
    // Load Nam hoc
    private void LoadNamHoc()
    {
        dtsv.FillDropDownListSQL(ddlNamHoc,"select * from DimNam","Nam","ID");
    }
    // Load Hoc Ky
    private void LoadHocKy()
    {
        dtsv.FillDropDownListSQL(ddHocKy, "select * from DimHocKy", "HocKy", "ID");
    }
    // Load Mon Hoc
    private void LoadMonHoc()
    {
        dtsv.FillDropDownListSQL(ddlMonHoc,"select * from DimMonHoc", "MonHoc", "ID");
    }
    // Khoi tao 
    private void KhoiTao()
    {
        LoadDonVi();
        LoadNamHoc();
        LoadHocKy();
        LoadMonHoc();
 
    }
    // Load GridView
    private void LoadGridView()
    {
        dtsv.LoadGridView(gvDanhSach, "daotao_getAll", dtsv.CreateParameter("@IDNhanVien", ddlNhanVien.SelectedValue));
    }
    #endregion
    protected void ddlDonVi_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadNhanVien();
        LoadGridView();
    }
    protected void btnThemMoi_Click(object sender, EventArgs e)
    {
        // Khoi tao cac tham so
        
        try
        {
            SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@IDNhanVien",ddlNhanVien.SelectedValue),
            new SqlParameter("@IDNamHoc",ddlNamHoc.SelectedValue),
            new SqlParameter("@IDMon",ddlMonHoc.SelectedValue),
            new SqlParameter("@IDHocKy",ddHocKy.SelectedValue),
            new SqlParameter("@GioGiang",int.Parse(txtGioGiang.Text))
        };
           int donganhhuong=dtsv.ExecuteNonQuery("daotao_addgiogiang", param);
           if (donganhhuong != 0)
               lblMess.Text = "Thêm thành công !";
           else lblMess.Text = "Thêm không thành công";

        }
        catch         {

            lblMess.Text = "Thêm không thành công";
        }
        LoadGridView();
    }
    protected void lbtsua_Click(object sender, EventArgs e)
    {
        btnSua.Visible = true;
        LinkButton lbt = (LinkButton)sender;
        Label lbl = (Label)lbt.Parent.FindControl("ID");
        int ID = int.Parse(lbl.Text);
     
        Session["ID_DaoTao"] = ID;
        //GetTen();
        SqlParameter param = new SqlParameter("@ID", ID);
        DataTable dt = dtsv.ExcuteTable("daotao_gettheoID", param);

        if (dt.Rows.Count != 0)
        {
            ddlNhanVien.SelectedValue = dt.Rows[0]["IDNhanVien"].ToString();
            ddlNamHoc.SelectedValue = dt.Rows[0]["IDNamHoc"].ToString();
            ddlMonHoc.SelectedValue = dt.Rows[0]["IDMon"].ToString();
            ddlMonHoc.SelectedValue = dt.Rows[0]["IDHocKy"].ToString();
            txtGioGiang.Text = dt.Rows[0]["GioGiang"].ToString();
        }
        else
            lblMess.Text = "Không thể Edit được";
    }
    protected void lblXoa_Click(object sender, EventArgs e)
    {
        LinkButton lbt = (LinkButton)sender;
        Label lbl = (Label)lbt.Parent.FindControl("ID");
        int ID = int.Parse(lbl.Text);
        try
        {
            int donganhhuong = dtsv.ExecuteNonQuery("daotao_delete_theoID", dtsv.CreateParameter("@ID", ID));
            if (donganhhuong!=0)
                lblMess.Text = "Thành công";
            else lblMess.Text = "Không thành công";
        }
        catch
        {
            lblMess.Text = "Không thành công";
           
        }
        LoadGridView();
        

    }
    protected void btnSua_Click(object sender, EventArgs e)
    {
        // Khoi tao cac tham so
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@IDNhanVien",ddlNhanVien.SelectedValue),
            new SqlParameter("@IDNamHoc",ddlNamHoc.SelectedValue),
            new SqlParameter("@IDMon",ddlMonHoc.SelectedValue),
            new SqlParameter("@IDHocKy",ddHocKy.SelectedValue),
            new SqlParameter("@GioGiang",int.Parse(txtGioGiang.Text)),
            new SqlParameter("@ID",int.Parse(Session["ID_DaoTao"].ToString()))
        };
        try
        {
            int donganhhuong = dtsv.ExecuteNonQuery("daotao_update_giogiang", param);
            if (donganhhuong != 0)
                lblMess.Text = "Sửa thành công !";
            else lblMess.Text = "Sửa không thành công";

        }
        catch
        {

            lblMess.Text = "Sửa không thành công";
        }
        LoadGridView();
        btnSua.Visible = false;
    }
    protected void ddlNhanVien_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadGridView();
    }
}
