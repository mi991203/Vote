using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MyWeb.DBUtility
{
    public class DBHelper
    {
        public static readonly string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        public static int ExecuteNonQuery(string connectionString, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                if (connection.State != ConnectionState.Open)
                    connection.Open();
                SqlCommand command = new SqlCommand(commandText, connection);
                if (commandParameters != null)
                {
                    foreach (SqlParameter parm in commandParameters)
                        command.Parameters.Add(parm);
                }
                return command.ExecuteNonQuery();
            }
        }
        public static object ExecuteScalar(string connectionString, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                if (connection.State != ConnectionState.Open)
                    connection.Open();
                SqlCommand command = new SqlCommand(commandText, connection);
                if (commandParameters != null)
                {
                    foreach (SqlParameter parm in commandParameters)
                        command.Parameters.Add(parm);
                }
                return command.ExecuteScalar();
            }
        }


        public static SqlDataReader ExecuteReader(string connectionString, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                if (connection.State != ConnectionState.Open)
                    connection.Open();
                SqlCommand command = new SqlCommand(commandText, connection);
                if (commandParameters != null)
                {

                    foreach (SqlParameter parm in commandParameters)
                        command.Parameters.Add(parm);

                }
                SqlDataReader rdr = command.ExecuteReader(CommandBehavior.CloseConnection);
                return rdr;
            }
            catch
            {
                connection.Close();
                throw;
            }
        }
        /// <summary>
        /// 执行简单的SQL语句
        /// </summary>
        /// <param name="SQLString">执行的SQL语句</param>
        /// <returns>返回的影响的记录</returns>
        public int ExecuteSql(string SQLString)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(SQLString, connection))
                {
                    try
                    {
                        connection.Open();
                        int rows = cmd.ExecuteNonQuery();
                        return rows;
                    }
                    catch (System.Data.SqlClient.SqlException e)
                    {
                        connection.Close();
                        throw e;
                    }
                }

            }
        }
        public DataSet Query(string SQLString)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                DataSet ds = new DataSet();
                try
                {
                    connection.Open();
                    SqlDataAdapter command = new SqlDataAdapter(SQLString, connection);
                    command.Fill(ds, "ds");


                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    throw new Exception(ex.Message);
                }
                return ds;
            }
        }
    }
}
