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

public partial class Admin_Taichinh_khoitaoluong : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    DataSet ds ;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           LoadGridView();
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
     
        try
        {
            int tb = 0;
            SqlParameter[] param = new SqlParameter[] {
        dtsv.CreateParameter("@IDTHANG",int.Parse(ddlThang.SelectedValue)),
        dtsv.CreateParameter("@IDNAM",int.Parse(ddlNam.SelectedValue)),
        dtsv.CreateParameter("@PHUCAPGD",float.Parse(txtphucapgd.Text)),
        dtsv.CreateParameter("@LUONGTANGTHEM",decimal .Parse(txtDonGiaTangThem.Text)),
        dtsv.CreateParameter("@BHYT",float.Parse(txtBhyt.Text)),
        dtsv.CreateParameter("@BHXH",float.Parse(txtbhxh.Text)),
        dtsv.CreateParameter("@BHTN",float.Parse(txtbhtn.Text)),
        dtsv.CreateParameter("@LUONGCOBAN",decimal .Parse(txtluongcoban.Text))

        };
           
             tb = dtsv.ExecuteNonQuery("tblTaoLuong_set", param);
             if (tb > 0)
             {
                 ThemLuongThang();

             }
           
        }
        catch 
        {

            lblThongBao.Text = "Không thành công";
        }
       LoadGridView();
    }
    private void LoadGridView()
    {
        dtsv.LoadGridView(GridView1, "tblTaoLuong_GetALL");
    }

    protected void lblXoa_Click(object sender, EventArgs e)
    {
        lblThongBao.Text = "";
        int tb = 0;

        try
        {
            LinkButton lbt = (LinkButton)sender;
            Label lbl = (Label)lbt.Parent.FindControl("ID");
            int ID = int.Parse(lbl.Text);          
            SqlParameter param = new SqlParameter("@ID", ID);
            tb = dtsv.ExecuteNonQuery("tblTaoLuong_Del_ID", param);
            if (tb <= 0)
                lblThongBao.Text = "Xóa không thành công";
            else lblThongBao.Text = "Xóa thành công";           


        }
        catch 
        {
            lblThongBao.Text = "Xóa không thành công";
        }
        LoadGridView();
    }
    protected void lbtXem_Click(object sender, EventArgs e)
    {

       
     

        try
        {
            LinkButton lbt = (LinkButton)sender;
            Label lbl = (Label)lbt.Parent.FindControl("ID");
            int ID = int.Parse(lbl.Text);
            Session["IDLuong"] = ID; 
            SqlParameter param = new SqlParameter("@ID", ID);
            DataTable  dt= dtsv.ExcuteDataset("tbltaoluong_get_id", param).Tables[0];
            if (dt.Rows.Count != 0)
            {
                txtphucapgd.Text = dt.Rows[0]["PHUCAPGD"].ToString();
                txtDonGiaTangThem.Text = dt.Rows[0]["LUONGTANGTHEM"].ToString();
                txtluongcoban.Text = dt.Rows[0]["LUONGCOBAN"].ToString();
                txtBhyt.Text = dt.Rows[0]["BHYT"].ToString();
                txtbhxh.Text = dt.Rows[0]["BHXH"].ToString();
                txtbhtn.Text = dt.Rows[0]["BHTN"].ToString();
            }
          

        }
        catch 
        {
            lblThongBao.Text = "Server quá tải ! Xin quay lại sau";
        }
       

    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        int tb = 0;
        SqlParameter[] param = new SqlParameter[] {
        dtsv.CreateParameter("@IDTHANG",int.Parse(ddlThang.SelectedValue)),
        dtsv.CreateParameter("@IDNAM",int.Parse(ddlNam.SelectedValue)),
        dtsv.CreateParameter("@PHUCAPGD",int.Parse(txtphucapgd.Text)),
        dtsv.CreateParameter("@LUONGTANGTHEM",decimal .Parse(txtDonGiaTangThem.Text)),
        dtsv.CreateParameter("@BHYT",float.Parse(txtBhyt.Text)),
        dtsv.CreateParameter("@BHXH",float.Parse(txtbhxh.Text)),
        dtsv.CreateParameter("@BHTN",float.Parse(txtbhtn.Text)),
        dtsv.CreateParameter("@LUONGCOBAN",decimal .Parse(txtluongcoban.Text)),
        dtsv.CreateParameter("@ID",int.Parse(Session["IDLuong"].ToString()))

        };
        try
        {

            tb = dtsv.ExecuteNonQuery("tblTaoLuong_update_id", param);
            if (tb <= 0)
                lblThongBao.Text = "Không thành công";
            else lblThongBao.Text = "Thành công";
        }
        catch
        {

            lblThongBao.Text = "Không thành công";
        }
        LoadGridView();
    }
    private void ThemLuongThang()
    {

        try
        {
            int IDLUONG = getIDLuong();
            ds = dtsv.ExcuteDataset("THONGTIN_get_ID");
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                int IDTHONGTIN = (int)item["IDTHONGTIN"];
                SqlParameter[] param = new SqlParameter[]
            {
                dtsv.CreateParameter("@ID",IDTHONGTIN),
                dtsv.CreateParameter("@IDLUONG",IDLUONG)

            };
         
                dtsv.ExecuteNonQuery("tblChiTietLuong_set_id", param);
            

            }
        }
        catch {
            lblThongBao.Text = "Không thành công";
        }
    }
    private int getIDLuong()
    {
        return int.Parse(dtsv.ExcuteScalary("tblTaoLuong_getID").ToString());
    }
    
}
