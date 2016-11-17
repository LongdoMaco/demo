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

public partial class Admin_BaiDang_GiaoTrinh : System.Web.UI.Page
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
            LayLinhVuc();
            LoadGirdView();

        }
    }
    // Khoi tao 
    private void LayLinhVuc()
    {
        dtsv.LoadDropDownList(ddlLoai, "GiaoTrinh_LinhVuc_Get_All", "LOAI", "ID");
    }

    private void LoadGirdView()
    {
        try
        {
            dtsv.LoadGridView(GridView1, "GiaoTrinh_get_All");
        }
        catch
        {
            throw;
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {


    }
    // Nếu muốn sửa dụng chức năng đăng bài của admin ở đây thì mở code vào visible button lại
    protected void btnDang_Click(object sender, EventArgs e)
    {
        //int tb = 0;
        //string AnhDaiDien = "";
        //string FileDinhKem = "";
        //if (AnhBia.HasFile)
        //{
        //    string severanhdiadien = Server.MapPath("~/Image/imagegiaotrinh");
        //    AnhDaiDien = Guid.NewGuid().ToString() + "." + AnhBia.PostedFile.FileName.Split('.')[1];
        //    severanhdiadien += "/" + AnhDaiDien;
        //    AnhBia.PostedFile.SaveAs(severanhdiadien);
        //}
        //if (fuldinhkem.HasFile)
        //{
        //    string severdinhkem = Server.MapPath("~/Files/giaotrinh");
        //    FileDinhKem = Guid.NewGuid().ToString() + "." + fuldinhkem.PostedFile.FileName.Split('.')[1];
        //    severdinhkem += "/" + FileDinhKem;
        //    fuldinhkem.PostedFile.SaveAs(severdinhkem);
        //}
        //SqlParameter[] param = new SqlParameter[]
        //{
        //    dtsv.CreateParameter("@IDLINHVUC",ddlLoai.SelectedValue),
        //    dtsv.CreateParameter("@NGONNGU",txtngonngu.Text),           
        //    dtsv.CreateParameter("@NGUON",txtNguon.Text),
        //    dtsv.CreateParameter("@TACGIA",txtTacGia.Text),            
        //    dtsv.CreateParameter("@TIEUDE",txttieude.Text),            
        //    dtsv.CreateParameter("@TomTat",txttrichdan.Text),
        //    dtsv.CreateParameter("@NoiDung",txtNoidung.Text),
        //    dtsv.CreateParameter("@AnhBia",AnhDaiDien),
        //    dtsv.CreateParameter("@FileDinhKem",FileDinhKem),
        //    dtsv.CreateParameter("@NguoiSuDungID",int.Parse(Session["nguoisudung_ID"].ToString()))
        //};
        //try
        //{
        //    tb = dtsv.ExecuteNonQuery("GiaoTrinh_insert", param);
        //}
        //catch
        //{
        //    Label1.Text = "Không thành công";
        //}
        //if (tb > 0)
        //    Label1.Text = "Đăng Thành Công";
        //else Label1.Text = "Không Thành Công";
        //LoadGirdView();

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        int tb = 0;
        LinkButton lbt = (LinkButton)sender;
        Label lbl = (Label)lbt.Parent.FindControl("ID");
        try
        {
            DataTable dt = dtsv.ExcuteDataset("GiaoTrinh_get_Anh_File", dtsv.CreateParameter("@ID", int.Parse(lbl.Text))).Tables[0];
            FileInfo fi = new FileInfo(Server.MapPath("~/Image/imagegiaotrinh/" + dt.Rows[0]["HINHANH"].ToString()));
            if (fi.Exists)
                fi.Delete();
            FileInfo fi1 = new FileInfo(Server.MapPath("~/Files/giaotrinh/" + dt.Rows[0]["TENFILE"].ToString()));
            string a = dt.Rows[0]["TENFILE"].ToString();
            if (fi1.Exists)
                fi1.Delete();
            tb = dtsv.ExecuteNonQuery("GiaoTrinh_Xoa_Theo_ID", dtsv.CreateParameter("@ID", int.Parse(lbl.Text)));
        }
        catch
        {
            Label1.Text = "Xóa không thành công";
            return;

        }
        if (tb > 0)
            Label1.Text = "Xóa Thành công";
        else Label1.Text = "Xóa không thành công";
        LoadGirdView();

    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        LinkButton lbt = (LinkButton)sender;
        Label lbl = (Label)lbt.Parent.FindControl("ID");
        Session["GiaoTrinh"] = int.Parse(lbl.Text);
        try
        {
            DataTable dt = dtsv.ExcuteDataset("GiaoTrinh_get_Theo_ID", dtsv.CreateParameter("@ID", int.Parse(lbl.Text))).Tables[0];
            if (dt.Rows.Count != 0)
            {
                txttieude.Text = dt.Rows[0]["TIEUDE"].ToString();
                txtngonngu.Text = dt.Rows[0]["NGONNGU"].ToString();
                txtNguon.Text = dt.Rows[0]["NGUON"].ToString();
                txtTacGia.Text = dt.Rows[0]["TACGIA"].ToString();
                txttrichdan.Text = dt.Rows[0]["TOMTAT"].ToString();
                txtNoidung.Value = dt.Rows[0]["NOIDUNG"].ToString();





            }

        }
        catch
        {
            Label1.Text = " không thành công";
            return;

        }


    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        int tb = 0;
        string AnhDaiDien = "";
        string FileDinhKem = "";
        if (AnhBia.HasFile)
        {
            string severanhdiadien = Server.MapPath("~/Image/imagegiaotrinh");
            AnhDaiDien = Guid.NewGuid().ToString() + "." + AnhBia.PostedFile.FileName.Split('.')[1];
            severanhdiadien += "/" + AnhDaiDien;
            AnhBia.PostedFile.SaveAs(severanhdiadien);
        }
        if (fuldinhkem.HasFile)
        {
            string severdinhkem = Server.MapPath("~/Files/giaotrinh");
            FileDinhKem = Guid.NewGuid().ToString() + "." + fuldinhkem.PostedFile.FileName.Split('.')[1];
            severdinhkem += "/" + FileDinhKem;
            fuldinhkem.PostedFile.SaveAs(severdinhkem);
        }
        SqlParameter[] param = new SqlParameter[]
        {
            dtsv.CreateParameter("@IDLINHVUC",ddlLoai.SelectedValue),
            dtsv.CreateParameter("@NGONNGU",txtngonngu.Text),           
            dtsv.CreateParameter("@NGUON",txtNguon.Text),
            dtsv.CreateParameter("@TACGIA",txtTacGia.Text),            
            dtsv.CreateParameter("@TIEUDE",txttieude.Text),            
            dtsv.CreateParameter("@TomTat",txttrichdan.Text),
            dtsv.CreateParameter("@NoiDung",txtNoidung.Value),
            dtsv.CreateParameter("@AnhBia",AnhDaiDien),
            dtsv.CreateParameter("@FileDinhKem",FileDinhKem),
            dtsv.CreateParameter("@ID",int.Parse( Session["GiaoTrinh"].ToString()))
        };
        try
        {
            tb = dtsv.ExecuteNonQuery("GiaoTrinh_update_user", param);
        }
        catch
        {
            Label1.Text = "Không thành công";
        }
        if (tb > 0)
            Label1.Text = " Thành Công";
        else Label1.Text = "Không Thành Công";
        LoadGirdView();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.DataItem != null)
            e.Row.Cells[2].Text = DAL.Security.DecryptData(e.Row.Cells[2].Text);
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        LoadGirdView();
    }
}
