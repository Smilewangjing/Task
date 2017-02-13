using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;
using Task.DAL;

namespace Task.BLL
{
    public class ReceiverBll
    {
        private CommandType type = System.Data.CommandType.Text;
        //获取全部网评员
        public DataTable GetAll() 
        {
            string sql = "select ID,NickName,Email,UserState,CreateTime,IsDel from EHS_User where ID in (select UserID from EHS_UserRole WHERE RoleID=18)";
            return DBHelper.ExecuteDataTable(sql, type); 
        }
        //根据网评员id获取他还没有北分配到的任务
        public DataTable GetRestTask(int id) 
        {
            string sql = string.Format("select ID,ServerName,CommandContent from CMT_Command WHERE ID not in (select CommandID from CMT_CommandSendee WHERE UserID={0})", id);
            return DBHelper.ExecuteDataTable(sql,type);
        }
        //根据网评员id获取相应 的任务
        public DataTable Query(int id, int state)
        {
            string sql = "";
            //全部
            if (state == 0)
            {
                sql = string.Format("select t1.ServerName,t1.CommandContent,t3.Description,t2.CreateTime,t2.DisableTime from CMT_Command t1,CMT_CommandSendee t2,CMT_State t3 where t1.CommandNumber=t2.CommandID and t2.State=t3.ID  and t2.UserID={0}", id);
            }
            //查询未完成
            else if (state == 123)
            {
                sql = string.Format("select t1.ServerName,t1.CommandContent,t3.Description,t2.CreateTime,t2.DisableTime from CMT_Command t1,CMT_CommandSendee t2,CMT_State t3 where t1.CommandNumber=t2.CommandID and t2.State=t3.ID  and t2.UserID={0} and t2.State!={1}", id, 4);
            }
            else
            {
                sql = string.Format("select t1.ServerName,t1.CommandContent,t3.Description,t2.CreateTime,t2.DisableTime from CMT_Command t1,CMT_CommandSendee t2,CMT_State t3 where t1.CommandNumber=t2.CommandID and t2.State=t3.ID  and t2.UserID={0} and t2.State={1}", id, state);
            }
            //返回
            return DBHelper.ExecuteDataTable(sql,type);
        }
        //根据网评员id获取相应的任务根据-时间
        public  DataTable QueryAddDuration(int id, int state, int dur)
        {
            string sql = "";
            DataTable dt3;
            if (dur != 7)
            {
                DateTime dt1 = DateTime.Now, dt2 = DateTime.Now;
                switch (dur)
                {
                    case 1:
                        dt1 = DateTime.Now.Date;
                        dt2 = DateTime.Now.AddDays(1).Date;
                        break;
                    case 3:
                        dt1 = DateTime.Now.AddDays(-1).Date;
                        dt2 = DateTime.Now.AddDays(1).Date;
                        break;
                }
                //全部
                if (state == 0)
                {
                    sql = string.Format("select t1.ServerName,t1.CommandContent,t3.Description,t2.CreateTime,t2.DisableTime from CMT_Command t1,CMT_CommandSendee t2,CMT_State t3 where t1.CommandNumber=t2.CommandID and t2.UserID={0} and t2.State=t3.ID and t2.CreateTime between @d1 and @d2", id);
                }
                //查询未完成
                else if (state == 123)
                {
                    sql = string.Format("select t1.ServerName,t1.CommandContent,t3.Description,t2.CreateTime,t2.DisableTime from CMT_Command t1,CMT_CommandSendee t2,CMT_State t3 where t1.CommandNumber=t2.CommandID and t2.UserID={0} and t2.State!={1} and t2.State=t3.ID  t2.CreateTime between @d1 and @d2", id, 4);
                }
                else
                {
                    sql = string.Format("select t1.ServerName,t1.CommandContent,t3.Description,t2.CreateTime,t2.DisableTime from CMT_Command t1,CMT_CommandSendee t2,CMT_State t3 where t1.CommandNumber=t2.CommandID and t2.UserID={0} and t2.State={1} and t2.State=t3.ID  t2.CreateTime between @d1 and @d2", id, state);
                }
                SqlParameter[] pms =
        {
            new SqlParameter("@d1",dt1),
            new SqlParameter("@d2",dt2)
        };
                //返回
                dt3 = DBHelper.ExecuteDataTable(sql, System.Data.CommandType.Text, pms);
            }
            else
            {
                if (state == 0)
                {
                    sql = string.Format("select t1.ServerName,t1.CommandContent,t3.Description,t2.CreateTime,t2.DisableTime from CMT_Command t1,CMT_CommandSendee t2,CMT_State t3 where t1.CommandNumber=t2.CommandID and t2.State=t3.ID  and  t2.UserID={0}", id);
                }
                //查询未完成
                else if (state == 123)
                {
                    sql = string.Format("select t1.ServerName,t1.CommandContent,t3.Description,t2.CreateTime,t2.DisableTime from CMT_Command t1,CMT_CommandSendee t2,CMT_State t3 where t1.CommandNumber=t2.CommandID and t2.State=t3.ID  and t2.UserID={0} and t2.State!={1}", id, 4);
                }
                else
                {
                    sql = string.Format("select t1.ServerName,t1.CommandContent,t3.Description,t2.CreateTime,t2.DisableTime from CMT_Command t1,CMT_CommandSendee t2,CMT_State t3 where t1.CommandNumber=t2.CommandID and t2.State=t3.ID  and t2.UserID={0} and t2.State={1}", id, state);
                }
                dt3 = DBHelper.ExecuteDataTable(sql, System.Data.CommandType.Text);
            }

            return dt3;
        } 
    }
}
