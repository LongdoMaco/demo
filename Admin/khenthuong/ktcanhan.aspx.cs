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

public partial class Admin_nhansu_in_ktcanhan: System.Web.UI.Page
{
    DataSet ds;


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
            InitData();
            InnitDataNamhoc();
            InnitDatahinhthuc();
            InnitDataDuoctang_IDhinhthuc();
            GetNhanVien();
            GetTen();
            Loadgridview();
            btnCapNhat.Visible = false;

        }

        //btSua.Visible = false;
        // btThemmoi.Visible = false;

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
    public void GetTen()
    {
        try
        {

            SqlParameter param = new SqlParameter("@IDNV", ddlNhanVien.SelectedValue);
           Label6.Text = dtsv.ExcuteScalary("ns_gethoten", param).ToString();
            
        }
        catch
        {
            Label5.Text = "Chưa có nhân viên";
        }

    }
    private void InitData()
    {
        SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "ns_getAll_donvi");
        ds = ConnectSQL.FillDataSet(sql_com);
        ddlDonVi.DataSource = ds.Tables[0].DefaultView;
        ddlDonVi.DataTextField = "DONVI";
        ddlDonVi.DataValueField = "ID";
        ddlDonVi.DataBind();
        if (ddlDonVi.Items.Count == 0)
        {
            ddlDonVi.Visible = false;
        }
        else

            Loadgridview();
        //InnitDataDuoctang_IDhinhthuc();
    }

    private void InnitDataNamhoc()
    {
        SqlCommand sql_nh = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "ns_getAll_namhoc");
        ds = ConnectSQL.FillDataSet(sql_nh);
        dlnamhoc.DataSource = ds.Tables[0].DefaultView;
        dlnamhoc.DataTextField = "NAMHOC";
        dlnamhoc.DataValueField = "ID";
        dlnamhoc.DataBind();
        // dlchucvu.Items.Insert(0, "Chọn chức vụ");
    }
    private void InnitDatahinhthuc()
    {
        SqlCommand sql_cv = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "ns_getAll_hinhthuc");
        ds = ConnectSQL.FillDataSet(sql_cv);
        dlhinhthuc.DataSource = ds.Tables[0].DefaultView;
        dlhinhthuc.DataTextField = "HINHTHUC";
        dlhinhthuc.DataValueField = "ID";
        dlhinhthuc.DataBind();
        //dlloaihopdong.Items.Insert(0, "Chọn loại hợp đồng");
    }
    private void InnitDataDuoctang_IDhinhthuc()
    {
        //hinhthuc_ID = Convert.ToByte(dlhinhthuc.SelectedValue);

        SqlParameter param = new SqlParameter("HINHTHUC_ID", dlhinhthuc.SelectedValue);
        dtsv.LoadDropDownList(dlduoctang, "ns_Get_kt_theohinhthuc", "DUOCTANG", "ID", param);

    }
    private void Loadgridview()
    {
        SqlParameter param = new SqlParameter("@ID", ddlNhanVien.SelectedValue);
        dtsv.LoadGridView(GridView1, "get_ttkt", param);
    }
    protected void dlChuyende_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetNhanVien();
        GetTen();
    }
    protected void dlhinhthuc_SelectedIndexChanged(object sender, EventArgs e)
    {
        InnitDataDuoctang_IDhinhthuc();
        Loadgridview();
        Label5.Text = "";
    }



    private void clear()
    {
        //txtnhiemky.Value = "";
        //txtghichu.Value = "";
        //txtngaybatdau.Value = "";
        //txtngaybonhiem.Value = "";
        //txtngayhuongluong.Value = "";
        //txtngaytuyendung.Value = "";
    }

   
    protected void cbheader_CheckedChanged1(object sender, EventArgs e)
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
    protected void lbtEdi_Click(object sender, EventArgs e)
    {

        btnCapNhat.Visible = true;
        try
        {
            LinkButton lbt = (LinkButton)sender;
            Label lbl = (Label)lbt.Parent.FindControl("ID");
            int ID = int.Parse(lbl.Text);
            Session["KTCN"] = int.Parse(lbl.Text);
            SqlParameter param = new SqlParameter("@ID", ID);
            DataTable dt = dtsv.ExcuteTable("ns_get_ktcanhan", param);
            if (dt.Rows.Count != 0)
            {
                //dlduoctang.SelectedValue = dt.Rows[0]["IDDUOCTANG"].ToString();
                dlnamhoc.SelectedValue = dt.Rows[0]["IDNAM"].ToString();
                txtQD.Text = dt.Rows[0]["QUYETDINHSO"].ToString();
                txtnoidung.Text = dt.Rows[0]["NOIDUNG"].ToString();
                txtNguoiKi.Text = dt.Rows[0]["NGUOIKY"].ToString();
                txtngayki.Text = dt.Rows[0]["NGAYKY"].ToString();
                ddlNhanVien.SelectedValue = dt.Rows[0]["IDTHONGTIN"].ToString();
            }
            else
            {
                Label5.Text = "Không Thể Sửa Được";
            }
        }
        catch (Exception ex)
        {
            Label5.Text = ex.Message.ToString();

        }
        GetTen();

    }
 
   
    protected void idsave_Click(object sender, EventArgs e)
    {
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Loadgridview();
    }
    protected void btnTaoMoi_Click(object sender, EventArgs e)
    {
        int tb = 0;
        try
        {

            SqlParameter[] param = new SqlParameter[]
                    {
                        dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
                        dtsv.CreateParameter("@IDDUOCTANG",dlduoctang.SelectedValue),
                        dtsv.CreateParameter("@IDNAM",dlnamhoc.SelectedValue),
                        dtsv.CreateParameter("@NOIDUNG",txtnoidung.Text),
                        dtsv.CreateParameter("@QUYETDINHSO",txtQD.Text),
                        dtsv.CreateParameter("@NGAYKY",txtngayki.Text),
                        dtsv.CreateParameter("@NGUOIKY",txtNguoiKi.Text)
                    };

            tb = dtsv.ExecuteNonQuery("ns_insert_ktcanhan", param);




            if (tb > 0)
                Label5.Text = "Thêm Thành Công";
            else
            {
                Label5.Text = "Thêm Không Thành Công";
            }
        }
        catch (Exception ex)
        {
            Label5.Text = ex.Message;
        }
        Loadgridview();
    }
    protected void btnCapNhat_Click1(object sender, EventArgs e)
    {
        int tb = 0;
        try
        {


            SqlParameter[] param = new SqlParameter[]
                    {
                        dtsv.CreateParameter("@IDDUOCTANG",dlduoctang.SelectedValue),
                        dtsv.CreateParameter("@IDNAM",dlnamhoc.SelectedValue),
                        dtsv.CreateParameter("@NOIDUNG",txtnoidung.Text),
                        dtsv.CreateParameter("@QUYETDINHSO",txtQD.Text),
                        dtsv.CreateParameter("@NGAYKY",txtngayki.Text),
                        dtsv.CreateParameter("NGUOIKY",txtNguoiKi.Text),
                        dtsv.CreateParameter("@ID",int.Parse(Session["KTCN"].ToString()))
                    };

            tb = dtsv.ExecuteNonQuery("ns_update_ktcanhan", param);




            if (tb > 0)
                Label5.Text = "Cập Nhật  Thành Công";
            else
            {
                Label5.Text = " Không Thành Công";
            }
        }
        catch (Exception ex)
        {
            Label5.Text = ex.Message;
        }
        Loadgridview();
        btnCapNhat.Visible = false;

    }
    protected void btnXoa_Click1(object sender, EventArgs e)
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
                    tb = dtsv.ExecuteNonQuery("ns_deltete_ktcanhan", param);

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
        Loadgridview();
    }
    protected void ddlDonVi_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label5.Text = "";
        GetNhanVien();
        GetTen();
    }
    protected void dlduoctang_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddlNhanVien_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label5.Text = "";
        Loadgridview();
    }
}
