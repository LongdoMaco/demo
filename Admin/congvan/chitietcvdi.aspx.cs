using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data;

public partial class Admin_congvan_chitietcvdi : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["IDDI"] == null)
            Response.Redirect("~/cvdi.aspx");
        if (!IsPostBack)
        {
            BindData(int.Parse(Request.QueryString["IDDI"].ToString()));

        }

    }
    private void BindData(int ID)
    {

        DataSet temp;
        temp = dtsv.ExcuteDataset("GetCongvandiTheoID", dtsv.CreateParameter("@Congvan_ID", ID));
        if (temp.Tables[0].Rows.Count != 0)
        {
            //for (int i = 0; i < temp.Tables[0].Rows.Count; i++)
            //    {
            DataList datalist1 = new DataList();
            lblMaCV.Text = temp.Tables[0].Rows[0]["MaCongvandi"].ToString();
            lblNgayden.Text = temp.Tables[0].Rows[0]["dingay"].ToString();
            lblSoKyhieu.Text = temp.Tables[0].Rows[0]["SoKyhieu"].ToString();
            lblLoai.Text = temp.Tables[0].Rows[0]["Tenloai"].ToString();
            lblCoquan.Text = temp.Tables[0].Rows[0]["TenBophan"].ToString();
            lblNgaybanhanh.Text = temp.Tables[0].Rows[0]["banhanhngay"].ToString();
            lblTrichyeu.Text = temp.Tables[0].Rows[0]["Trichyeunoidung"].ToString();
            lblSoluu.Text = temp.Tables[0].Rows[0]["Nguoiky"].ToString();
            lblNoinhan.Text = temp.Tables[0].Rows[0]["Noinhan"].ToString();
            //lblNoiluu.Text = temp.Tables[0].Rows[0]["Noiluu"].ToString();
            //linkFileupload.Text = temp.Tables[0].Rows[0]["Fileupload"].ToString();
            //HyperLink noidung = new HyperLink();
            //noidung.Text = temp.Tables[0].Rows[0]["Fileupload"].ToString();
            //HyperLink1.NavigateUrl = @"../Congvandi/Congvandi/" + temp.Tables[0].Rows[0]["Fileupload"].ToString();
            Session["oldfileupload"] = temp.Tables[0].Rows[0]["Fileupload"].ToString();
            //    Session["userID"]= temp.Tables[0].Rows[0]["NguoiSuDungID"].ToString();            
            if (!Session["oldfileupload"].ToString().Equals(""))
            {
                //Image1.Visible = true;               
                HyperLink5.Text = "Nội dung file - Click để tải về ";
                HyperLink5.NavigateUrl = @"~\Files\Congvan\congvandi\" + temp.Tables[0].Rows[0]["Fileupload"].ToString();
                //filename.Value = @"congvanden\congvanden\"+Session["oldfileupload"].ToString();
                //    Label28.Visible = false;
            }
            else
            {
                HyperLink5.Text = "";
                HyperLink5.Visible = false;
                //   Label28.Visible = true;
                //   CheckBox3.Visible = false;
            }

            lblNgaynhap.Text = "Ngày nhập: " + "(" + temp.Tables[0].Rows[0]["Ngaynhap"].ToString() + ")";
        }

        //}
        else
            ; //Label11.Text = "BẠN HÃY QUAN LẠI TRANG TRƯỚC ĐỂ CHỌN NỘI DUNG";
        //HyperLink1.NavigateUrl = @"";
        //HyperLink1.Text = "Về trang trước"

    }
}
