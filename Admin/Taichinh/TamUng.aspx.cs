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
public partial class Admin_Taichinh_TamUng : System.Web.UI.Page
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
    #region khoi tao 
    public void GetAllDonVi()
    {

        ddlDonVi.DataSource = dtsv.ExcuteTable("ns_getAll_donvi");


        ddlDonVi.DataTextField = "DONVI";
        ddlDonVi.DataValueField = "ID";
        ddlDonVi.DataBind();
        //ddlDonVi.Items.Insert(0, new ListItem("-Tất Cả -", "0"));
        if (ddlDonVi.Items.Count < 0)
            return ;


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
            return ;

    }
    private void LoadGridView()
    {
        dtsv.LoadGridView(GridView1, "tblTamUng_get");
    }
    #endregion
    protected void ddlDonVi_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetNhanVien();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            int tb = 0;
            SqlParameter[] param = new SqlParameter[] { 
        dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
        dtsv.CreateParameter("@TONGTIEN",decimal.Parse(txttienung.Text)),
        dtsv.CreateParameter("@SOTIENTRA",decimal.Parse(txttramoithang.Text)),
        dtsv.CreateParameter("@NGAYTAMUNG",DateTime.ParseExact(txtngayung.Text,"dd/MM/yyyy",CultureInfo.InvariantCulture))       
       
        
        };
            tb = dtsv.ExecuteNonQuery("tblTamUng_set", param);
            if (tb <= 0) lblThongBao.Text = "Không thành công";
            else lblThongBao.Text = " Thành công";
        }
        catch
        {
            lblThongBao.Text = "Không thành công";
        }
        LoadGridView();
     }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton lbt = (LinkButton)sender;
            Label lbl = (Label)lbt.Parent.FindControl("ID");
            int IDNV = int.Parse(lbl.Text);
            Session["TamUng"] = IDNV;          
            SqlParameter param = new SqlParameter("@ID", IDNV);
            DataTable dt = dtsv.ExcuteTable("tblTamUng_get_ID", param);

            if (dt.Rows.Count != 0)
            {
                ddlNhanVien.SelectedValue = dt.Rows[0]["IDTHONGTIN"].ToString();
                txttienung.Text = dt.Rows[0]["TONGTIEN"].ToString();
                txttramoithang.Text = dt.Rows[0]["SOTIENTRA"].ToString();
                txtngayung.Text = dt.Rows[0]["NGAYTAMUNG"].ToString();

            }
            else
            {

                lblThongBao.Text = "Không sửa đc";
            }

        }
        catch 
        {
            lblThongBao.Text = "Không Thể Sửa Được!";
        }
        
    }
    protected void lbtxoa_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton lbt = (LinkButton)sender;
            Label lbl = (Label)lbt.Parent.FindControl("ID");
            int IDNV = int.Parse(lbl.Text);          
            SqlParameter param = new SqlParameter("@ID", IDNV);
            int tb = dtsv.ExecuteNonQuery("tblTamUng_Del_ID", param);
            if (tb > 0)
                lblThongBao.Text = "Ok";
            else lblThongBao.Text = "Not Ok";
            
        }
        catch
        {
            lblThongBao.Text = "Không Thể Sửa Được!";
        }
        LoadGridView();
        

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            int tb = 0;
            SqlParameter[] param = new SqlParameter[] { 
        dtsv.CreateParameter("@ID",int.Parse(Session["TamUng"].ToString())),
        dtsv.CreateParameter("@TONGTIEN",decimal.Parse(txttienung.Text)),
        dtsv.CreateParameter("@SOTIENTRA",decimal.Parse(txttramoithang.Text)),
        dtsv.CreateParameter("@NGAYTAMUNG",DateTime.ParseExact(txtngayung.Text,"dd/MM/yyyy",CultureInfo.InvariantCulture))       

        
        };
            tb = dtsv.ExecuteNonQuery("tblTamUng_update", param);
            if (tb <= 0) lblThongBao.Text = "Không thành công";
            else lblThongBao.Text = " Thành công";
        }
        catch
        {
            lblThongBao.Text = "Không thành công";
        }     
    }
}
