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
public partial class Admin_nckh_Default2 : System.Web.UI.Page
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
            LoadDonVi();
            LoadNhanVien();
            LoadDataList();
            LoadGriView();
        }
    }
    #region Initialzie
    // Lay Don Vi 
    private void LoadDonVi()
    {
        dtsv.LoadDropDownList(ddlDonVi, "ns_getAll_donvi", "DONVI", "ID");
 
    }

    // Lay Nhan vien Theo Don Vi 
    private void LoadNhanVien()
    {
        dtsv.LoadDropDownList(ddlNhanVien, "ns_Get_tt_theoDonvi", "HOVATEN", "ID", dtsv.CreateParameter("@DONVI_ID", ddlDonVi.SelectedValue));
    }

    // Lay Linh Vuc
    private void LoadDataList()
    {
        dtsv.LoadDropDownList(dllinhvuc, "ns_getAll_linhvuc", "LINHVUC", "ID");
        dtsv.LoadDropDownList(dlcapdetai, "ns_getAll_capdetai", "CAPDETAI", "ID");
        dtsv.LoadDropDownList(dlloaihinh, "ns_getAll_loaihinh", "LOAIHINH", "ID");
        dtsv.LoadDropDownList(dlchutri, "ns_getAll_coquanchutri", "TENCOQUAN", "ID");

    }
    // lay loai hinh
   
    #endregion
    protected void ddlDonVi_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadNhanVien();
        LoadGriView();
    }
    private void LoadGriView()
    {
        dtsv.LoadGridView(GridView1, "ns_Get_tt_IDDONVI_tm_kh", dtsv.CreateParameter("@DONVI_ID", ddlDonVi.SelectedValue));
    }
    protected void btnthemmoi_Click(object sender, EventArgs e)
    {

        int tb = 0;
        try
        {
            SqlParameter[] param = new SqlParameter[]
        {
            dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
            dtsv.CreateParameter("@IDLINHVUC",dllinhvuc.SelectedValue),
            dtsv.CreateParameter("@IDLOAIHINH",dlloaihinh.SelectedValue),
            dtsv.CreateParameter("@IDCOQUANCHUTRI",dlchutri.SelectedValue),
            dtsv.CreateParameter("@IDCAPDETAI",dlcapdetai.SelectedValue),
            dtsv.CreateParameter("@MADETAI",txtMaDeTai.Text),
            dtsv.CreateParameter("@TENDETAI",txttendetai.Text),
            dtsv.CreateParameter("@TUNGAY",txttungay.Text),
            dtsv.CreateParameter("@DENNGAY",txtdenngay.Text),
            dtsv.CreateParameter("@TENSANPHAM",txttensanpham.Value),
            dtsv.CreateParameter("@DIACHIAPDUNG",txtdiachiapdung.Value),
            dtsv.CreateParameter("@BANGSO",txtbangso.Value),
            dtsv.CreateParameter("@BANGCHU",txtbangso.Value),
            dtsv.CreateParameter("@TINHCAPTHIET",txtcapthiet.Text),
            dtsv.CreateParameter("@MUCTIEU",txtmuctieu.Text),
            dtsv.CreateParameter("@TRONGNGOAINUOC",txtketqua.Text)
                        
        };

            tb = dtsv.ExecuteNonQuery("ns_Ins_tm", param);
        }
        catch
        {
            Label5.Text = "Lưu Không Thành Công";
        }
        if (tb > 0)
            Label5.Text = "Lưu Thành Công";
        else Label5.Text = "Lưu Không Thành Công";

        LoadGriView();

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
    protected void lbtsua_Click(object sender, EventArgs e)
    {
        Label5.Text = "";
        try
        {
            LinkButton lbt = (LinkButton)sender;
            Label lbl = (Label)lbt.Parent.FindControl("ID");
            string ID = lbl.Text;
            Session["DeTai"] = ID;
            SqlParameter param = new SqlParameter("@MADETAI", ID);
            DataTable dt = dtsv.ExcuteTable("ns_get_thuyetminh_kh_ID", param);
            if (dt.Rows.Count != 0)
            {




                txtMaDeTai.Text = dt.Rows[0]["MADETAI"].ToString();
               txttendetai.Text = dt.Rows[0]["TENDETAI"].ToString();
                txttensanpham.Value = dt.Rows[0]["TENSANPHAM"].ToString();
                txtdiachiapdung.Value = dt.Rows[0]["DIACHIAPDUNG"].ToString();
                txttungay.Text = dt.Rows[0]["TUNGAY"].ToString();
                txtdenngay.Text = dt.Rows[0]["DENNGAY"].ToString();
                txtbangso.Value = dt.Rows[0]["BANGSO"].ToString();
                txtbangchu.Value = dt.Rows[0]["BANGCHU"].ToString();
                txtcapthiet.Text = dt.Rows[0]["TINHCAPTHIET"].ToString();
                txtmuctieu.Text = dt.Rows[0]["MUCTIEU"].ToString();
                txtketqua.Text = dt.Rows[0]["TRONGNGOAINUOC"].ToString();
                //txtten.Value = dt.Rows[0]["TENDETAI"].ToString();
                ddlNhanVien.SelectedValue= dt.Rows[0]["ID_THONGTIN"].ToString();
                dllinhvuc.SelectedValue = dt.Rows[0]["ID_LINHVUC"].ToString();
                dlloaihinh.SelectedValue = dt.Rows[0]["ID_LOAIHINH"].ToString();
                dlchutri.SelectedValue = dt.Rows[0]["ID_COQUANCHUTRI"].ToString();
                dlcapdetai.SelectedValue = dt.Rows[0]["ID_CAPDETAI"].ToString();



            }
            else
            {
                Label5.Text = "Không Thành Công";

            }

        }
        catch 
        {
            Label5.Text = "Một Lỗi Thao Tác Xảy Ra";
        }
    }
    protected void btnCapNhat_Click(object sender, EventArgs e)
    {

        // Sửa thông tin
        int tb = 0;

        try
        {

            SqlParameter[] param = new SqlParameter[] 
        {
            dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
            dtsv.CreateParameter("@IDLINHVUC",dllinhvuc.SelectedValue),
            dtsv.CreateParameter("@IDLOAIHINH",dlloaihinh.SelectedValue),
            dtsv.CreateParameter("@IDCOQUANCHUTRI",dlchutri.SelectedValue),
            dtsv.CreateParameter("@IDCAPDETAI",dlcapdetai.SelectedValue),
            dtsv.CreateParameter("@MADETAI",Session["DeTai"].ToString()),
            dtsv.CreateParameter("@TENDETAI",txttendetai.Text),
            dtsv.CreateParameter("@TUNGAY", txttungay.Text),
            dtsv.CreateParameter("@DENNGAY",txtdenngay.Text),
            dtsv.CreateParameter("@TENSANPHAM", txttensanpham.Value.Trim()),
            dtsv.CreateParameter("@DIACHIAPDUNG",txtdiachiapdung.Value.Trim()),
            dtsv.CreateParameter("@BANGSO",txtbangso.Value.Trim()),
            dtsv.CreateParameter("@BANGCHU",txtbangchu.Value.Trim()),
            dtsv.CreateParameter("@TINHCAPTHIET",txtcapthiet.Text),
            dtsv.CreateParameter("@MUCTIEU", txtmuctieu.Text),
            dtsv.CreateParameter("@TRONGNGOAINUOC",txtketqua.Text)


       
        };
            tb = dtsv.ExecuteNonQuery("ns_Upd_tm_kh", param);
        }
        catch
        {
            Label5.Text = "Cập Nhật Không Thành Công";
        }
        if (tb > 0)
            Label5.Text = "Cập Nhật Thành Công";
        else Label5.Text = "Cập Nhật Không Thành Công";
        LoadGriView();
    }
    protected void btnXoa_Click(object sender, EventArgs e)
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
                    string ID = lb.Text;
                    SqlParameter param = new SqlParameter("@MADETAI",ID);

                    tb = dtsv.ExecuteNonQuery("kh_xoa", param);
                }

            }
            if (tb > 0)
                Label5.Text = "Xoá Thành Công";
            else
            {
                Label5.Text = "Xóa Không Thành Công";
            }
        }
        catch (Exception ex)
        {
            Label5.Text = ex.Message;
        }
        LoadGriView();

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        LoadGriView();
    }
}
