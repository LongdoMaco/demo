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
          InitData();
				InitData2();
				InitData3();
        }

    }
    private void InitData()
		{
            SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "GetAllLoaicongvanden");		
			ds = ConnectSQL.FillDataSet(sql_com);
			dlChuyende.DataSource = ds.Tables[0].DefaultView;
			dlChuyende.DataTextField = "TenLoaicv";
			dlChuyende.DataValueField = "ID";
			dlChuyende.DataBind();
			if(dlChuyende.Items.Count==0)
			{
				Label4.Visible = true;
				//Button1.Visible = false;
				//Button2.Visible = false;
				//dlChuyende.Visible = false;
				//Label3.Visible = false;
			}
			else 
				BindDataGridAll();
                //BindDataGrid2();
		}
		private void BindDataGridAll()
		{
            int manguoidung = Convert.ToInt32(Session["nguoisudung_ID"].ToString());
            SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "GetAllcongvanden");					
            sql_com.Parameters.Add(new SqlParameter("@nguoisudung_ID", SqlDbType.Int)).Value = manguoidung;
            ds = ConnectSQL.FillDataSet(sql_com);
			BindData();
		}	
		private void InitData2()
        {
            SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "GetAllCoquanbanhanh");
            ds = ConnectSQL.FillDataSet(sql_com);
            dlCoquanbanhanh.DataSource = ds.Tables[0].DefaultView;
            dlCoquanbanhanh.DataTextField = "Tencoquanbanhanh";
            dlCoquanbanhanh.DataValueField = "ID";
            dlCoquanbanhanh.DataBind();            
        }
        private void InitData3()
		{
            SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "GetAllMacongvanden");		
			ds = ConnectSQL.FillDataSet(sql_com);
			dlMacv.DataSource = ds.Tables[0].DefaultView;
			dlMacv.DataTextField = "Tenmacongvan";
			dlMacv.DataValueField = "ID";
			dlMacv.DataBind();			
		}
		
		
		private void BindDataGrid2()
		{
			DataSet cq;
            int ID = Convert.ToInt32(Session["nguoisudung_ID"].ToString());
            SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "GetCongvandentheocqbh");		
			sql_com.Parameters.Add(new SqlParameter("@CQBH_ID",SqlDbType.TinyInt)).Value = Convert.ToByte(dlCoquanbanhanh.SelectedValue);
            sql_com.Parameters.Add(new SqlParameter("@nguoisudung_ID", SqlDbType.Int)).Value = ID;
            //ds = ConnectSQL.FillDataSet(sql_com);
			//BindData();
			cq = ConnectSQL.FillDataSet(sql_com);
			int counter = cq.Tables[0].Rows.Count;
            if (counter==0)
            {
                DataGridcq.Visible = false;
              
            }
            else
            {
                DataGrid1.Visible = false;
                DataGridcd.Visible = false;
                DataGridmcv.Visible = false;
                DataGridcq.Visible = true;                
                DataGridcq.DataSource = cq.Tables[0].DefaultView;
                DataGridcq.DataBind();
               
            }            
		}	
		
		private void BindDataGrid3()
		{
			DataSet mcv;
            int manguoidung = Convert.ToInt32(Session["nguoisudung_ID"].ToString());
            SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "GetCongvandentheomacongvanden");		
			sql_com.Parameters.Add(new SqlParameter("@Ma_ID",SqlDbType.TinyInt)).Value = Convert.ToByte(dlMacv.SelectedValue);
            sql_com.Parameters.Add(new SqlParameter("@nguoisudung_ID", SqlDbType.Int)).Value = manguoidung;
            //mcv = ConnectSQL.FillDataSet(sql_com);
			//BindData();
			mcv = ConnectSQL.FillDataSet(sql_com);
            int counter = mcv.Tables[0].Rows.Count;
            if (counter == 0)
            {
                DataGridmcv.Visible = false;
                
            }
            else
            {
                DataGrid1.Visible = false;
                DataGridcd.Visible = false;
                DataGridcq.Visible = false;
                DataGridmcv.Visible = true;
                DataGridmcv.DataSource = mcv.Tables[0].DefaultView;
                DataGridmcv.DataBind();
               
            }            
		}	
		
		private void BindData()
		{
			DataGrid1.DataSource = ds.Tables[0].DefaultView;
			DataGrid1.DataBind();            
		}
		
        private void BindDataGrid1()
        {
			DataSet cd;
            int manguoidung = Convert.ToInt32(Session["nguoisudung_ID"].ToString());
            SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "GetCongvandentheoLoaicongvan");// Moi them Thu tuc
            sql_com.Parameters.Add(new SqlParameter("@Loai_ID",SqlDbType.TinyInt)).Value = Convert.ToByte(dlChuyende.SelectedValue);
            sql_com.Parameters.Add(new SqlParameter("@nguoisudung_ID", SqlDbType.Int)).Value = manguoidung;
            //ds = ConnectSQL.FillDataSet(sql_com);
            //BindData();
            cd = ConnectSQL.FillDataSet(sql_com);
            int counter = cd.Tables[0].Rows.Count;
            if (counter == 0)
            {
                DataGridcd.Visible = false;
               
            }
            else
            {
                DataGrid1.Visible = false;
                DataGridcq.Visible = false;
                DataGridcd.Visible = true;
                DataGridcd.DataSource = cd.Tables[0].DefaultView;
                DataGridcd.DataBind();
              
            }            
        }
        //private void BindData2()
        //{
        //    DataGrid2.DataSource = ds.Tables[0].DefaultView;
        //    DataGrid2.DataBind();
        //}
		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.DataGrid1.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_ItemCommand);
			this.DataGrid1.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGrid1_PageIndexChanged);
			//Loai cong van
			this.DataGridcd.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGridcd_ItemCommand);
			this.DataGridcd.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGridcd_PageIndexChanged);

			//Co quan ban hanh
			this.DataGridcq.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGridcq_ItemCommand);
			this.DataGridcq.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGridcq_PageIndexChanged);
			//Ma Cong van 
			this.DataGridmcv.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGridmcv_ItemCommand);
			this.DataGridmcv.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGridmcv_PageIndexChanged);
		
		}
		#endregion

		private void DataGrid1_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{            
            int index = e.Item.ItemIndex;
			if(e.CommandName.Equals("Detail"))
			{
                int ND = Convert.ToInt32(Session["nguoisudung_ID"].ToString());
				Label ID = (Label)DataGrid1.Items[index].FindControl("ID");
				Session["Congvan_ID"]= ID.Text;	               
                //SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "UpdateCV_ND");
                //sql_com.Parameters.Add(new SqlParameter("@Congvan_ID", SqlDbType.TinyInt)).Value = Convert.ToInt32(ID.Text);// .ToByte(dlChuyende.SelectedValue);
                //sql_com.Parameters.Add(new SqlParameter("@nguoisudung_ID", SqlDbType.TinyInt)).Value = ND;// .ToByte(dlChuyende.SelectedValue);
                //ds = ConnectSQL.FillDataSet(sql_com);
                //sql_com.ExecuteNonQuery();
                Response.Redirect("chitietcongvanden.aspx");
			}
            
		}		
		// Loai cong van den
		private void DataGridcd_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{            
            int index = e.Item.ItemIndex;
			if(e.CommandName.Equals("Detail"))
			{
                int ND = Convert.ToInt32(Session["nguoisudung_ID"].ToString());
				Label ID = (Label)DataGridcd.Items[index].FindControl("ID");
				Session["Congvan_ID"]= ID.Text;	               
                //SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "UpdateCV_ND");
                //sql_com.Parameters.Add(new SqlParameter("@Congvan_ID", SqlDbType.TinyInt)).Value = Convert.ToInt32(ID.Text);// .ToByte(dlChuyende.SelectedValue);
                //sql_com.Parameters.Add(new SqlParameter("@nguoisudung_ID", SqlDbType.TinyInt)).Value = ND;// .ToByte(dlChuyende.SelectedValue);
                //ds = ConnectSQL.FillDataSet(sql_com);
                //sql_com.ExecuteNonQuery();
                Response.Redirect("chitietcongvanden.aspx");
			}
            
		}		
		//Co quan ban hanh
		private void DataGridcq_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{            
            int index = e.Item.ItemIndex;
			if(e.CommandName.Equals("Detail"))
			{
                int ND = Convert.ToInt32(Session["nguoisudung_ID"].ToString());
				Label ID = (Label)DataGridcq.Items[index].FindControl("ID");
				Session["Congvan_ID"]= ID.Text;	               
                //SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "UpdateCV_ND");
                //sql_com.Parameters.Add(new SqlParameter("@Congvan_ID", SqlDbType.TinyInt)).Value = Convert.ToInt32(ID.Text);// .ToByte(dlChuyende.SelectedValue);
                //sql_com.Parameters.Add(new SqlParameter("@nguoisudung_ID", SqlDbType.TinyInt)).Value = ND;// .ToByte(dlChuyende.SelectedValue);
                //ds = ConnectSQL.FillDataSet(sql_com);
                //sql_com.ExecuteNonQuery();
                Response.Redirect("Chitietcongvan.aspx");
			}
            
		}
		//MaC cong van
		
		private void DataGridmcv_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{            
            int index = e.Item.ItemIndex;
			if(e.CommandName.Equals("Detail"))
			{
                int ND = Convert.ToInt32(Session["nguoisudung_ID"].ToString());
				Label ID = (Label)DataGridmcv.Items[index].FindControl("ID");
				Session["Congvan_ID"]= ID.Text;	               
                //SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "UpdateCV_ND");
                //sql_com.Parameters.Add(new SqlParameter("@Congvan_ID", SqlDbType.TinyInt)).Value = Convert.ToInt32(ID.Text);// .ToByte(dlChuyende.SelectedValue);
                //sql_com.Parameters.Add(new SqlParameter("@nguoisudung_ID", SqlDbType.TinyInt)).Value = ND;// .ToByte(dlChuyende.SelectedValue);
                //ds = ConnectSQL.FillDataSet(sql_com);
                //sql_com.ExecuteNonQuery();
                Response.Redirect("Chitietcongvan.aspx");
			}
            
		}			
        private void xacthuc()
        {
            
        }

		protected void Button2_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("NhapTin.aspx");
		}
		
		private void DataGrid1_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			DataGrid1.CurrentPageIndex = e.NewPageIndex;
			BindDataGridAll();
		}
		//Loai cong van den
		private void DataGridcd_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			DataGridcd.CurrentPageIndex = e.NewPageIndex;
			BindDataGrid1();
		}
		// CO qun han hanh
		private void DataGridcq_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			DataGridcq.CurrentPageIndex = e.NewPageIndex;
			BindDataGrid2();
		}
		private void DataGridmcv_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			DataGridmcv.CurrentPageIndex = e.NewPageIndex;
			BindDataGrid3();
		}
		protected void lkExit_Click(object sender, System.EventArgs e)
		{
			Session.RemoveAll();
			Response.Redirect("../DangNhap.aspx");
		}
		// Loai cong van den
		protected void dlChuyende_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			BindDataGrid1();			
		}
		protected void dlCoquanbanhanh_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindDataGrid2();
            //createSubMenu();
        }
		 protected void dlMacv_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindDataGrid3();     
            //createSubMenu();      
        }
		
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("../Dangnhap.aspx");
        }
        protected void btxemall_Click(object sender, EventArgs e)
        {
            string nt = tungay.Text.Trim();
            string ngaytruoc = Convert.ToInt32(Mid(nt, 3, 2)) + "/" + Convert.ToInt32(Left(nt, 2)) + "/" + Convert.ToInt32(Right(nt, 4));
            string ns = denngay.Text.Trim();
            string ngaysau = Convert.ToInt32(Mid(ns, 3, 2)) + "/" + Convert.ToInt32(Left(ns, 2)) + "/" + Convert.ToInt32(Right(ns, 4));
            int manguoidung = Convert.ToInt32(Session["nguoisudung_ID"].ToString());
            SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "TimCongvandenUsertungaydenngay");
            //sql_com.Parameters.Add(new SqlParameter("@Loai_ID",SqlDbType.TinyInt)).Value = Convert.ToByte(dlChuyende.SelectedValue);
            sql_com.Parameters.Add(new SqlParameter("@nguoisudung_ID", SqlDbType.Int)).Value = manguoidung;
            sql_com.Parameters.Add(new SqlParameter("@Tungay", SqlDbType.NVarChar)).Value = ngaytruoc;// tungay.Text.Trim();
            sql_com.Parameters.Add(new SqlParameter("@Denngay", SqlDbType.NVarChar)).Value = ngaysau;// denngay.Text.Trim();
            ds = ConnectSQL.FillDataSet(sql_com);
            BindData();
        }
        protected void butXem_Click(object sender, EventArgs e)
        {
            BindDataGridAll();
        }
        protected void btThoat_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("../Dangnhap.aspx");
        }
        public static string Left(string param, int length)
        {
            //we start at 0 since we want to get the characters starting from the
            //left and with the specified lenght and assign it to a variable
            string result = param.Substring(0, length);
            //return the result of the operation
            return result;
        }
        public static string Right(string param, int length)
        {
            //start at the index based on the lenght of the sting minus
            //the specified lenght and assign it a variable
            string result = param.Substring(param.Length - length, length);
            //return the result of the operation
            return result;
        }

        public static string Mid(string param, int startIndex, int length)
        {
            //start at the specified index in the string ang get N number of
            //characters depending on the lenght and assign it to a variable
            string result = param.Substring(startIndex, length);
            //return the result of the operation
            return result;
        }

        public static string Mid(string param, int startIndex)
        {
            //start at the specified index and return all characters after it
            //and assign it to a variable
            string result = param.Substring(startIndex);
            //return the result of the operation
            return result;
        }
}

