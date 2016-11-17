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
public partial class Admin_tintuc_quantrinoidung : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["nguoisudung_ID"] == null)
            Response.Redirect("~/Dangnhap.aspx");
        if (!IsPostBack)
        {
            loadgrivew();
          
            LoadChuyenDe();
        }
    }
    protected void cbheader_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox checkhead = (CheckBox)GridView1.HeaderRow.FindControl("cbheader");
        if (checkhead.Checked)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox item = (CheckBox)GridView1.Rows[i].FindControl("cbitem");
                item.Checked = true;

            }
        }
        else
        {

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox item = (CheckBox)GridView1.Rows[i].FindControl("cbitem");
                item.Checked = false;

            }
        }
    }
    private void loadgrivew()
    {
        dtsv.LoadGridView(GridView1, "tt_get_all_user", dtsv.CreateParameter("@IDUSER", int.Parse(Session["nguoisudung_ID"].ToString())));
    }
    protected void btlEidt_Click(object sender, EventArgs e)
    {
       btnthongbao.Text = "";
     

        try
        {
            LinkButton lbt = (LinkButton)sender;
            Label lbl = (Label)lbt.Parent.FindControl("ID");
            int ID = int.Parse(lbl.Text);
            Session["BanTin_ID"] = ID;
            //GetTen();
            SqlParameter param = new SqlParameter("@BanTinID", ID);
            DataTable dt = dtsv.ExcuteTable("tt_get_chitiet", param);

            if (dt.Rows.Count != 0)
            {

                txtTieuDe.Text = dt.Rows[0]["TIEUDE"].ToString();
                txttrichdan.Text = dt.Rows[0]["TrichDan"].ToString();
                txtNoidung.Text = dt.Rows[0]["NoiDung"].ToString();
                txttacgia.Text = dt.Rows[0]["TacGia"].ToString();
                NgayBanTin.Text = dt.Rows[0]["NgayBanTin"].ToString();
                txtNguonTin.Text= dt.Rows[0]["NguonTin"].ToString();
                txtNguonTin.Text= dt.Rows[0]["TuKhoa"].ToString();
                ddlchuyende.SelectedValue = dt.Rows[0]["ChuyenDeID"].ToString();
               

                
                
                


            }
            else
            {
                btnthongbao.Text = "Không Thể Edit Được";

            }

        }
        catch (Exception ex)
        {
            btnthongbao.Text = ex.Message.ToString();
        }
    }
    private void LoadChuyenDe()
    {
        dtsv.LoadDropDownList(ddlchuyende, "tt_get_cd", "TenChuyenDe", "ChuyenDeID");
    }
  
    protected void bntCapNhat_Click(object sender, EventArgs e)
    {
        int tb = 0;

        try
        {

            if (txtTieuDe.Text == "")
                Label1.Text = "Hãy Nhập Tiêu Đề";
            else
            {
                string tenfilethat = "";
                string dd = Server.MapPath("~/Image/imagetintuc/");//Admin\tintuc\hinhanh\
                if (FileUpload1.HasFile)
                {
                    tenfilethat = Guid.NewGuid().ToString() + "." + FileUpload1.PostedFile.FileName.Split('.')[1];
                    dd += "/" + tenfilethat;
                    FileUpload1.PostedFile.SaveAs(dd);
                }
                SqlParameter[] param = new SqlParameter[] 
                {
                    dtsv.CreateParameter("@TIEUDE",txtTieuDe.Text),
                    dtsv.CreateParameter("@TrichDan",txttrichdan.Text),
                    dtsv.CreateParameter("@NoiDung",txtNoidung.Text),
                    dtsv.CreateParameter("@TacGia",txttacgia.Text),
                    dtsv.CreateParameter("@NgayBanTin",NgayBanTin.Text),
                    dtsv.CreateParameter("@ChuyenDeID",ddlchuyende.SelectedValue),
                    dtsv.CreateParameter("@NguonTin",txtNguonTin.Text),
                    dtsv.CreateParameter("@TuKhoa",txttukhoa.Text),
                    dtsv.CreateParameter("@HinhAnh",tenfilethat),
                    //dtsv.CreateParameter("@NguoiSuDungID",int.Parse(Session["nguoisudung_ID"].ToString())),
                    dtsv.CreateParameter("@BanTinID",int.Parse(Session["BanTin_ID"].ToString()))

                };

                tb = dtsv.ExecuteNonQuery("tt_update", param);

                if (tb > 0)
                    Label1.Text = " Thành Công";
                else Label1.Text = "Không Thành Công";
            }
            loadgrivew();

        }
        catch 
        {
            Label1.Text = "Không Thành Công";
        }
    }
    protected void btnxoa_Click(object sender, EventArgs e)
    {

        int tb = 0;
        try
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox remove = (CheckBox)GridView1.Rows[i].FindControl("cbitem");

                if (remove.Checked)
                {
                    Label lb = (Label)GridView1.Rows[i].FindControl("ID");
                    int ID = int.Parse(lb.Text);
                    SqlParameter param = new SqlParameter("@BanTinID ", ID);

                    tb = dtsv.ExecuteNonQuery("tt_del_ID", param);


                }

            }
            if (tb > 0)
            {
                btnthongbao.Text = "Xóa Thành Công";

            }
            else btnthongbao.Text = "Không Thành Công";
        }
        catch (Exception ex)
        {
            btnthongbao.Text = ex.Message.ToString();
        }
        loadgrivew();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int tb = 0;
        try
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox remove = (CheckBox)GridView1.Rows[i].FindControl("cbitem");

                if (remove.Checked)
                {
                    Label lb = (Label)GridView1.Rows[i].FindControl("ID");
                    int ID = int.Parse(lb.Text);
                    SqlParameter param = new SqlParameter("@BanTinID ", ID);

                    tb = dtsv.ExecuteNonQuery("tt_del_ID", param);


                }

            }
            if (tb > 0)
            {
                btnthongbao.Text = "Xóa Thành Công";

            }
            else btnthongbao.Text = "Không Thành Công";
        }
        catch (Exception ex)
        {
            btnthongbao.Text = ex.Message.ToString();
        }
        loadgrivew();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        loadgrivew();
    }
}
