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
using System.Text.RegularExpressions;

public partial class user_changepass : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["nguoisudung_ID"] == null)
            Response.Redirect("~/Dangnhap.aspx");
        if (!IsPostBack)
        {
            if (Session["nguoisudung_ID"] == null)
                Response.Redirect("~/Dangnhap.aspx");
            LoadUserName();
           
        }
    }
    protected void ChangePasswordPushButton_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if ((txtmoi.Text != txtnhaplai.Text) || txtmoi.Text == "")
        {
            lbltb.Text = "Mật Khẩu Không Giống Nhau";
            goto Thoat;
        }
        int tb = 0;
        try
        {
            SqlParameter[] param = new SqlParameter[]
        {
            dtsv.CreateParameter("@MATKHAUCU",DAL.Security.EncryptData(txthientai.Text)),
            dtsv.CreateParameter("@MATKHAUMOI",DAL.Security.EncryptData(txtmoi.Text)),
            dtsv.CreateParameter("@ID",int.Parse(Session["nguoisudung_ID"].ToString())),
            dtsv.CreateParameter("@total",0)
           
        };
            param[3].Direction = ParameterDirection.Output;
            tb = dtsv.ExecuteNonQuery("user_change", param);
                    if (tb > 0)
                    lbltb.Text = "đổi thành công";
                else lbltb.Text = "đổi không thành công";
            if (int.Parse(param[3].Value.ToString()) == 0)
                lbltb.Text = "Mật Khẩu Hiện Tại Không Đúng";
              

        }
           
        catch
        {
            lbltb.Text = "đổi không thành công";
 
        }
    Thoat: lbltb.Text.ToString();

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int tb = 0;
        //Regex check = new Regex("(?<user>[^@]+)@(?<host>.+)");
        //Match m = check.Match(txtemail.Text);
        if (txtdangnhap.Text == "")
        {
            lbltbdn.Text = "Tên đăng nhập không được rỗng";


        }
        else
        {
            try
            {
                SqlParameter[] param = new SqlParameter[] 
            {
                dtsv.CreateParameter("@UserName",DAL.Security.EncryptData(txtdangnhap.Text)),             
                dtsv.CreateParameter("@ID",int.Parse(Session["nguoisudung_ID"].ToString())),
                dtsv.CreateParameter("@CheckUser",0),
               
            };
                param[2].Direction = ParameterDirection.Output;
              
                tb = dtsv.ExecuteNonQuery("user_change_username", param);
                if (tb > 0)
                    lbltbdn.Text = "Thành Công";
                else lbltbdn.Text = "Không Thành Công";             
                if(int.Parse(param[2].Value.ToString())>0)
                    lbltbdn.Text="Tên Đăng Nhập Đã Tồn Tại !";
            }
                
            catch
            {
                lbltbdn.Text = "Thay đổi không thành công";
            }
            
 
        }

        
    }
    protected void LoadUserName()
    {
     
        try
        {
            DataTable dt = dtsv.ExcuteTable("user_get_name", dtsv.CreateParameter("@ID", int.Parse(Session["nguoisudung_ID"].ToString())));

            if(dt.Rows.Count!=0)
            {
                txtdangnhap.Text = DAL.Security.DecryptData(dt.Rows[0]["TENDANGNHAP"].ToString());
              
            }

        }
        catch
        {
            lbltbdn.Text="Chưa tồn tại nhân viên ";
        }

    }

    protected void Button3_Click(object sender, EventArgs e)
    {

        int tb = 0;
        Regex check = new Regex("(?<user>[^@]+)@(?<host>.+)");
        Match m = check.Match(txtemail.Text);
        if (!m.Success)
        {
            lbltbdn.Text = "Email sai định dạng ";
            return;
        }
        SqlParameter[] param = new SqlParameter[]
        {
            dtsv.CreateParameter("@id",int.Parse(Session["nguoisudung_ID"].ToString())),
            dtsv.CreateParameter("@email",txtemail.Text),
            dtsv.CreateParameter("@check",0)
        };
        param[2].Direction = ParameterDirection.Output;
       
        tb=dtsv.ExecuteNonQuery("user_changemail", param);
       if( int.Parse(param[2].Value.ToString())!=0)
        {
            lbltbdn.Text="Email này đã tồn tại ! vui lòng nhâp email khác";
            return;
        }
       lbltbdn.Text = "Cập nhật thành công";
    


    }
}
