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

public partial class Admin_bonhiem_nguoiungcu : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            GetAllDonVi();
            GetNhanVien();
            GetPhieu();
            LoadGridView();
            btnupdate.Visible = false;
        }
    }
    #region khoi tao
    // don vi
    public void GetAllDonVi()
    {
        ddlDonVi.DataSource = dtsv.ExcuteTable("ns_getAll_donvi");
        ddlDonVi.DataTextField = "DONVI";
        ddlDonVi.DataValueField = "ID";
        ddlDonVi.DataBind();
     



    }
    // nhan vien 
    public void GetNhanVien()
    {
        int IDDonVi = int.Parse(ddlDonVi.SelectedValue);
        SqlParameter param = new SqlParameter("@DONVI_ID", IDDonVi);
        ddlNhanVien.DataSource = dtsv.ExcuteTable("ns_Get_tt_theoDonvi", param);
        ddlNhanVien.DataTextField = "HOVATEN";
        ddlNhanVien.DataValueField = "ID";
        ddlNhanVien.DataBind();
     

    }
    private void GetPhieu()
    {
        dtsv.LoadDropDownList(ddlphieu,"tblphieu_get", "TENBONHIEM", "ID");

        
    }


    #endregion
    protected void Button1_Click(object sender, EventArgs e)
    {
        int tb = 0;
        SqlParameter[] param = new SqlParameter[]
        {
            dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
            dtsv.CreateParameter("@IDPHIEU",ddlphieu.SelectedValue)
        };


        try
        {
            tb = dtsv.ExecuteNonQuery("tblThongTinBoNhiem_set", param);
            if (tb == 0)
                lblThongBao.Text = "Không thành công";
            else lblThongBao.Text = " Thành công";
        }
        catch 
        {

            lblThongBao.Text = " Không thành công";
        }
        LoadGridView();
    }
    private void LoadGridView()
    {
        dtsv.LoadGridView(GridView1, "tblPhieuBoNhiem_get");
    }
    protected void ddlDonVi_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetNhanVien();
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {

        int tb = 0;

        LinkButton lbt = (LinkButton)sender;
        Label lbl = (Label)lbt.Parent.FindControl("ID");
        int ID=int.Parse(lbl.Text);
        try
        {
            tb = dtsv.ExecuteNonQuery("tblThongTinBoNhiem_del", dtsv.CreateParameter("@ID", ID));
            if (tb == 0)
                lblThongBao.Text = "Không thành công";
            else lblThongBao.Text = "Thành công";

        }
        catch 
        {
            lblThongBao.Text = "Không thành công";
           
        }
        LoadGridView();
        


    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {

        btnupdate.Visible = true;
        LinkButton lbt = (LinkButton)sender;
        Label lbl = (Label)lbt.Parent.FindControl("ID");
        int ID = int.Parse(lbl.Text);
        Session["ID_PHIEU"] = ID;
        try
        {
            DataTable dt = dtsv.ExcuteTable("tblThongTinBoNhiem_getID", dtsv.CreateParameter("@ID", ID));
            if (dt.Rows.Count != 0)
            {
                ddlNhanVien.SelectedValue = dt.Rows[0]["IDTHONGTIN"].ToString();
               ddlphieu.SelectedValue = dt.Rows[0]["IDPHIEU"].ToString();
            }
           

        }
        catch
        {
            lblThongBao.Text = "Không thành công";

        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int tb = 0;
        SqlParameter[] param = new SqlParameter[]
        {
            dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
            dtsv.CreateParameter("@IDPHIEU",ddlphieu.SelectedValue),
            dtsv.CreateParameter("ID",int.Parse(Session["ID_PHIEU"].ToString()))
        };


        try
        {
            tb = dtsv.ExecuteNonQuery("tblThongTinBoNhiem_update", param);
            if (tb == 0)
                lblThongBao.Text = "Không thành công";
            else lblThongBao.Text = " Thành công";
        }
        catch
        {

            lblThongBao.Text = " Không thành công";
        }
        LoadGridView();
        btnupdate.Visible = false;
    }
}
