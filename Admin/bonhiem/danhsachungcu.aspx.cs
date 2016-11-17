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
public partial class Admin_bonhiem_danhsachungcu : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            GetPhieu();
            LoadGridView();
            
        }
    }

    private void GetPhieu()
    {
        dtsv.LoadDropDownList(ddlphieu, "tblphieu_get", "TENBONHIEM", "ID");


    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddlphieu_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadGridView();
    }
    // Load gridview
    private void LoadGridView()
    {
        
        dtsv.LoadGridView(GridView1, "tblthongtinbonhiem_thongke", dtsv.CreateParameter("@ID", ddlphieu.SelectedValue));
        
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.DataItem != null)
        {
            e.Row.Cells[5].Text = dtsv.ExcuteScalary("tblThongTinBoNhiem_thongke_dtnk", dtsv.CreateParameter("@IDTHONGTIN", int.Parse(e.Row.Cells[5].Text))).ToString();
            e.Row.Cells[6].Text = dtsv.ExcuteScalary("tblThongTinBoNhiem_thongke_tc", dtsv.CreateParameter("@IDTHONGTIN", int.Parse(e.Row.Cells[6].Text))).ToString();
            e.Row.Cells[7].Text = dtsv.ExcuteScalary("tblThongTinBoNhiem_thongke_tc", dtsv.CreateParameter("@IDTHONGTIN", int.Parse(e.Row.Cells[7].Text))).ToString();
        }
    }
    
}
