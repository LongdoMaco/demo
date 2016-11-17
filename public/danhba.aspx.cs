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
public partial class public_danhba : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            dtsv.LoadDropDownList(ddldonvi, "ns_getAll_donvi", "DONVI", "ID");
            ddldonvi.Items.Insert(0, new ListItem("-Chọn đơn vị-", "0"));
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string TenNhanVien = txtnhapten.Text;
        dtsv.LoadGridView(GridView1, "get_nhanvien_theoten", dtsv.CreateParameter("@TenNhanVien", TenNhanVien));


    }
    private void LoadGridView()
    {

        //dtsv.LoadGridView(GridView1, "get_nhanvien_theoten", dtsv.CreateParameter("@TenNhanVien", TenNhanVien));
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {


        dtsv.LoadGridView(GridView1, "get_nhanvien_donvi", dtsv.CreateParameter("@IDDONVI", ddldonvi.SelectedValue));



    }
    //protected void Button2_Click(object sender, EventArgs e)
    //{
    //    Response.Clear();

    //    Response.AddHeader("content-disposition",
    //    "attachment;filename=FileName.xls");

    //    Response.Charset = "";

    //    // If you want the option to open the Excel file without saving than

    //    // comment out the line below

    //    // Response.Cache.SetCacheability(HttpCacheability.NoCache);

    //    Response.ContentType = "application/vnd.xls";

    //    System.IO.StringWriter stringWrite = new System.IO.StringWriter();

    //    System.Web.UI.HtmlTextWriter htmlWrite =
    //    new HtmlTextWriter(stringWrite);


    //    // turn off paging 
    //    GridView1.AllowPaging = false;
    //    dtsv.LoadGridView(GridView1, "get_nhanvien_donvi", dtsv.CreateParameter("@IDDONVI", ddldonvi.SelectedValue));


    //    GridView1.RenderControl(htmlWrite);
    //    Response.Write("<meta http-equiv=Content-Type content=\"text/html; charset=utf-8\">");
    //    Response.Write("<b>" + LayTieuDe() + "</b>");

    //    Response.Write(stringWrite.ToString());

    //    Response.End();

    //    // turn the paging on again 
    //    GridView1.AllowPaging = true;
    //    dtsv.LoadGridView(GridView1, "get_nhanvien_donvi", dtsv.CreateParameter("@IDDONVI", ddldonvi.SelectedValue));
    //}
    //public override void VerifyRenderingInServerForm(Control control)
    //{
    //    //base.VerifyRenderingInServerForm(control);
    //}
    private string LayTieuDe()
    {
        return "Danh Sách Danh Bạ Của Đơn Vị " + ddldonvi.SelectedItem.Text;

    }
}
