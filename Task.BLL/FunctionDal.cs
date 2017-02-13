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
    public class FunctionDal
    {
        private CommandType type = System.Data.CommandType.Text;

        //获取全部
        public DataTable GetAll()
        {
            string sql = "select * from EHS_Menu";
            return DBHelper.ExecuteDataTable(sql, type);
        }
        //根据ID获取
        public Function GetByID(int id) 
        {
            //拿到这个对象
            Function fun = null;
            string sql = string.Format("select * from EHS_Menu where ID={0}",id);
            //把对象填充到Function里并返回
            using(SqlDataReader reader=DBHelper.ExecuteReader(sql,type))
            {
                if(reader.HasRows)
                {
                    if(reader.Read())
                    {
                        fun = new Function();
                        fun.Id = reader.GetInt32(0);
                        fun.Name = reader.GetString(1);
                        fun.Icon = reader.GetString(2);
                        fun.Url = reader.GetString(3);
                        fun.SortID = reader.GetInt32(4);
                        fun.ParentID = reader.GetInt32(5);
                        fun.ParentCode = reader.GetString(6);
                        fun.Level = reader.GetInt32(7);
                        fun.Loaded = reader.GetBoolean(8)==true?1:0;
                        fun.Defaulted = reader.GetBoolean(9)==true?1:0;
                        fun.UpdateTime = reader.GetDateTime(10);
                    }
                }
            }
            return fun;
        }
        //增加
        public int Add(Function fun)
        {
            string sql = "insert into EHS_Menu values (@name,@icon,@url,@sortID,@parentID,@parentCode,@level,@loaded,@defaulted,@updateTime,@isDel)";
            SqlParameter[] pms =
            {
                new SqlParameter("@name",fun.Name),
                new SqlParameter("@icon",fun.Icon),
                new SqlParameter("@url",fun.Url),
                new SqlParameter("@sortID",fun.SortID),
                new SqlParameter("@parentID",fun.ParentID),
                new SqlParameter("@parentCode",fun.ParentCode),
                new SqlParameter("@level",fun.Level),
                new SqlParameter("@loaded",fun.Loaded),
                new SqlParameter("@defaulted",fun.Defaulted),
                new SqlParameter("@updateTime",fun.UpdateTime),
                new SqlParameter("@isDel",fun.IsDel)
            };
            return (int)DBHelper.ExecuteNonQuery(sql, type, pms);
        }
        //删除
        public int Del(int id) 
        {
            string sql = string.Format("update EHS_Menu set IsDel=1 where ID={0}", id);
            return (int)DBHelper.ExecuteNonQuery(sql,type);
        }
        //修改
        public int Update(Function fun) 
        {
            string sql = "update EHS_Menu set Name=@name,Icon=@icon,Url=@url,SortID=@sortID,ParentID=@parentID,ParentCode=@parentCode,MenuLevel=@menuLevel,Loaded=@loaded,Defaulted=@defaulted,UpdateTime=@updateTime where ID=@id";
            SqlParameter[] pms =
            {
                 new SqlParameter("@id",fun.Id),
                new SqlParameter("@name",fun.Name),
                new SqlParameter("@icon",fun.Icon),
                new SqlParameter("@url",fun.Url),
                new SqlParameter("@sortID",fun.SortID),
                new SqlParameter("@parentID",fun.ParentID),
                new SqlParameter("@parentCode",fun.ParentCode),
                new SqlParameter("@menuLevel",fun.Level),
                new SqlParameter("@loaded",fun.Loaded),
                new SqlParameter("@defaulted",fun.Defaulted),
                new SqlParameter("@updateTime",fun.UpdateTime) 
            };
            return (int)DBHelper.ExecuteNonQuery(sql,type,pms);
        }
    }
}
