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

public partial class user_xemcongvan : System.Web.UI.Page
{
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["nguoisudung_ID"] == null)
            Response.Redirect("~/DangNhap.aspx");
        if (!IsPostBack)
        {
            BindDataGrid();
        }

    }
    private void BindDataGrid()
    {
        int manguoidung = Convert.ToInt32(Session["nguoisudung_ID"].ToString());
        SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "GetCongvandenchuaxem");
        //sql_com.Parameters.Add(new SqlParameter("@Loai_ID",SqlDbType.TinyInt)).Value = Convert.ToByte(dlChuyende.SelectedValue);
        sql_com.Parameters.Add(new SqlParameter("@nguoisudung_ID", SqlDbType.Int)).Value = manguoidung;

        ds = ConnectSQL.FillDataSet(sql_com);
        BindData();
    }
    private void BindData()
    {
        DataGrid1.DataSource = ds.Tables[0].DefaultView;
        DataGrid1.DataBind();
    }
    private void DataGrid1_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
    {
        int index = e.Item.ItemIndex;
        if (e.CommandName.Equals("Detail"))
        {
            int ND = Convert.ToInt32(Session["nguoisudung_ID"].ToString());
            Label ID = (Label)DataGrid1.Items[index].FindControl("ID");
            Session["Congvan_ID"] = ID.Text;
            SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "UpdateCV_ND");
            sql_com.Parameters.Add(new SqlParameter("@Congvan_ID", SqlDbType.Int)).Value = Convert.ToInt32(ID.Text);// .ToByte(dlChuyende.SelectedValue);
            sql_com.Parameters.Add(new SqlParameter("@nguoisudung_ID", SqlDbType.Int)).Value = ND;// .ToByte(dlChuyende.SelectedValue);
            //ds = ConnectSQL.FillDataSet(sql_com);
            sql_com.ExecuteNonQuery();
            Response.Redirect("Chitietcongvan.aspx");
        }

    }
}
