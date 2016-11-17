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
using System.IO;
using DAL;


public partial class Admin_BaiDang_TapChi : System.Web.UI.Page
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
            LoadLoai();
            LoadQuocGia();
            ListTapChi();
        }
    }




    // Khoi tao cac gia tri ban dau
    private void LoadLoai()
    {
        dtsv.LoadDropDownList(ddlLoai, "TapChi_Loai_GetAll", "LOAI", "ID");
    }
    private void LoadQuocGia()
    {
        dtsv.LoadDropDownList(ddlQuocTich, "ns_get_allQuocGia", "TENQUOCGIA", "ID");
    }
    private void ListTapChi()
    {
        dtsv.LoadGridView(GridView1, "TapChi_get_all");
    }

    // Nếu Admin không có chức năng đăng bài ở trang admin

    protected void btnDang_Click(object sender, EventArgs e)
    {
        //int tb = 0;
        //string AnhDaiDien = "";
        //string FileDinhKem = "";
        //if (AnhBia.HasFile)
        //{
        //    string severanhdiadien = Server.MapPath("~/Image/imagetapchi");
        //    AnhDaiDien = Guid.NewGuid().ToString() + "." + AnhBia.PostedFile.FileName.Split('.')[1];
        //    severanhdiadien += "/" + AnhDaiDien;
        //    AnhBia.PostedFile.SaveAs(severanhdiadien);
        //}
        //if (fuldinhkem.HasFile)
        //{
        //    string severdinhkem = Server.MapPath("~/Files/tapchi");
        //    FileDinhKem = Guid.NewGuid().ToString() + "." + fuldinhkem.PostedFile.FileName.Split('.')[1];
        //    severdinhkem += "/" + FileDinhKem;
        //    fuldinhkem.PostedFile.SaveAs(severdinhkem);
        //}
        //SqlParameter[] param = new SqlParameter[]
        //{
        //    dtsv.CreateParameter("@IDLOAI",ddlLoai.SelectedValue),
        //    dtsv.CreateParameter("@IDQUOCTICH",ddlQuocTich.SelectedValue),
        //    dtsv.CreateParameter("@TIEUDE",txtTieude.Text),
        //    dtsv.CreateParameter("@DangTai",txtDangTai.Text),
        //    dtsv.CreateParameter("@TomTat",txttrichdan.Text),
        //    dtsv.CreateParameter("@NoiDung",txtNoidung.Text),
        //    dtsv.CreateParameter("@AnhBia",AnhDaiDien),
        //    dtsv.CreateParameter("@FileDinhKem",FileDinhKem),
        //    dtsv.CreateParameter("@NguoiSuDungID",int.Parse(Session["nguoisudung_ID"].ToString()))
        //};
        //try
        //{
        //    tb = dtsv.ExecuteNonQuery("TapChi_insert", param);
        //}
        //catch
        //{
        //    Label1.Text = "Không thành công";
        //}
        //if (tb > 0)
        //    Label1.Text = "Đăng Thành Công";
        //else Label1.Text = "Không Thành Công";
        //ListTapChi();



    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        int tb = 0;
        LinkButton lbt = (LinkButton)sender;
        Label lbl = (Label)lbt.Parent.FindControl("ID");
        try
        {
            DataTable dt = dtsv.ExcuteDataset("TapChi_get_Anh_File", dtsv.CreateParameter("@ID", int.Parse(lbl.Text))).Tables[0];
            FileInfo fi = new FileInfo(Server.MapPath("~/Image/imagetapchi/" + dt.Rows[0]["HINHANH"].ToString()));
            if (fi.Exists)
                fi.Delete();
            FileInfo fi1 = new FileInfo(Server.MapPath("~/Files/tapchi/" + dt.Rows[0]["TENFILE"].ToString()));
            string a = dt.Rows[0]["TENFILE"].ToString();
            if (fi1.Exists)
                fi1.Delete();
            tb = dtsv.ExecuteNonQuery("TapChi_Xoa_Theo_ID", dtsv.CreateParameter("@ID", int.Parse(lbl.Text)));
        }
        catch
        {
            Label1.Text = "Xóa không thành công";
            return;

        }
        if (tb > 0)
            Label1.Text = "Xóa Thành công";
        else Label1.Text = "Xóa không thành công";
        ListTapChi();
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {


        LinkButton lbt = (LinkButton)sender;
        Label lbl = (Label)lbt.Parent.FindControl("ID");
        Session["Tapchi_Admin"] = int.Parse(lbl.Text);
        try
        {
            DataTable dt = dtsv.ExcuteDataset("TapChi_get_Theo_ID", dtsv.CreateParameter("@ID", int.Parse(lbl.Text))).Tables[0];
            if (dt.Rows.Count != 0)
            {
                txtTieude.Text = dt.Rows[0]["TIEUDE"].ToString();
                ddlLoai.Text = dt.Rows[0]["IDLOAI"].ToString();
                ddlQuocTich.Text = dt.Rows[0]["IDQUOCTICH"].ToString();
                txttrichdan.Text = dt.Rows[0]["DANGTAI"].ToString();
                txttrichdan.Text = dt.Rows[0]["TOMTAT"].ToString();
                txtDangTai.Text = dt.Rows[0]["DANGTAI"].ToString();
            }

        }
        catch
        {
            Label1.Text = " không thành công";
            return;

        }

        ListTapChi();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int tb = 0;
        string AnhDaiDien = "";
        string FileDinhKem = "";
        if (AnhBia.HasFile)
        {
            string severanhdiadien = Server.MapPath("~/Image/imagetapchi");
            AnhDaiDien = Guid.NewGuid().ToString() + "." + AnhBia.PostedFile.FileName.Split('.')[1];
            severanhdiadien += "/" + AnhDaiDien;
            AnhBia.PostedFile.SaveAs(severanhdiadien);
        }
        if (fuldinhkem.HasFile)
        {
            string severdinhkem = Server.MapPath("~/Files/tapchi");
            FileDinhKem = Guid.NewGuid().ToString() + "." + fuldinhkem.PostedFile.FileName.Split('.')[1];
            severdinhkem += "/" + FileDinhKem;
            fuldinhkem.PostedFile.SaveAs(severdinhkem);
        }
        SqlParameter[] param = new SqlParameter[]
        {
            dtsv.CreateParameter("@IDLOAI",ddlLoai.SelectedValue),
            dtsv.CreateParameter("@IDQUOCTICH",ddlQuocTich.SelectedValue),
            dtsv.CreateParameter("@TIEUDE",txtTieude.Text),
            dtsv.CreateParameter("@DangTai",txtDangTai.Text),
            dtsv.CreateParameter("@TomTat",txttrichdan.Text),
            dtsv.CreateParameter("@NoiDung",txtNoidung.Value),
            dtsv.CreateParameter("@AnhBia",AnhDaiDien),
            dtsv.CreateParameter("@FileDinhKem",FileDinhKem),
            dtsv.CreateParameter("@ID",int.Parse( Session["Tapchi_Admin"].ToString()))
        };
        try
        {
            tb = dtsv.ExecuteNonQuery("TapChi_update_user", param);
        }
        catch
        {
            Label1.Text = "Không thành công";
        }
        if (tb > 0)
            Label1.Text = "Thành Công";
        else Label1.Text = "Không Thành Công";
        ListTapChi();

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.DataItem != null)
            e.Row.Cells[2].Text = DAL.Security.DecryptData(e.Row.Cells[2].Text);
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        ListTapChi();
    }
}
