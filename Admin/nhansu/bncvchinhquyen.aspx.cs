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

public partial class Admin_nhansu_bncvchinhquyen : System.Web.UI.Page
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
        if (PhanQuyen.XacNhanGroup(int.Parse(Session["nguoisudung_ID"].ToString()), 8))
        {
            btnthemmoi.Visible = false;
            btnCapNhat.Visible = false;
            btnxoa.Visible = false;
        }

        if (!IsPostBack)
        {
            GetAllDonVi();
            GetNhanVien();
            LoadHSLuong();
            LoadChucVu();
          
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
        dtsv.LoadDropDownList(ddlChinhQuyen, "ns_get_DMCHUCVUCHINHQUYEN", "CHUCVU", "ID");
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

        dtsv.LoadGridView(GridView1, "ns_get_cvchinhquyen", dtsv.CreateParameter("@IDDONVI", ddlDonVi.SelectedValue));
    }

    private void LoadHSLuong()
    {
        dtsv.LoadDropDownList(ddlhesoluong, "ns_get_dm_hslchinhquyen", "HS", "ID");
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
        SqlParameter[] param = new SqlParameter[] {
            dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
            dtsv.CreateParameter("@IDCHUCVU",ddlChinhQuyen.SelectedValue),
            dtsv.CreateParameter("@NGAYBONHIEM",txtngaybonhiem.Text),
             dtsv.CreateParameter("@IDHESOLUONG",ddlhesoluong.SelectedValue),
            dtsv.CreateParameter("@TUNGAY",txttungay.Text),
            dtsv.CreateParameter("@DENNGAY",txtdengay.Text)           
                       
        };
        try
        {
            tb = dtsv.ExecuteNonQuery("[ns_bn_cvchinhquyen]", param);
            if (tb > 0)
                Label5.Text = "Thêm Thành Công";
            else Label5.Text = "Thêm Không Thành Công";
        }
        catch
        {
            Label5.Text = "Nhân Viên Này Đã Có Chức Vụ";
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

        if (!PhanQuyen.XacNhanGroup(int.Parse(Session["nguoisudung_ID"].ToString()), 8))
        {
            btnCapNhat.Visible = true;
          
        }
      

        LinkButton lbt = (LinkButton)sender;
        Label lbl = (Label)lbt.Parent.FindControl("ID");
        Session["ID_BN_CVCQ"] = Convert.ToInt32(lbl.Text);
        SqlParameter param = new SqlParameter("@ID", int.Parse(lbl.Text));
        DataTable dt = dtsv.ExcuteTable("ns_get_bncvchinhquyen", param);
        if (dt.Rows.Count != 0)
        {
           ddlNhanVien.SelectedValue = dt.Rows[0]["IDTHONGTIN"].ToString();
            ddlChinhQuyen.SelectedValue = dt.Rows[0]["IDCHUCVU"].ToString();
            ddlhesoluong.SelectedValue = dt.Rows[0]["IDHESOLUONG"].ToString();
            txtdengay.Text = dt.Rows[0]["DenNgay"].ToString();
           txttungay.Text = dt.Rows[0]["TuNgay"].ToString();
           txtngaybonhiem.Text = dt.Rows[0]["NGAYBONHIEM"].ToString();
           
        }
        GetTen();
    }

    protected void btnCapNhat_Click(object sender, EventArgs e)
    {
        int tb = 0;
        SqlParameter[] param = new SqlParameter[] {
            dtsv.CreateParameter("@ID",int.Parse(Session["ID_BN_CVCQ"].ToString())),
            dtsv.CreateParameter("@IDCHUCVU",ddlChinhQuyen.SelectedValue),
            dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
            dtsv.CreateParameter("@NGAYBONHIEM",DateTime.ParseExact(txtngaybonhiem.Text,"dd/MM/yyyy",CultureInfo.InvariantCulture)),
             dtsv.CreateParameter("@TUNGAY",txttungay.Text),
            dtsv.CreateParameter("@DENNGAY",txtdengay.Text) ,          
           dtsv.CreateParameter("@IDHESOLUONG",ddlhesoluong.SelectedValue)
         
            
        };
        try
        {
            tb = dtsv.ExecuteNonQuery("ns_bn_capnhat_cv_chinhquyen", param);
            if (tb > 0)
                Label5.Text = "Cập nhật thành công";
            else Label5.Text = "Cập nhật không thành công";
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
                    tb = dtsv.ExecuteNonQuery("ns_del_bncvchinhquyen", param);
                }

            }
            if (tb > 0)
                Label5.Text = "Xoá Thành Công";
            else
            {
                Label5.Text = "Xóa Không Thành Công";
            }
        }
        catch 
        {
            Label5.Text = "Xóa Không Thành Công";
        }
        LoadGridView();
    }
}
