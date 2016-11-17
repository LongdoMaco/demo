using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using UNI.Class;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using DAL;

public partial class Default2 : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
       Session.RemoveAll();
    }
    protected void btLogin_Click(object sender, EventArgs e)
    {
        if (txtMatkhau.Text == "" || txtTaikhoan.Text == "")
        {
            labelMessag.Text = "Không được để trống tên đăng nhập hoặc mật khẩu";
            return;
        }
        string username = DAL.Security.EncryptData(txtTaikhoan.Text);
        string password = DAL.Security.EncryptData(txtMatkhau.Text);
        SqlParameter[] param = new SqlParameter[]
            {
                dtsv.CreateParameter("@User",username),
                dtsv.CreateParameter("@Pass",password),
                dtsv.CreateParameter("@trangthai",0),
                dtsv.CreateParameter("@nguoisudungid",0),
                dtsv.CreateParameter("@checkadmin",0)
            };
        param[2].Direction = ParameterDirection.Output;
        param[3].Direction = ParameterDirection.Output;
        param[4].Direction = ParameterDirection.Output;
        DataTable dt = dtsv.ExcuteTable("Logon", param);
        // Kiem tra neu neu tai khoan bi khoa

        if (param[3].Value.ToString() == "")
        {
            labelMessag.Text = "Tên đăng nhập hoặc mật khẩu sai";
            return;
        }
        if (param[2].Value.ToString() == "" || param[2].Value.ToString() == "0")
        {
            labelMessag.Text = "Tài khoản của bạn đã bị khóa.Liên hệ với admin để được lấy lại";
            // return;
        }
            // Kiem tra co sai mat khau hay ten dang nhap
            Session["nguoisudung_ID"]= param[3].Value.ToString();
        if (param[4].Value.ToString() != "")
            Response.Redirect("~/Admin/");
            Response.Redirect("~/user");
    }
}
