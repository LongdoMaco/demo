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
using UNI.Class;
using DAL;
namespace user.congvan
{
    public partial class user_chitietcongvan : System.Web.UI.Page
    {
      
   
        int Congvan_ID;
      
    
        SqlCommand sql_com;
        DataServices dtsv = new DataServices();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nguoisudung_ID"] == null)
                Response.Redirect("~/DangNhap.aspx");
         
            if (!IsPostBack)
            {
                if (PhanQuyen.XacNhanGroup(int.Parse(Session["nguoisudung_ID"].ToString()), 3))
                {
                    LoadGridView();
                    Button2.Visible = true;
                }
                BindData();
            }

        }
        private void BindData()
        {

            DataSet temp;
            //int ID = Convert.ToInt32(Session["nguoisudung_ID"].ToString());
            Congvan_ID = Convert.ToInt32(Session["Congvan_ID"].ToString());
            sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "GetCongvandiTheoID");
            sql_com.Parameters.Add(new SqlParameter("@Congvan_ID", SqlDbType.Int)).Value = Congvan_ID;
            //sql_com.Parameters.Add(new SqlParameter("@nguoisudung_ID", SqlDbType.Int)).Value = ID;
            temp = ConnectSQL.FillDataSet(sql_com);
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
                Label11.Text = "BẠN HÃY QUAN LẠI TRANG TRƯỚC ĐỂ CHỌN NỘI DUNG";
            //HyperLink1.NavigateUrl = @"";
            //HyperLink1.Text = "Về trang trước"

        }
        private void LoadGridView()
        {
            //DAL.DataServices dtsv = new DAL.DataServices();
            dtsv.LoadGridView(GridView1,"NguoiSuDung_GoiCongVan",dtsv.CreateParameter("@NguoiSuDungID",int.Parse(Session["nguoisudung_ID"].ToString())));

        }

        protected void cbheader_CheckedChanged(object sender, EventArgs e)
        {

            CheckBox cbhead = (CheckBox)GridView1.HeaderRow.FindControl("cbheader");
            if (cbhead.Checked == true)
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
        protected void Button2_Click(object sender, EventArgs e)
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
                        SqlParameter[] param = new SqlParameter[]
                           {
                               dtsv.CreateParameter("@MaCongvandi",int.Parse(Session["Congvan_ID"].ToString())),
                               dtsv.CreateParameter("@MaNguoisudung",ID)
                           };

                        tb = dtsv.ExecuteNonQuery("InsertUsert_cvdi", param);


                    }

                }
                if (tb > 0)
                    Label14.Text = " Thanh Cong";
                else Label14.Text = "Không Thành Công";


            }
            catch 
            {
                Label14.Text = " Không Thành Công";
            }
        }
}
}
