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
    public  class TaskDispenseDal
    {
        private CommandType type = System.Data.CommandType.Text;
        /// <summary>
        /// 任务分发信息
        /// </summary>
        /// <returns></returns>
        public DataTable GetTaskDispense()
        {
            string sql = "select a.ID,a.CommandID,b.NickName,c.ServerName,c.CommandContent,d.State,a.CreateTime from CMT_CommandSendee as a join EHS_User as b on a.UserID=b.ID join CMT_Command as c on a.CommandID=c.ID join CMT_CommandState as d on a.State=d.ID;";
            return DBHelper.ExecuteDataTable(sql, type);
        }
    }
}
