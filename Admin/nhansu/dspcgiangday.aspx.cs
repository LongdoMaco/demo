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

public partial class Admin_nhansu_dspcgiangday : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDonVi();
            LoadGridView();
        }
    }
    private void LoadDonVi()
    {  
    
        ddlDonVi.DataSource = dtsv.ExcuteTable("ns_getAll_donvi");
        ddlDonVi.DataTextField = "DONVI";
        ddlDonVi.DataValueField = "ID";
        ddlDonVi.DataBind();
        //if (ddlDonVi.Items.Count < 0)
        //    Label5.Text = "Chưa có đơn vị nào cả";
    
    }
    private void LoadGridView()
    {
        dtsv.LoadGridView(GridView1, "tblPhuCapGD_get", dtsv.CreateParameter("@IDDONVI", ddlDonVi.SelectedValue));      
    }
    protected void ddlDonVi_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadGridView();
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox cb = (CheckBox)sender;
        if (cb.Checked)
        {
            try
            {
                Label lbl = (Label)cb.Parent.FindControl("ID");
                int ID = int.Parse(lbl.Text);
                dtsv.ExecuteNonQuery("tblPhuCapGiangDay_set", dtsv.CreateParameter("@ID", ID));
            }
            catch
            {
                Label2.Text = "Không kích hoạt được";
            }
        }
        else
        {


            try
            {
                Label lbl = (Label)cb.Parent.FindControl("ID");
                int ID = int.Parse(lbl.Text);
                dtsv.ExecuteNonQuery("tblPhuCapGiangDay_del", dtsv.CreateParameter("@ID", ID));
            }
            catch
            {
                Label2.Text = "Không kích hoạt được";
            }
        }
    }
}
