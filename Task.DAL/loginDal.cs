using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Task.DAL
{
    public class loginDal
    {
        private static readonly string ConnString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        /// <summary>
        /// 数据库连接对象
        /// </summary>
        SqlConnection conn = new SqlConnection(ConnString);
        /// <summary>
        /// 验证用户名是否存在的方法
        /// </summary>
        /// <returns>存在返回true 不存在返回false</returns>
        public Boolean checkUserName(string sqlStr)
        {
            SqlDataAdapter sda = new SqlDataAdapter(sqlStr, conn);
            if (conn.State != ConnectionState.Open)
                conn.Open();
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (conn.State != ConnectionState.Closed)
                conn.Close();
            if (dt.Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// 验证手机
        /// </summary>
        /// <param name="sqlStr"></param>
        /// <param name="account"></param>
        /// <returns></returns>
        public Boolean checkMobilePhone(string sqlStr)
        {
            SqlDataAdapter sda = new SqlDataAdapter(sqlStr, conn);
            if (conn.State != ConnectionState.Open)
                conn.Open();
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (conn.State != ConnectionState.Closed)
                conn.Close();
            if (dt.Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// 验证邮箱
        /// </summary>
        /// <param name="sqlStr"></param>
        /// <param name="account"></param>
        /// <returns></returns>
        public Boolean checkEmail(string sqlStr)
        {
            SqlDataAdapter sda = new SqlDataAdapter(sqlStr, conn);
            if (conn.State != ConnectionState.Open)
                conn.Open();
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (conn.State != ConnectionState.Closed)
                conn.Close();
            if (dt.Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// 验证用户名和密码
        /// </summary>
        /// <param></param>
        /// <returns></returns>
        public DataTable login(string sqlStr, string password)
        {
            SqlDataAdapter sda = new SqlDataAdapter(sqlStr, conn);
            if (conn.State != ConnectionState.Open)
                conn.Open();
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (conn.State != ConnectionState.Closed)
                conn.Close();
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0][2].ToString() == password)
                {
                    return dt;
                }
            }
            dt.Clear();
            return dt;
        }
        /// <summary>
        /// 获取用户id
        /// </summary>
        /// <param name="sqlStr"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public DataTable login(string sqlStr)
        {
            SqlDataAdapter sda = new SqlDataAdapter(sqlStr, conn);
            if (conn.State != ConnectionState.Open)
                conn.Open();
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (conn.State != ConnectionState.Closed)
                conn.Close();
            if (dt.Rows.Count > 0)
            {
                return dt;
            }
            dt.Clear();
            return dt;
        }
        
    }
}
