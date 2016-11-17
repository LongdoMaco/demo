using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace UNI.Class
{
	/// <summary>
	/// Summary description for ConnectSQL.
	/// </summary>
	public class ConnectSQL
	{
//		protected string SQL_CONNECT_STRING = ConfigurationSettings.AppSettings["ConnectString"];// "data source=(local);initial catalog=northwind;Trusted_Connection = true";

		public static SqlConnection CreateSQLConnect(string DatabaseName)
		{
//			string sql_string = SQL_CONNECT_STRING.Replace("northwind",DatabaseName);

            SqlConnection sql_con = new SqlConnection(ConfigurationManager.AppSettings["ConnectString"]);
			try{
				sql_con.Open();
			}
			catch(Exception ex){

			}
			return sql_con;
		}

		public static SqlCommand CreateSQLCommand(SqlConnection sql_con,string sql)
		{
			SqlCommand sql_com = new SqlCommand(sql,sql_con);
			sql_com.CommandType = CommandType.StoredProcedure;
			if(sql_com.Connection.State==ConnectionState.Closed) sql_com.Connection.Open();
			return sql_com;
		}

		public static SqlCommand CreateSQLCommand(string database,string sql){
			SqlConnection sql_con = CreateSQLConnect(database);
			SqlCommand sql_com = new SqlCommand(sql,sql_con);
			sql_com.CommandType = CommandType.StoredProcedure;
			return sql_com;
		}

		public static DataSet FillDataSet(SqlCommand sql_com){
			SqlDataAdapter da = new SqlDataAdapter(sql_com);
			if(sql_com.Connection.State==ConnectionState.Closed) sql_com.Connection.Open();
			DataSet ds = new DataSet();
			da.Fill(ds);
			sql_com.Connection.Close();
			return ds;
		}

	}
}
