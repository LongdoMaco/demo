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

public partial class Admin_Taichinh_phucapkhac : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetAllDonVi();
            GetNhanVien();
            LoadGridView();
        }
    }
    #region Khoi Tao
    public void GetAllDonVi()
    {

        ddlDonVi.DataSource = dtsv.ExcuteTable("ns_getAll_donvi");


        ddlDonVi.DataTextField = "DONVI";
        ddlDonVi.DataValueField = "ID";
        ddlDonVi.DataBind();
        //ddlDonVi.Items.Insert(0, new ListItem("-Tất Cả -", "0"));
        if (ddlDonVi.Items.Count < 0)
            return;


    }
    // Load Len Grid
    public void GetNhanVien()
    {
        int IDDonVi = int.Parse(ddlDonVi.SelectedValue);
        SqlParameter param = new SqlParameter("@DONVI_ID", IDDonVi);
        ddlNhanVien.DataSource = dtsv.ExcuteTable("ns_Get_tt_theoDonvi", param);
        ddlNhanVien.DataTextField = "HOVATEN";
        ddlNhanVien.DataValueField = "ID";
        ddlNhanVien.DataBind();
        if (ddlNhanVien.Items.Count == 0)
            return;

    }
    private void LoadGridView()
    {

        dtsv.LoadGridView(GridView1,"tblPhanCap_get_ID", dtsv.CreateParameter("@IDTHONGTIN", ddlNhanVien.SelectedValue));

    }
    #endregion
    protected void btnPhuCap_Click(object sender, EventArgs e)
    {
        try
        {
            int tb = 0;
            SqlParameter[] param = new SqlParameter[] {
            dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
            dtsv.CreateParameter("@THANG",ddlThang.SelectedValue),
            dtsv.CreateParameter("@NAM",ddlNam.SelectedValue),
            dtsv.CreateParameter("@TONGTIEN",decimal.Parse(txtSoTien.Text)),
            dtsv.CreateParameter("@GHICHU",txtGhiChu.Text)
            };
            tb = dtsv.ExecuteNonQuery("tblphucap_set", param);
            if (tb <= 0)
                lblthongbao.Text = "Không thành công";
            else lblthongbao.Text = "Thành công";

        }
        catch 
        {

            lblthongbao.Text = "Không Thành công";

        }
        LoadGridView();
    }
    protected void lblSua_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton lbt = (LinkButton)sender;
            Label lbl = (Label)lbt.Parent.FindControl("ID");
            int IDNV = int.Parse(lbl.Text);
            Session["ID_PC"] = IDNV;
            SqlParameter param = new SqlParameter("@ID", IDNV);
            DataTable dt = dtsv.ExcuteTable("tblPhucCap_get_ID", param);

            if (dt.Rows.Count != 0)
            {
                ddlNhanVien.SelectedValue = dt.Rows[0]["IDTHONGTIN"].ToString();
                txtSoTien.Text= dt.Rows[0]["TONGTIEN"].ToString();
                txtGhiChu.Text=dt.Rows[0]["GHICHU"].ToString();
              

            }
            else
            {

               lblthongbao.Text="Không sửa được";
            }

        }
        catch
        {
            lblthongbao.Text="Không sửa được";
        }
      LoadGridView();

    }
    protected void lbtxoa_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton lbt = (LinkButton)sender;
            Label lbl = (Label)lbt.Parent.FindControl("ID");
            int IDNV = int.Parse(lbl.Text);
            SqlParameter param = new SqlParameter("@ID", IDNV);
            int tb = dtsv.ExecuteNonQuery("tblphucap_del_id", param);
            if (tb > 0)
                lblthongbao.Text = "OK";
            else lblthongbao.Text = "Not Ok";

            

        }
        catch
        {
            lblthongbao.Text = "Không Thể Sửa Được!";
        }
        LoadGridView();
    }
    protected void btnCapNhat_Click(object sender, EventArgs e)
    {

        try
        {
            int tb = 0;
            SqlParameter[] param = new SqlParameter[] {
            dtsv.CreateParameter("@ID",int.Parse(Session["ID_PC"].ToString())),
            dtsv.CreateParameter("@THANG",ddlThang.SelectedValue),
            dtsv.CreateParameter("@NAM",ddlNam.SelectedValue),
            dtsv.CreateParameter("@TONGTIEN",decimal.Parse(txtSoTien.Text)),
            dtsv.CreateParameter("@GHICHU",txtGhiChu.Text)
            };
            tb = dtsv.ExecuteNonQuery("tblphucap_update_Id", param);
            if (tb <= 0)
                lblthongbao.Text = "Không thành công";
            else lblthongbao.Text = "Thành công";

        }
        catch
        {

            lblthongbao.Text = "Không Thành công";

        }
        LoadGridView();
    }
    protected void ddlDonVi_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetNhanVien();
        LoadGridView();
    }
    protected void ddlNhanVien_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadGridView();
    }
}
