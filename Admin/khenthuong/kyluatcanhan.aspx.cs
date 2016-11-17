using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using UNI.Class;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using DAL;
using System.Globalization;

public partial class Admin_nhann_klcn : System.Web.UI.Page
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
            GetAllDonVi();
            GetNhanVien();
            GetDonViKL();
            GetHinhThuc();
            getNamHoc();
            LoadGridView();
            //HiddenControl();
            //GetTen();
           
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
            Label5.Text = "Chưa có đơn vị nào cả";



    }
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






    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    // LoadGridView
    private void LoadGridView()
    {
        try
        {
            SqlParameter param = new SqlParameter("@IDDONVI", ddlDonVi.SelectedValue);
            GridView1.DataSource = dtsv.ExcuteTable("get_klcn", param);
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            Label5.Text = ex.Message.ToString();
        }


    }



    protected void cbheader_CheckedChanged(object sender, EventArgs e)
    {
   
    }

    protected void ddlDonVi_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label5.Text = "";
        GetNhanVien();
        LoadGridView();
        //HiddenControl();
        //GetTen();
    }
  
    protected void btnThem_Click(object sender, EventArgs e)
    {
        int tb = 0;
        try
        {

            SqlParameter[] param = new SqlParameter[]
            {
                dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
                dtsv.CreateParameter("@IDHINHTHUC",ddlhinhthuckl.SelectedValue),
                dtsv.CreateParameter("@IDDONVI",ddldonvikl.SelectedValue),
                dtsv.CreateParameter("@IDNAM",ddlnamhockl.SelectedValue),
                dtsv.CreateParameter("@NOIDUNG",txtnoidung.Text),
                dtsv.CreateParameter("@QUYETDINHSO",txtquyetdinh.Text),
                dtsv.CreateParameter("@NGUOIKY",txtnguoiki.Text),
                dtsv.CreateParameter("@NGAYKY",DateTime.ParseExact(txtngayki.Text,"dd/MM/yyyy",CultureInfo.InvariantCulture))

            };
            tb = dtsv.ExecuteNonQuery("ns_insert_klcn", param);
        }
        catch 
        {
            Label5.Text = "Thêm Không Thành Công ";
        }
        if (tb > 0)
            Label5.Text = "Thêm Thành Công";
        else Label5.Text = "Thêm Không Thành Công";
        LoadGridView();

    }

    private object SqlDateTime(string p)
    {
        throw new NotImplementedException();
    }
    protected void bntCapNhat_Click(object sender, EventArgs e)
    {
        int tb = 0;

        try
        {
            SqlParameter[] param = new SqlParameter[]
                {
                    dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
                    dtsv.CreateParameter("@IDHINHTHUC",ddlhinhthuckl.SelectedValue),
                    dtsv.CreateParameter("@IDNAM",ddlnamhockl.SelectedValue),
                    dtsv.CreateParameter("@IDDONVI",ddldonvikl.SelectedValue),
                    dtsv.CreateParameter("@NOIDUNG",txtnoidung.Text),
                    dtsv.CreateParameter("@QUYETDINHSO",txtquyetdinh.Text),
                    dtsv.CreateParameter("@NGUOIKY",txtnguoiki.Text),
                    dtsv.CreateParameter("@NGAYKY",DateTime.ParseExact(txtngayki.Text,"dd/MM/yyyy",CultureInfo.InvariantCulture)),
                    dtsv.CreateParameter("@ID",int.Parse( Session["KT"].ToString()))

                };
            tb = dtsv.ExecuteNonQuery("ns_update_klcn_ma", param);

        }
        catch(Exception ex)
        {
            Label5.Text = ex.Message;

        }



        if (tb > 0)
            Label5.Text = "Cập Nhật Thành Công";

       // else Label5.Text = "Thêm Không Thành Công";
        LoadGridView();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.LoadGridView();
    }
    protected void btnXoa_Click(object sender, EventArgs e)
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

                    tb = dtsv.ExecuteNonQuery("ns_del_khcn_ma", param);


                }

            }

        }
        catch (Exception ex)
        {
            Label5.Text = ex.Message.ToString();
        }
        if (tb > 0)
            Label5.Text = "Xóa Thành Công";
        else Label5.Text = "Xóa Không Thành Công";
        LoadGridView();

    }
    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {


        
    }
  
    private void GetDonViKL()
    {
        dtsv.LoadDropDownList(ddldonvikl, "ns_get_dvkls", "TENDONVI", "IDDONVI");
    }
    private void GetHinhThuc()
    {
        dtsv.LoadDropDownList(ddlhinhthuckl, "ns_get_htkl", "HINHTHUC", "ID");

    }
    private void getNamHoc()
    {
        dtsv.LoadDropDownList(ddlnamhockl, "ns_getAll_namhoc", "NAMHOC", "ID");
    }
    protected void cbheader_CheckedChanged1(object sender, EventArgs e)
    {
        CheckBox cbheader = (CheckBox)GridView1.HeaderRow.FindControl("cbheader");
        if (cbheader.Checked)
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
    protected void lbtEdit_Click(object sender, EventArgs e)
    {
        GetTen();
        btnThem.Visible = true;
        btnCapNhat.Visible = true;
       

        try
        {
            LinkButton lbt = (LinkButton)sender;
            Label lbl = (Label)lbt.Parent.FindControl("ID");
            int ID = int.Parse(lbl.Text);
            Session["KT"] = ID;
            SqlParameter param = new SqlParameter("@ID", ID);
            DataTable dt = dtsv.ExcuteTable("ns_get_klcn", param);
            if (dt.Rows.Count != 0)
            {

                ddlNhanVien.SelectedValue = dt.Rows[0]["IDTHONGTIN"].ToString();
                ddldonvikl.SelectedValue = dt.Rows[0]["IDDONVI"].ToString();
                ddlhinhthuckl.SelectedValue = dt.Rows[0]["IDHINHTHUC"].ToString();
                ddlnamhockl.SelectedValue = dt.Rows[0]["IDNAM"].ToString();
                txtnoidung.Text = dt.Rows[0]["NOIDUNG"].ToString();
                txtnguoiki.Text = dt.Rows[0]["NGUOIKY"].ToString();
                txtngayki.Text = DateTime.Parse(dt.Rows[0]["NGAYKY"].ToString()).ToString("dd/MM/yyyy");
                txtquyetdinh.Text = dt.Rows[0]["QUYETDINHSO"].ToString();
            }
        }
        catch
        {
            Label5.Text = "Không Thể Sửa Được";
        }
    }
    public void GetTen()
    {
        try
        {
            int IDNV = int.Parse(ddlNhanVien.SelectedValue);
            SqlParameter param = new SqlParameter("@IDNV", IDNV);
            Label6.Text = dtsv.ExcuteScalary("ns_gethoten", param).ToString();
        }
        catch
        {
            Label5.Text = "Chưa Có Nhân Viên Nào";
        }

    }
  
}



