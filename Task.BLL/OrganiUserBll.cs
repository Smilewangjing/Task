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
    public class OrganiUserBll
    {
        private CommandType type = System.Data.CommandType.Text;
        //根据组id查询组内或组外的用户
        public DataTable GetUserByID(int id,int flag)
        {
            string sql = "";
            if(flag==1)
            {
                sql = string.Format("select ID,NickName,Email from EHS_User WHERE ID IN(select UserID from EHS_UserRole where RoleID=18) and ID in (select UserID from EHS_OUUser where OUID={0})", id); 
            }
            else
            {
                sql = string.Format("select ID,NickName,Email from EHS_User WHERE ID IN(select UserID from EHS_UserRole where RoleID=18) and ID not in (select UserID from EHS_OUUser where OUID={0})", id); 
            }
            return DBHelper.ExecuteDataTable(sql,type);
        }
        //根据组id查询还没有分配给该组的任务
        public DataTable GetRestTaskByID(int id) 
        {
            string sql = string.Format("SELECT ID,ServerName,CommandContent from CMT_Command where ID not in (select CommandID from EHS_OrganizCommand where OrganizID={0})",id);
            return DBHelper.ExecuteDataTable(sql,type);
        }

       //给该组内的用户分配任务
        public void AddTaskToGroup(int id,List<int> list) 
        {
            List<SqlAndParameter> list2 = new List<SqlAndParameter>();
           
            foreach (int item in list) 
            {
                string sql = string.Format("insert into CMT_CommandSendee(CommandID,UserID,State,CreateTime,IsDel) VALUES({0},{1},1,@date,0)", id,item);
                SqlParameter[] pms = { new SqlParameter("@date", DateTime.Now) };
                SqlAndParameter sap = new SqlAndParameter();
                sap.Sql = sql;
                sap.CmdType = type;
                sap.Parameters = pms;
                list2.Add(sap);
            }
            DBHelper.ExecuteNonQueryTran(list2);
        }
    }
}
