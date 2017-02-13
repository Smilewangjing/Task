using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Task.DAL
{
    public class helper
    {
        public static SqlConnection conn;
        /// <summary>
        /// 数据库连接方法
        /// </summary>
        public static SqlConnection ConnectionString
        {
            get
            {
                string constr = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
                conn = new SqlConnection(constr);
                if (conn.State != ConnectionState.Open)
                {
                    conn.Open();
                }
                else if (conn.State != ConnectionState.Open)
                {
                    conn.Close();
                }
                return conn;
            }
        }
        /// <summary>
        /// 返回SqlDataReader，无参数
        /// </summary>
        /// <param name="constr"></param>
        /// <returns></returns>
        public static SqlDataReader GetReader(string constr)
        {
            try
            {
                SqlCommand com = new SqlCommand(constr, ConnectionString);
                SqlDataReader reader = com.ExecuteReader();
                reader.Close();
                return reader;   ///这两句先后顺序           
            }
            catch (Exception ex) { return null; }
            finally
            {
                ConnectionString.Close();
            }
        }
        /// <summary>
        /// 返回DataTable,无参
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static DataTable GetDataset(string sql)
        {
            try
            {
                DataSet Ds = new DataSet();
                SqlCommand com = new SqlCommand(sql, ConnectionString);
                SqlDataAdapter Adapter = new SqlDataAdapter(com);
                Adapter.Fill(Ds);
                return Ds.Tables[0];
            }
            catch (Exception ex) { return null; }
            finally { ConnectionString.Close(); }
        }
        /// <summary>
        /// 返回DataTables,带参
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="values"></param>
        /// <returns></returns>
        public static DataTable GetDataset(string sql, params SqlParameter[] values)
        {
            try
            {
                DataSet Ds = new DataSet();
                SqlCommand com = new SqlCommand(sql, ConnectionString);
                com.Parameters.AddRange(values);
                SqlDataAdapter Adapter = new SqlDataAdapter(com);
                Adapter.Fill(Ds);
                return Ds.Tables[0];
            }
            catch (Exception ex) { return null; }
            finally { ConnectionString.Close(); }
        }
        /// <summary>
        /// 返回第一行，无参
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static int GetSclar(string sql)
        {
            try
            {
                SqlCommand com = new SqlCommand(sql, ConnectionString);
                return Convert.ToInt32(com.ExecuteScalar());
            }
            catch (Exception ex) { return 0; }
            finally { }
        }
        /// <summary>
        /// 返回受影响的行数，无参数
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static int ExecuteCommand(string sql)
        {
            try
            {
                SqlCommand com = new SqlCommand(sql, ConnectionString);
                return com.ExecuteNonQuery();
            }
            catch (Exception ex) { return 0; }
            finally { ConnectionString.Close(); }
        }
        /// <summary>
        /// 返回收影响的行数，含参
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        public static int ExecuteCommand(string sql, params SqlParameter[] value)
        {
            try
            {
                SqlCommand com = new SqlCommand(sql, ConnectionString);
                com.Parameters.Clear();
                com.Parameters.AddRange(value);
                return com.ExecuteNonQuery();
            }
            catch (Exception ex) { return 0; }
            finally { ConnectionString.Close(); }
        }
    }    
}
