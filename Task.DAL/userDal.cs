using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using Task.Model;
using Task.DAL;

namespace Task.DAL
{
    public class userDal
    {
        private static readonly string ConnString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        private CommandType type = System.Data.CommandType.Text;
        /// <summary>
        /// 数据库连接对象
        /// </summary>
        SqlConnection conn = new SqlConnection(ConnString);
        /// <summary>
        /// 获取用户id
        /// </summary>
        /// <param name="sqlStr"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public UserModel selectUserName(string sqlStr)
        {
            UserModel User = null;
            using (SqlDataReader reader = DBHelper.ExecuteReader(sqlStr, type))
            {
                if (reader.HasRows)
                {
                    if (reader.Read())
                    {
                        User = new UserModel();
                        User.Id = reader.GetInt32(0);
                        User.Password = reader.GetString(2);
                        User.NickName = reader.GetString(3);
                        User.MobilePhone = reader.GetString(4);
                        User.Email = reader.GetString(5);
                    }
                }
            }
            return User;
        }
        public UserRoleModel selectRole(string str)
        {
            UserRoleModel UserRole = null;
            using (SqlDataReader reader = DBHelper.ExecuteReader(str, type))
            {
                if (reader.HasRows)
                {
                    if (reader.Read())
                    {
                        UserRole = new UserRoleModel();
                        UserRole.ID = reader.GetInt32(0);
                        UserRole.UserID = reader.GetInt32(1);
                        UserRole.RoleID = reader.GetInt32(2);
                    }
                }
            }
            return UserRole; 
        }
        /// <summary>
        /// 编辑
        /// </summary>
        /// <param name="role"></param>
        /// <returns></returns>
        public int Update(UserModel User)
        {
            string sql = "update EHS_User set Password=@Password,NickName=@name,MobilePhone=@phone,UpdateTime=@time where ID=@id";
            SqlParameter[] pms =
            {
                new SqlParameter("@id",User.Id),
                new SqlParameter("@Password",User.Password),
                new SqlParameter("@name",User.NickName),
                new SqlParameter("@phone",User.MobilePhone),
                new SqlParameter("@time",User.UpdateTime)
            };
            return (int)DBHelper.ExecuteNonQuery(sql, type, pms);
        }
        public int UserRoleUpdate(UserRoleModel User)
        {
            string sql = "update EHS_UserRole set UserID=@Uid,RoleID=@Rid,UpdateTime=@time where ID=@id";
            SqlParameter[] pms =
            {
                new SqlParameter("@id",User.ID),
                new SqlParameter("@Uid",User.UserID),
                new SqlParameter("@Rid",User.RoleID),
                new SqlParameter("@time",User.UpdateTime)
            };
            return (int)DBHelper.ExecuteNonQuery(sql, type, pms);
        }
        public int UpdatePassword(UserModel User){
            string sql = "update EHS_User set Password=@password where Account=@account";
            SqlParameter[] pms =
            {
                new SqlParameter("@account",User.Account),
                new SqlParameter("@password",User.Password),
            };
            return (int)DBHelper.ExecuteNonQuery(sql, type, pms);
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int Del(string sql)
        {
            return (int)DBHelper.ExecuteNonQuery(sql, type);
        }
        /// <summary>
        /// 获取用户的权限
        /// </summary>
        /// <param></param>
        /// <returns></returns>
        public DataTable getJurisdiction(string sqlStr)
        {
            SqlDataAdapter sda = new SqlDataAdapter(sqlStr, conn);
            if (conn.State != ConnectionState.Open)
                conn.Open();
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (conn.State != ConnectionState.Closed)
                conn.Close();
            return dt;
        }
        public DataTable getUser(string sqlStr) 
        {
            SqlDataAdapter sda = new SqlDataAdapter(sqlStr,conn);
            if (conn.State != ConnectionState.Open)
                conn.Open();
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (conn.State != ConnectionState.Closed)
                conn.Close();
            return dt;
        }
        public DataTable getUserRole(string sqlStr) 
        {
            SqlDataAdapter sda = new SqlDataAdapter(sqlStr,conn);
            if (conn.State != ConnectionState.Open)
                conn.Open();
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (conn.State != ConnectionState.Closed)
                conn.Close();
            return dt;
        }
        public int getOneUserID(string sqlStr)
        {
            SqlDataAdapter sda = new SqlDataAdapter(sqlStr, conn);
            if (conn.State != ConnectionState.Open)
                conn.Open();
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (conn.State != ConnectionState.Closed)
                conn.Close();
            return (int)dt.Rows[0][0];
        }
        /// <summary>
        /// 增加用户
        /// </summary>
        /// <param name="Uml"></param>
        /// <returns></returns>
        public int AddUser(UserModel Uml) {
            //string sql = "insert into EHS_User values (@Account,@Password,@NickName,@MobilePhone,@Email,@IsEmail,@UserState,@CurrentTime,@LastTime,@CreateTime,@UpdateTime,@iddel,@Flag)";
            string sql = "insert into EHS_User(Account,Password) values(@Account,@Password)";
            SqlParameter[] pms =
            {
                new SqlParameter("@Account",Uml.Account),
                new SqlParameter("@Password",Uml.Password),
                //new SqlParameter("@NickName",Uml.NickName),
                //new SqlParameter("@MobilePhone",Uml.MobilePhone),
                //new SqlParameter("@Email",Uml.Email),
                //new SqlParameter("@IsEmail",Uml.IsEmail),
                //new SqlParameter("@UserState",Uml.UserState),
                //new SqlParameter("@CurrentTime",Uml.CurrentTime),
                //new SqlParameter("@LastTime",Uml.LastTime),
                //new SqlParameter("@CreateTime",Uml.CreateTime),
                //new SqlParameter("@UpdateTime",Uml.UpdateTime),
                //new SqlParameter("@iddel",Uml.IsDel),
                //new SqlParameter("@Flag",Uml.Flag),
            };
            return (int)DBHelper.ExecuteNonQuery(sql, type, pms);
        }
        /// <summary>
        /// 手机注册
        /// </summary>
        /// <param name="Uml"></param>
        /// <returns></returns>
        public int AddUser_Mobile(UserModel Uml)
        {
            //string sql = "insert into EHS_User values (@Account,@Password,@NickName,@MobilePhone,@Email,@IsEmail,@UserState,@CurrentTime,@LastTime,@CreateTime,@UpdateTime,@iddel,@Flag)";
            string sql = "insert into EHS_User(Account,Password) values(@Account,@Password)";
            SqlParameter[] pms =
            {
                new SqlParameter("@Account",Uml.Account),
                new SqlParameter("@Password",Uml.Password),
                //new SqlParameter("@NickName",Uml.NickName),
                //new SqlParameter("@MobilePhone",Uml.MobilePhone),
                //new SqlParameter("@Email",Uml.Email),
                //new SqlParameter("@IsEmail",Uml.IsEmail),
                //new SqlParameter("@UserState",Uml.UserState),
                //new SqlParameter("@CurrentTime",Uml.CurrentTime),
                //new SqlParameter("@LastTime",Uml.LastTime),
                //new SqlParameter("@CreateTime",Uml.CreateTime),
                //new SqlParameter("@UpdateTime",Uml.UpdateTime),
                //new SqlParameter("@iddel",Uml.IsDel),
                //new SqlParameter("@Flag",Uml.Flag),
            };
            return (int)DBHelper.ExecuteNonQuery(sql, type, pms);
        }
        /// <summary>
        /// 增加用户权限表
        /// </summary>
        /// <param name="Uml"></param>
        /// <returns></returns>
        public int AddUserRole(UserRoleModel Urm)
        {
            string sql = "insert into EHS_UserRole values (@UserID,@RoleID,@UpdateTime,@IsDel)";
            SqlParameter[] pms =
            {
                new SqlParameter("@UserID",Urm.UserID),
                new SqlParameter("@RoleID",Urm.RoleID),
                new SqlParameter("@UpdateTime",Urm.UpdateTime),
                new SqlParameter("@IsDel",Urm.IsDel),
            };
            return (int)DBHelper.ExecuteNonQuery(sql, type, pms);
        }
        public DataTable getOneUser(string sqlStr){
            SqlDataAdapter sda = new SqlDataAdapter(sqlStr,conn);
            if (conn.State != ConnectionState.Open)
                conn.Open();
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (conn.State != ConnectionState.Closed)
                conn.Close();
            return dt;
        }
        public DataTable getOneRole(string sqlStr)
        {
            SqlDataAdapter sda = new SqlDataAdapter(sqlStr, conn);
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
