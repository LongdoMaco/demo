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


public partial class user_tienluong : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["nguoisudung_ID"] == null)
            Response.Redirect("~/Dangnhap.aspx");

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            LoadGridView();

        }
        catch
        {


        }
    }
    private void LoadGridView()
    {
        try
        {
        SqlParameter[] param = new SqlParameter[] { 
        dtsv.CreateParameter("@THANG",dlThang.SelectedValue),        
        dtsv.CreateParameter("@NAM",dlNam.SelectedValue),
        dtsv.CreateParameter("@IDTHONGTIN",int.Parse(Session["nguoisudung_ID"].ToString())),
         dtsv.CreateParameter("@OK",1),
        };

            dtsv.LoadGridView(GridView1, "SP_ChiTietLuongThang", param);
        }
        catch 
        {

            throw;
        }


    }

   
}
