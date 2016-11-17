using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using DAL;


public partial class Admin_nhansu_Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nguoisudung_ID"] == null)
                Response.Redirect("~/DangNhap.aspx");
            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            string[] MangTach = url.Split('/');
            if (!PhanQuyen.KiemTra(MangTach[MangTach.Length - 2].ToString(), int.Parse(Session["nguoisudung_ID"].ToString())))
            {
                Response.Redirect("~/public/UnauthorizedAccess.aspx");
            }

        }
    }

