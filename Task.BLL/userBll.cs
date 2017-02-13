using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;
using Task.DAL;
using Task.Model;

namespace Task.BLL
{
    public class userBll
    {
        userDal uda = new userDal();
        public UserModel selectUserName(string id)
        {
            string sqlStr = string.Format("select * from EHS_User where ID={0}", id);
            return uda.selectUserName(sqlStr);
        }
        /// <summary>
        /// UserModel Update
        /// </summary>
        /// <param name="role"></param>
        /// <returns></returns>
        public int Update(UserModel role)
        {
            return uda.Update(role);
        }
        /// <summary>
        /// RoleModel Update
        /// </summary>
        /// <param name="role"></param>
        /// <returns></returns>
        public int UserRoleUpdate(UserRoleModel role)
        {
            return uda.UserRoleUpdate(role);
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int Del(string id)
        {
            string str = string.Format("delete from EHS_User where ID={0}", id);
            return uda.Del(str);
        }
        //public DataTable getJurisdiction(string i)
        //{
        //    string sqlStr = string.Format("select * from EHS_UserRole where UserID='{0}'", i);
        //    return uda.selectUserName(sqlStr);
        //}
        public DataTable getUser() {
            string sqlStr = string.Format("select * from EHS_User");
            return uda.getUser(sqlStr);
        }
        public int AddUser(UserModel Uml) {
            return uda.AddUser(Uml);
        }
        public int AddUser_Mobile(UserModel Uml) {
            return uda.AddUser_Mobile(Uml);
        }
        public int AddUserRole(UserRoleModel Urm) {
            return uda.AddUserRole(Urm);
        }
        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="User"></param>
        /// <returns></returns>
        public int UpdatePassword(UserModel User)
        {
            return uda.UpdatePassword(User);
        }
        public loginModel GetByID(int id) 
        { 
            //拿到这个对象
            loginModel login = null;
            string sql = string.Format("select * from EHS_User where ID={0}", id);
            //把对象填充到loginModel里并返回
            using (SqlDataReader reader = DBHelper.ExecuteReader(sql, System.Data.CommandType.Text))
            {
                if (reader.HasRows)
                {
                    if (reader.Read())
                    {
                        login = new loginModel();
                        login.ID = reader.GetInt32(0);
                        login.NickName = reader.GetString(3);
                    }
                }
            }
            return login;
        }
        /// <summary>
        /// 获取权限管理的表
        /// </summary>
        /// <returns></returns>
        public DataTable getUserRole() {
            string sqlStr = string.Format("select * from EHS_UserRole");
            return uda.getUserRole(sqlStr);
        }
        /// <summary>
        /// 获取单个用户
        /// </summary>
        /// <param name="account"></param>
        /// <returns></returns>
        public DataTable getOneUser(string account) {
            string sqlStr = string.Format("select * from EHS_User where Account = '{0}'", account);
            return uda.getOneUser(sqlStr);
        }
        public int getOneUserID(string account) {
            string sqlStr = string.Format("select * from EHS_User where Account = '{0}'", account);
            return uda.getOneUserID(sqlStr);
        }
        /// <summary>
        /// 获取单个用户权限
        /// </summary>
        /// <param name="account"></param>
        /// <returns></returns>
        public DataTable getOneRole(string id)
        {
            string sqlStr = string.Format("select * from EHS_UserRole where UserID = '{0}'", id);
            return uda.getOneUser(sqlStr);
        }
        /// <summary>
        /// 获取权限Model
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public UserRoleModel selectRole(string id)
        {
            string sqlStr = string.Format("select * from EHS_UserRole where ID={0}", id);
            return uda.selectRole(sqlStr);
        }
    }
}
