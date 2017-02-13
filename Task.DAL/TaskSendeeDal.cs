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
    public class TaskSendeeDal
    {
        private CommandType type = System.Data.CommandType.Text;

        /// <summary>
        /// 获取全部
        /// </summary>
        /// <returns></returns>
        public DataTable GetAll()
        {
            string sql = "select ID,CommandID,UserID,State,CreateTime,IsDel from CMT_CommandSendee; ";
            return DBHelper.ExecuteDataTable(sql, type);
        }
        /// <summary>
        /// 根据单个ID进行获取
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public TaskSendeeModel GetById(int id)
        {
            TaskSendeeModel taskDispense = null;
            string sql = string.Format("select ID,CommandID,UserID,State,CreateTime,IsDel from CMT_CommandSendee where ID={0}", id);
            using (SqlDataReader reader = DBHelper.ExecuteReader(sql, type))
            {
                if (reader.HasRows)
                {
                    if (reader.Read())
                    {
                        taskDispense = new TaskSendeeModel();
                        taskDispense.Id = reader.GetInt32(0);
                        taskDispense.CommandID = reader.GetInt32(2);
                    }
                }
            }
            return taskDispense;
        }
        /// <summary>
        /// 增加
        /// </summary>
        /// <param name="fun"></param>
        /// <returns></returns>
        public int Add(CommandSendee fun)
        {
            string sql = string.Format("insert into CMT_CommandSendee(CommandID,UserID,State,CreateTime,IsDel) values ({0},{1},{2},@createTime,{3})", fun.CommandID, fun.UserID, fun.State, fun.IsDel);
            SqlParameter[] pms =
            {
                //new SqlParameter("@commandID",fun.CommandID ),
                //new SqlParameter("@userID",fun.UserID),
                //new SqlParameter("@state",fun.State),
                new SqlParameter("@createTime",fun.CreateTime)
                //new SqlParameter("@isDel",fun.IsDel)
            };
            return (int)DBHelper.ExecuteNonQuery(sql, type,pms);
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int Del(int id)
        {
            string sql = string.Format("update CMT_CommandSendee set IsDel=1 where ID={0}", id);
            return (int)DBHelper.ExecuteNonQuery(sql, type);
        }
        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="fun"></param>
        /// <returns></returns>
        public int Update(TaskSendeeModel fun)
        {
            string sql = "update CMT_CommandSendee set CommandID=@commandID,UserID=@userID,State=@state,CreateTime=@createTime,IsDel=@isDel where ID=@id";
            SqlParameter[] pms =
            {
                new SqlParameter("@commandID",fun.CommandID ),
                new SqlParameter("@userID",fun.UserID),
                new SqlParameter("@state",fun.State),
                new SqlParameter("@createTime",fun.CreateTime),
                new SqlParameter("@isDel",fun.IsDel),
            };
            return (int)DBHelper.ExecuteNonQuery(sql, type, pms);
        }
    }
}
