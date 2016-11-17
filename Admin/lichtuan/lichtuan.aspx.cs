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
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using System.IO;

public partial class Admin_lichtuan_lichtuan : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["nguoisudung_ID"] == null)
            Response.Redirect("~/Dangnhap.aspx");
        if (!IsPostBack)
        {
            Tuan();
            Thu();
            lietketuan();
            Hoitruong();
            //LoadGirdView();
           
            lblTenlich.Text = "Lịch công tác " + ddMaTuan.SelectedItem.Text + "của các đơn vị đã đăng ký";           
        }
    }
    private void Tuan()
    {
        dtsv.LoadDropDownList(ddMaTuan, "Get_All_Tuan", "TenTuan", "ID");
    }

    private void Thu()
    {
        dtsv.LoadDropDownList(ddMaThu, "Get_All_Thu", "Thu", "MaThu");
    }
    private void Hoitruong()
    {
        dtsv.LoadDropDownList(ddMaHoitruong, "Get_All_Hoitruong", "MaHoitruong", "ID");
    }
    private void LoadGirdView()
    {
        try
        {
            //dtsv.LoadGridView(GridView1, "Lichtuan_get_User", dtsv.CreateParameter("@nguoisdungid", int.Parse(Session["nguoisudung_ID"].ToString())));
            SqlParameter param = new SqlParameter("@MaTuan", ddMaTuan.SelectedValue);
            GridView1.DataSource = dtsv.ExcuteTable("Lichtuan_get_matuan", param);
            GridView1.DataBind();
        }
        catch
        {
            throw;
        }
    }

    protected void btnDang_Click(object sender, EventArgs e)
    {
        int tb = 0;
        int iduser = Convert.ToInt32(Session["nguoisudung_ID"].ToString());
        try
        {
            SqlParameter[] param = new SqlParameter[]
            {
                    dtsv.CreateParameter("@MaNguoisudung", iduser),
                    dtsv.CreateParameter("@MaTuan", ddMaTuan.SelectedValue),
                    dtsv.CreateParameter("@MaThu", ddMaThu.SelectedValue),
                    dtsv.CreateParameter("@MaHoitruong", ddMaHoitruong.SelectedValue),
                    dtsv.CreateParameter("@Ngay", txtNgay.Text),
                    dtsv.CreateParameter("@Thoigian", txtThoigian.Text),
                    dtsv.CreateParameter("@Thanhphan", txttrichdan.Text),
                    dtsv.CreateParameter("@Chutri", txtChutri.Text),
                    dtsv.CreateParameter("@Noidung", txtNoidung.Text),
            };

            if (ddMaTuan.Text != "")
                tb = dtsv.ExecuteNonQuery("Lichtuan_insert", param);
            if (tb > 0)
                Label1.Text = "Dữ Liệu Đã Được Thêm";
            else
            {
                Label1.Text = "Dữ Liệu Chưa Được Thêm>>>>";
            }
        }
        catch (Exception)
        {

            Label1.Text = "Dữ Liệu Chưa Được Thêm...?";
        }
        lietketuan();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int tb = 0;
        int iduser = Convert.ToInt32(Session["nguoisudung_ID"].ToString());
        SqlParameter[] param = new SqlParameter[]
        {
            dtsv.CreateParameter("@MaLichtuan",int.Parse( Session["Lichtuan"].ToString())),
            dtsv.CreateParameter("@MaNguoisudung", iduser),
            dtsv.CreateParameter("@MaTuan", ddMaTuan.SelectedValue),
            dtsv.CreateParameter("@MaThu", ddMaThu.SelectedValue),
            dtsv.CreateParameter("@MaHoitruong", ddMaHoitruong.SelectedValue),
            dtsv.CreateParameter("@Ngay", txtNgay.Text),
            dtsv.CreateParameter("@Thoigian", txtThoigian.Text),
            dtsv.CreateParameter("@Thanhphan", txttrichdan.Text),
            dtsv.CreateParameter("@Chutri", txtChutri.Text),
            dtsv.CreateParameter("@Noidung", txtNoidung.Text),
        };
        try
        {
            tb = dtsv.ExecuteNonQuery("Lichtuan_update_admin", param);
        }
        catch
        {
            Label1.Text = "Không thành công";
        }
        if (tb > 0)
            Label1.Text = " Thành Công";
        else
            Label1.Text = "Không Thành Công...???";
        
        lietketuan();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        int tb = 0;
        LinkButton lbt = (LinkButton)sender;
        Label lbl = (Label)lbt.Parent.FindControl("MaLichtuan");
        try
        {
            tb = dtsv.ExecuteNonQuery("Lichtuan_Xoa_Theo_ID", dtsv.CreateParameter("@MaLichtuan", int.Parse(lbl.Text)));
        }
        catch
        {
            Label1.Text = "Xóa không thành công";
            return;

        }
        if (tb > 0)
            Label1.Text = "Xóa Thành công";
        else

            Label1.Text = "Xóa không thành công";
        
        lietketuan();
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        LinkButton lbt = (LinkButton)sender;
        Label lbl = (Label)lbt.Parent.FindControl("MaLichtuan");
        Session["Lichtuan"] = int.Parse(lbl.Text);
        try
        {
            DataTable dt = dtsv.ExcuteDataset("Lichtuan_get_Theo_ID", dtsv.CreateParameter("@MaLichtuan", int.Parse(lbl.Text))).Tables[0];
            if (dt.Rows.Count != 0)
            {               
                txtNgay.Text = dt.Rows[0]["Ngay"].ToString();
                txtThoigian.Text = dt.Rows[0]["Thoigian"].ToString();
                txtChutri.Text = dt.Rows[0]["Chutri"].ToString();
                txtNoidung.Text = dt.Rows[0]["Noidung"].ToString();
                txttrichdan.Text = dt.Rows[0]["Thanhphan"].ToString();

            }
        }
        catch
        {
            Label1.Text = "Không thành công";
            return;
        }        
        lietketuan();
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        // Label1.Text = "Thử thôi";
        
        int tb = 0;
        LinkButton lbt = (LinkButton)sender;
        Label lbl = (Label)lbt.Parent.FindControl("MaLichtuan");
        try
        {
            tb = dtsv.ExecuteNonQuery("Lichtuan_duyetlich_Theo_ID", dtsv.CreateParameter("@MaLichtuan", int.Parse(lbl.Text)));
        }
        catch
        {
            Label1.Text = "Duyệt không thành công";
            return;

        }
        if (tb > 0)
            Label1.Text = "Duyệt Thành công";
        else

            Label1.Text = "Duyệt không thành công";

        lietketuan();
        
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {


    }


    //private void laytheotentuan()
    //{
    //    int iduser = Convert.ToInt32(Session["nguoisudung_ID"].ToString());
    //    try
    //    {
    //        SqlParameter[] param = new SqlParameter[]
    //    {
    //        dtsv.CreateParameter("@MaTuan",ddMaTuan.SelectedValue),
    //        dtsv.CreateParameter("@MaNguoisudung",iduser)
    //    };
    //        dtsv.LoadGridView(GridView1, "Lichtuan_ten_tuan", param);
    //    }
    //    catch
    //    {

    //        throw;

    //    }
    //    lietketuan();

    //}
    public void lietketuan()
    {
        int iduser = Convert.ToInt32(Session["nguoisudung_ID"].ToString());
        try
        {
            SqlParameter[] param = new SqlParameter[]
        {
            dtsv.CreateParameter("@MaTuan",ddMaTuan.SelectedValue),
            //dtsv.CreateParameter("@MaNguoisudung",iduser)
        };
            dtsv.LoadGridView(GridView1, "Lichtuan_get_matuan", param);         
        }
        catch
        {

            throw;

        }
        DataTable dt = dtsv.ExcuteDataset("Lichtuan_get_matuan", dtsv.CreateParameter("@MaTuan", ddMaTuan.SelectedValue)).Tables[0];
        if (dt.Rows.Count != 0)
        {
            txttungay.Text = dt.Rows[0]["TuNgay"].ToString();
            txtdenngay.Text = dt.Rows[0]["DenNgay"].ToString();
        }
    }

    protected void ddMaTuan_SelectedIndexChanged(object sender, EventArgs e)
    {
        lietketuan();
        lblTenlich.Text = "Lịch công tác " + ddMaTuan.SelectedItem.Text + "của đơn vị đã đăng ký";   
    }
    protected void btXuatExel_Click(object sender, EventArgs e)
    {
        
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //base.VerifyRenderingInServerForm(control);
    }
    private string LayTieuDe()
    {
        return "Danh Sách Lịch của các Đơn Vị " + ddMaTuan.SelectedItem.Text+ "của các Đơn vị";

    }

    protected void btXuatcel_Click(object sender, EventArgs e)
    {
        Response.Clear();

        Response.AddHeader("content-disposition",
        "attachment;filename=FileName.xls");

        Response.Charset = "";

        // If you want the option to open the Excel file without saving than

        // comment out the line below

        // Response.Cache.SetCacheability(HttpCacheability.NoCache);

        Response.ContentType = "application/vnd.xls";

        System.IO.StringWriter stringWrite = new System.IO.StringWriter();

        System.Web.UI.HtmlTextWriter htmlWrite =
        new HtmlTextWriter(stringWrite);


        // turn off paging 
        GridView1.AllowPaging = false;
        dtsv.LoadGridView(GridView1, "Lichtuan_get_matuan", dtsv.CreateParameter("@MaTuan", ddMaTuan.SelectedValue));
        //DataTable dt = dtsv.ExcuteDataset("Lichtuan_get_matuan", dtsv.CreateParameter("@MaTuan", ddMaTuan.SelectedValue)).Tables[0];

        GridView1.RenderControl(htmlWrite);
        Response.Write("<meta http-equiv=Content-Type content=\"text/html; charset=utf-8\">");
        Response.Write("<b>" + LayTieuDe() + "</b>");

        Response.Write(stringWrite.ToString());

        Response.End();

        // turn the paging on again 
        GridView1.AllowPaging = true;
        dtsv.LoadGridView(GridView1, "Lichtuan_get_matuan", dtsv.CreateParameter("@MaTuan", ddMaTuan.SelectedValue));
    }
}