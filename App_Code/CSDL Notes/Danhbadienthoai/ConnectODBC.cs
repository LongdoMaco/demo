namespace TUNinhThuan
{
using System;
using System.Data;
using System.Data.Odbc;



	/// <summary>
	/// Summary description for ConnectODBC.
	/// </summary>
	public class ConnectODBC
	{
		//this method create a connection and return a odbcconnect is opened
		public static OdbcConnection CreateConnect(string DSNName)
		{
			OdbcConnection con = new OdbcConnection(DSNName);
			con.Open();
			return con;
		} 
		
		//
		public static OdbcCommand CreateCommand(string commandText,OdbcConnection con)
		{
			OdbcCommand com = new OdbcCommand(commandText,con);
			com.CommandType = CommandType.Text;
			if(com.Connection.State==ConnectionState.Closed )
				com.Connection.Open();
			return com;
		}

		public static OdbcCommand CreateCommand(string commandText,string DSNName)
		{
			OdbcConnection con ;
			con = CreateConnect(DSNName);
			OdbcCommand com = new OdbcCommand(commandText,con);
			com.CommandType = CommandType.Text;
			if(com.Connection.State==ConnectionState.Closed )
				com.Connection.Open();
			return com;
		}

		//
		public static DataSet FillDataSet(OdbcCommand com)
		{
			OdbcDataAdapter da = new OdbcDataAdapter(com);
			DataSet  ds = new DataSet();
			try
			{
				da.Fill(ds);
			}
			catch(Exception ex)
			{
			}
			com.Connection.Close();
			return ds;
		}

		public static DataSet FillDataSet(string commandText,string DSNName)
		{
			OdbcConnection con ;
			con = CreateConnect(DSNName);
			DataSet  ds = new DataSet();
			OdbcCommand com = new OdbcCommand(commandText,con);
			com.CommandType = CommandType.Text;
			OdbcDataAdapter da = new OdbcDataAdapter(com);
			try
			{
				da.Fill(ds);
			}
			catch(Exception ex)
			{
			}
			com.Connection.Close();
			return ds;
		}

		public static OdbcDataReader FillDataReader(string sql,string NameDSN)
		{
			OdbcDataReader reader = null;
			OdbcCommand com = CreateCommand(sql,NameDSN);
			try
			{
				reader = com.ExecuteReader();
			}
			catch(Exception ex)
			{
			}
			com.Connection.Close();
			return reader;
		}

		public static OdbcDataReader FillDataReader(OdbcCommand com)
		{
			OdbcDataReader reader = null;
			try
			{
				reader = com.ExecuteReader();
			}
			catch(Exception ex)
			{
			}
			com.Connection.Close();
			return reader;
		}
	}
}
