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

public partial class Admin_nhansu_in_baohiem : System.Web.UI.Page
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

         if (IsPostBack == false)
        {
            Initializes();


        }

    }
    private void loadgridview()
    {
        dtsv.LoadGridView(GridView1, "ns_loadbh", dtsv.CreateParameter("@IDDONVI", ddlDonVi.SelectedValue));
    }
    public void GetAllDonVi()
    {
      
        ddlDonVi.DataSource = dtsv.ExcuteTable("ns_getAll_donvi");


        ddlDonVi.DataTextField = "DONVI";
        ddlDonVi.DataValueField = "ID";
        ddlDonVi.DataBind();
        //ddlDonVi.Items.Insert(0, new ListItem("-Tất Cả -", "0"));
        if (ddlDonVi.Items.Count < 0)
            Label5.Text = "Chưa có đơn vị nào cả";



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
            Label5.Text = "Chưa có nhân viên nào";

    }

    private void Initializes()
    {
        GetAllDonVi();
        GetNhanVien();
        loadgridview();      
      
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

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
    protected void lbtchitiet_Click(object sender, EventArgs e)
    {

      
        Label5.Text = "";
      

        try
        {
            LinkButton lbt = (LinkButton)sender;
            Label lbl = (Label)lbt.Parent.FindControl("ID");
            int IDNV = int.Parse(lbl.Text);
            Session["ID_BAOHIEM"] = IDNV;
            GetTen();
            SqlParameter param = new SqlParameter("@IDNV", IDNV);
            DataTable dt = dtsv.ExcuteTable("ns_get_BH_NV", param);

            if (dt.Rows.Count != 0)
            {
                               
                txtsobhxh.Text = dt.Rows[0]["SOBHXH"].ToString();
                txtcoquancap.Text = dt.Rows[0]["COQUANCAP"].ToString();
                txtngaycap.Text = dt.Rows[0]["NGAYCAPSO"].ToString();
                txtthoigiantu.Text = dt.Rows[0]["THOIGIANTU"].ToString();
                txtden.Text = dt.Rows[0]["THOIGIANHET"].ToString();
                txtluongcoban.Text = dt.Rows[0]["LUONGCABAN"].ToString();
                txtphucap.Text = dt.Rows[0]["CACKHOANPHUCAP"].ToString();
                txtnhatruong.Text = dt.Rows[0]["TLDBHNHATRUONG"].ToString();
                txtcanbo.Text = dt.Rows[0]["TLDBHCABO"].ToString();
                txtghichu.Text = dt.Rows[0]["GHICHU"].ToString();
                ddlNhanVien.SelectedValue = dt.Rows[0]["IDTHONGTIN"].ToString();

            }
            else
            {
                Label5.Text = "Nhân viên này chưa cập nhật thông tin! Vui lòng điền đầy đủ thông tin rồi Thêm";
                StatusConTrol();
                
                btnThem.Visible = true;
               
            }
            loadgridview();

        }
        catch (Exception ex)
        {
            Label5.Text = ex.Message.ToString();
        }

    }
    private void GetTen()
    {
        try
        {

            SqlParameter param = new SqlParameter("@IDNV",ddlNhanVien.SelectedValue);
            lblThongTin.Text = dtsv.ExcuteScalary("ns_gethoten", param).ToString();
        }
        catch
        {
            Label5.Text = "Có Lỗi Xảy Ra";
        }

    }
    private void StatusConTrol()
    {
        txtcanbo.Text = "";
        txtcoquancap.Text = "";
        txtden.Text = "";
        txtghichu.Text = "";
        txtluongcoban.Text = "";
        txtphucap.Text = "";
        txtsobhxh.Text = "";
        txtthoigiantu.Text = "";
        txtngaycap.Text = "";
        txtnhatruong.Text = "";

    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
            int tb = 0;
      
                SqlParameter[] param = new SqlParameter[]
            {
                dtsv.CreateParameter("@SOBHXH ",txtsobhxh.Text),
                dtsv.CreateParameter("@COQUANCAP ",txtcoquancap.Text),
                dtsv.CreateParameter("@NGAYCAPSO ",txtngaycap.Text),
                dtsv.CreateParameter("@THOIGIANTU ",txtthoigiantu.Text),
                dtsv.CreateParameter("@THOIGIANHET ",txtden.Text),
                dtsv.CreateParameter("@LUONGCABAN ",txtluongcoban.Text),
                dtsv.CreateParameter("@CACKHOANPHUCAP ",txtphucap.Text),
                dtsv.CreateParameter("@TLDBHNHATRUONG ",txtnhatruong.Text),
                dtsv.CreateParameter("@TLDBHCABO",txtcanbo.Text),
                dtsv.CreateParameter("@GHICHU",txtghichu.Text),    
                dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue)
            

            };
                tb = dtsv.ExecuteNonQuery("ns_insert_baohiem", param);
            

        
        if (tb > 0) Label5.Text = "Thêm Thành Công";
        else Label5.Text = "Thêm Không Thành Công";
        loadgridview();
        
 
        

    }
    protected void bntCapNhat_Click(object sender, EventArgs e)
    {
        int tb = 0;
        // Chen vao

        try
        {
          
            

                SqlParameter[] param = new SqlParameter[]
            {
                dtsv.CreateParameter("@SOBHXH ",txtsobhxh.Text),
                dtsv.CreateParameter("@COQUANCAP ",txtcoquancap.Text),
                dtsv.CreateParameter("@NGAYCAPSO ",txtngaycap.Text),
                dtsv.CreateParameter("@THOIGIANTU ",txtthoigiantu.Text),
                dtsv.CreateParameter("@THOIGIANHET ",txtden.Text),
                dtsv.CreateParameter("@LUONGCABAN ",txtluongcoban.Text),
                dtsv.CreateParameter("@CACKHOANPHUCAP ",txtphucap.Text),
                dtsv.CreateParameter("@TLDBHNHATRUONG ",txtnhatruong.Text),
                dtsv.CreateParameter("@TLDBHCABO",txtcanbo.Text),
                dtsv.CreateParameter("@GHICHU",txtghichu.Text),    
                dtsv.CreateParameter("@ID",Session["ID_BAOHIEM"])
            

            };
                tb = dtsv.ExecuteNonQuery("ns_update_baohiem", param);

            
            
        }
        catch
        {
            Label5.Text = "Cập Nhật Không Thành Công";
        }
        if (tb > 0)
            Label5.Text = "Cập Nhật Thành Công";
        else
        {
            Label5.Text = "Cập Nhật Không Thành Công";
        }
        // GridView1.DataBind();
        loadgridview();

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
                    int ID = int.Parse(lb.Text);
                    SqlParameter param = new SqlParameter("@ID", ID);

                    tb = dtsv.ExecuteNonQuery("ns_del_baohiem", param);
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
       
        loadgridview();
    }
    protected void ddlDonVi_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label5.Text = "";
        loadgridview();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        loadgridview();
    }
}
