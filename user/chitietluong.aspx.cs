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

public partial class user_chitietluong : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["nguoisudung_ID"]== null)
            Response.Redirect("~/DangNhap.aspx");
        if (!IsPostBack)
        {
 
        }

    }
    
   
    private void LoadGridView()
    {
        SqlParameter[] param = new SqlParameter[] { 
        dtsv.CreateParameter("@THANG",Convert.ToInt32(txtthang.Text)),
        dtsv.CreateParameter("@NAM",Convert.ToInt32(txtnam.Text)),
        dtsv.CreateParameter("@IDTHONGTIN",int.Parse(Session["nguoisudung_ID"].ToString())),
         dtsv.CreateParameter("@OK",1),
        };

        dtsv.LoadGridView(GridView1, "SP_ChiTietLuongThang", param);

    }
    protected void butxemluong_Click(object sender, EventArgs e)
    {
        LoadGridView();
    }
}
