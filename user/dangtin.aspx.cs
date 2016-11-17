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

public partial class Admin_tintuc_dangtin : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["nguoisudung_ID"] == null)
            Response.Redirect("~/Dangnhap.aspx");
        if (!IsPostBack)
        {
            LoadChuyenDe();
          
          
        }
    }
    protected void btnDang_Click(object sender, EventArgs e)
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
                    dtsv.CreateParameter("@NoiDung",txtNoidung.Value),
                    dtsv.CreateParameter("@TacGia",txttacgia.Text),
                    dtsv.CreateParameter("@NgayBanTin",NgayBanTin.Text),
                    dtsv.CreateParameter("@ChuyenDeID",ddlchuyende.SelectedValue),
                    dtsv.CreateParameter("@NguonTin",txtNguonTin.Text),
                    dtsv.CreateParameter("@TuKhoa",txtTuKhoa.Text),
                    dtsv.CreateParameter("@HinhAnh",tenfilethat),
                    dtsv.CreateParameter("@NguoiSuDungID",int.Parse(Session["nguoisudung_ID"].ToString()))

                };

                tb = dtsv.ExecuteNonQuery("tt_inser", param);

                if (tb > 0)
                    Label1.Text = "Đăng bài thành công ! chúng tôi đã sẻ kiểm duyệt và đăng tải ";
                else Label1.Text = "Đăng Không Thành Công";
            }

        }
        catch
        {
            Label1.Text = "Đăng Không Thành Công";
        }
    }
    private void LoadChuyenDe()
    {
        dtsv.LoadDropDownList(ddlchuyende, "tt_get_cd", "TenChuyenDe", "ChuyenDeID");
    }
  
   
}
