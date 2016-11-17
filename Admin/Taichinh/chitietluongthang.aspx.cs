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

public partial class Admin_Taichinh_chitietluongthang : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
    
       
        
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    private void LoadGridView()
    {
        try
        {
            SqlParameter[] param = new SqlParameter[] { 
        dtsv.CreateParameter("@THANG",ddlThang.SelectedValue),
        dtsv.CreateParameter("@NAM",ddlNam.SelectedValue),
        dtsv.CreateParameter("@IDTHONGTIN",0),
         dtsv.CreateParameter("@OK",0),
        };

        dtsv.LoadGridView(GridView1, "SP_ChiTietLuongThang", param);
        }
        catch (Exception)
        {
            
            throw;
        }
     

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
}
