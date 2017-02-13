using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;

namespace Task.DAL
{
    public class TaskReplyDal
    {
        private CommandType type = System.Data.CommandType.Text;
        /// <summary>
        /// 任务回复信息
        /// </summary>
        /// <returns></returns>
        public DataTable GetTaskReply()
        {
            string sql = "select a.ID,a.CommandID,b.CommandContent,a.ReplyUserID,c.NickName,a.ReplyContent,a.ReplyTime,a.ReplyTime,a.IsDel from CMT_CommandReply as a join CMT_Command as b on a.CommandID=b.ID join EHS_User as c on a.ReplyUserID=c.ID where c.Flag=1;";
            return DBHelper.ExecuteDataTable(sql, type);
        }
    }
}
