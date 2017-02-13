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
    public class logDal
    {
        private static readonly string ConnString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        /// <summary>
        /// 数据库连接对象
        /// </summary>
        SqlConnection conn = new SqlConnection(ConnString);
        /// <summary>
        /// 得到日志
        /// </summary>
        /// <param name="strSql"></param>
        /// <returns></returns>
        public DataTable getLog(string strSql) 
        {
            SqlDataAdapter sda = new SqlDataAdapter(strSql,conn);
            if (conn.State != ConnectionState.Open)
                conn.Open();
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (conn.State != ConnectionState.Closed)
                conn.Close();
            return dt;
        }
    }
}
