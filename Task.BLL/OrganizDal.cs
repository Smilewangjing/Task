using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Task.DAL;
using Task.Model;
using System.Data;
using System.Data.SqlClient;

namespace Task.BLL
{
    public class OrganizDal
    {
        private CommandType type = System.Data.CommandType.Text;

        //查询全部
        public DataTable GetAll(int f) 
        {
            string sql = string.Format("select ID,Name,Explanation,SortID,SecretKey,ParentID,ParentCode,MenuLevel,UpdateTime from EHS_Organizationunit where ID in (select OUID from EHS_RoleOU WHERE RoleID={0})", f);
            return DBHelper.ExecuteDataTable(sql, type);
        }
        //根据id查询
        public Organiz GetByID(int id) 
        {
            //拿到这个对象
            Organiz org = null;
            string sql = string.Format("select * from EHS_Organizationunit where ID={0}", id);
            //把对象填充到Function里并返回
            using (SqlDataReader reader = DBHelper.ExecuteReader(sql, type))
            {
                if (reader.HasRows)
                {
                    if (reader.Read())
                    {
                        org = new Organiz();
                        org.ID = reader.GetInt32(0);
                        org.Name = reader.GetString(1);
                        org.Explanation = reader.GetString(2);
                        org.SortID = reader.GetInt32(3);
                        org.SecretKey = reader.GetString(4);
                        org.ParentID = reader.GetInt32(5);
                        org.ParentCode = reader.GetString(6);
                        org.MenuLevel = reader.GetInt32(7);
                    }
                }
            }
            return org;
            
        }
        //删除
        public int Del(int id) 
        {
            string sql = string.Format("update EHS_Organizationunit set IsDel=1 where ID={0}",id);
            return (int)DBHelper.ExecuteNonQuery(sql,type);
        }
        //添加
        public int Add(Organiz org) 
        {
            string sql = "insert into EHS_Organizationunit values(@name,@explanation,@sortID,@secretKey,@parentID,@parentCode,@menuLevel,@updateTime,@isDel)";
            SqlParameter[] pms = 
            {
                new SqlParameter("@name",org.Name),
                new SqlParameter("@explanation",org.Explanation),
                new SqlParameter("@sortID",org.SortID),
                new SqlParameter("@secretKey",org.SecretKey),
                new SqlParameter("@parentID",org.ParentID),
                new SqlParameter("@parentCode",org.ParentCode),
                new SqlParameter("@menuLevel",org.MenuLevel),
                new SqlParameter("@updateTime",org.UpdateTime),
                new SqlParameter("@isDel",org.IsDel)
            };
            return (int)DBHelper.ExecuteNonQuery(sql,type,pms);
        
        }
        //修改
        public int Update(Organiz org) 
        {
            string sql = "update EHS_Organizationunit set Name=@name,Explanation=@explanation,SortID=@sortID,SecretKey=@secretKey,ParentID=@parentID,ParentCode=@parentCode,MenuLevel=@menuLevel,UpdateTime=@updateTime where ID=@id";
            SqlParameter[] pms = 
            {
                new SqlParameter("@id",org.ID),
                new SqlParameter("@name",org.Name),
                new SqlParameter("@explanation",org.Explanation),
                new SqlParameter("@sortID",org.SortID),
                new SqlParameter("@secretKey",org.SecretKey),
                new SqlParameter("@parentID",org.ParentID),
                new SqlParameter("@parentCode",org.ParentCode),
                new SqlParameter("@menuLevel",org.MenuLevel),
                new SqlParameter("@updateTime",org.UpdateTime),
            };
            return (int)DBHelper.ExecuteNonQuery(sql, type, pms);
        }
        //查询个数
        public Organiz GetNum() 
        {
            Organiz org = null;
            string sql = "select count(ID),Name from EHS_Organizationunit where ID in (select OUID from EHS_RoleOU WHERE RoleID=18)";
            using(SqlDataReader reader=DBHelper.ExecuteReader(sql,type))
            {
                if (reader.HasRows) 
                {
                    if (reader.Read()) 
                    {
                        org.Num = reader.GetInt32(0);
                        org.Name = reader.GetString(1);
                    }
                }
            }
            return org;
        }
    }
}
