using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

namespace UNI.Class
{
	/// <summary>
	/// Summary description for connectClass.
	/// </summary>
	public class getDataGridClass
	{
		public getDataGridClass()
		{
			//
			// TODO: Add constructor logic here
			//
		}

//------------------------------------------------------------------------------
// Store Procedure không có tham số
		public static DataGrid getDataGrid(string strConnect, string storeProcName)
		{
			storeProcName = "[" + storeProcName + "]";

			SqlConnection sqlConnection = new SqlConnection(strConnect);
			SqlCommand selectLink = new SqlCommand(storeProcName, sqlConnection);
			selectLink.CommandType = CommandType.StoredProcedure;
			SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(selectLink);
			DataSet dataSet = new DataSet();
			DataGrid dataGrid = new DataGrid();
			try
			{
				sqlConnection.Open();
				sqlDataAdapter.Fill(dataSet);
				dataGrid.DataSource = dataSet;
				dataGrid.DataBind();
			}
			
			finally
			{
				sqlConnection.Close();
			}

			return dataGrid;
		}

//------------------------------------------------------------------------------
// Store Procedure có tham số kiểu NVarChar
		public static DataGrid getDataGrid(string strConnect,
			string storeProcName, string[] paramName, string[] values)
		{
			storeProcName = "[" + storeProcName + "]";

			SqlConnection sqlConnection = new SqlConnection(strConnect);
			SqlCommand selectLink = new SqlCommand(storeProcName, sqlConnection);
			selectLink.CommandType = CommandType.StoredProcedure;

			for(byte b = 0; b < paramName.Length; b++)
			{
				selectLink.Parameters.Add(new SqlParameter(paramName[b]				, SqlDbType.NVarChar)).Value = values[b];
			}

			SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(selectLink);
			DataSet dataSet = new DataSet();
			DataGrid dataGrid = new DataGrid();
			try
			{
				sqlConnection.Open();
				sqlDataAdapter.Fill(dataSet);
				dataGrid.DataSource = dataSet;
				dataGrid.DataBind();
			}
			
			finally
			{
				sqlConnection.Close();
			}

			return dataGrid;
		}

//------------------------------------------------------------------------------
// Store Procedure có tham số kiểu Int
		public static DataGrid getDataGrid(string strConnect,
			string storeProcName, string[] paramName, int[] values)
		{
			storeProcName = "[" + storeProcName + "]";

			SqlConnection sqlConnection = new SqlConnection(strConnect);
			SqlCommand selectLink = new SqlCommand(storeProcName, sqlConnection);
			selectLink.CommandType = CommandType.StoredProcedure;

			for(byte b = 0; b < paramName.Length; b++)
			{
				selectLink.Parameters.Add(new SqlParameter(paramName[b]				, SqlDbType.Int)).Value = values[b];
			}

			SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(selectLink);
			DataSet dataSet = new DataSet();
			DataGrid dataGrid = new DataGrid();
			try
			{
				sqlConnection.Open();
				sqlDataAdapter.Fill(dataSet);
				dataGrid.DataSource = dataSet;
				dataGrid.DataBind();
			}
			
			finally
			{
				sqlConnection.Close();
			}

			return dataGrid;
		}

//------------------------------------------------------------------------------
// Store Procedure có tham số kiểu Int, kiểu NVarChar
		public static DataGrid getDataGrid(string strConnect,
			string storeProcName, string[] paramNameInt, int[] valueInt			, string[] paramNameNVarChar, string[] valueNVarChar)
		{
			storeProcName = "[" + storeProcName + "]";

			SqlConnection sqlConnection = new SqlConnection(strConnect);
			SqlCommand selectLink = new SqlCommand(storeProcName,				sqlConnection);
			selectLink.CommandType = CommandType.StoredProcedure;

			for(byte b = 0; b < paramNameInt.Length; b++)
			{
				selectLink.Parameters.Add(new SqlParameter(paramNameInt				[b], SqlDbType.Int)).Value = valueInt[b];
			}

			for(byte b = 0; b < paramNameNVarChar.Length; b++)
			{
				selectLink.Parameters.Add(new SqlParameter(paramNameNVarChar[b], SqlDbType.NVarChar)).Value = valueNVarChar[b];
			}

			SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(selectLink);
			DataSet dataSet = new DataSet();
			DataGrid dataGrid = new DataGrid();
			try
			{
				sqlConnection.Open();
				sqlDataAdapter.Fill(dataSet);
				dataGrid.DataSource = dataSet;
				dataGrid.DataBind();
			}
			
			finally
			{
				sqlConnection.Close();
			}

			return dataGrid;
		}
	}
}
