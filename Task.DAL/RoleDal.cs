using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;
using Task.Model;

namespace Task.DAL
{
    public class RoleDal
    {
        private CommandType type = System.Data.CommandType.Text;
        
        //获取全部
        public DataTable GetAll() 
        {
            string sql = "select * from EHS_Role";
            return DBHelper.ExecuteDataTable(sql,type);
        }
        //根据单个ID进行获取
        public RoleModel GetById(int id) 
        {
            RoleModel role = null; 
            string sql = string.Format("select * from EHS_Role where ID={0}",id);
            using (SqlDataReader reader=DBHelper.ExecuteReader(sql,type))
            {
                if(reader.HasRows)
                {
                    if(reader.Read())
                    {
                        role = new RoleModel();
                        role.Id = reader.GetInt32(0);
                        role.Name = reader.GetString(1);
                        role.Remark = reader.GetString(2);
                    }
                   
                    
                }
            }
            return role;
        }
        //增加
        public int Add(RoleModel role) {
            string sql = "insert into EHS_Role values (@name,@remark,@sorteid,@time,@iddel)";
            SqlParameter[] pms =
            {
                new SqlParameter("@name",role.Name),
                new SqlParameter("@remark",role.Remark),
                new SqlParameter("@sorteid",role.SortId),
                new SqlParameter("@time",role.UpdateTime),
                new SqlParameter("@iddel",role.IsDel)
            };
            return (int)DBHelper.ExecuteNonQuery(sql, type, pms);
        }
        //删除
        public int Del(int id) 
        { 
            string sql=string.Format("delete from EHS_Role where ID={0}",id);
            return (int)DBHelper.ExecuteNonQuery(sql,type);
        }
        //修改
        public int Update(RoleModel role) 
        {
            string sql = "update EHS_Role set Name=@name,Remark=@remark,UpdateTime=@time where ID=@id";
            SqlParameter[] pms =
            {
                new SqlParameter("@id",role.Id),
                new SqlParameter("@name",role.Name),
                new SqlParameter("@remark",role.Remark),
                new SqlParameter("@time",role.UpdateTime)
            };
            return (int)DBHelper.ExecuteNonQuery(sql,type,pms);
        }
    }
}
