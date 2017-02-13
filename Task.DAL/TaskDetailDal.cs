using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;
using Task.Model;
using Task.DAL;

namespace Task.DAL
{
    public class TaskDetailDal
    {
        private CommandType type = System.Data.CommandType.Text;
        /// <summary>
        /// 任务详细信息
        /// </summary>
        /// <returns></returns>
        public DataTable GetTaskDetail()
        {
            string sql = "select * from CMT_Command;";
            return DBHelper.ExecuteDataTable(sql, type);
        }
        public DataTable TaskDetailMobile(int id)
        {
            string sql = string.Format("select ServerName,CommandContent,CreateTime,PossyURL,DisableDate from CMT_Command where ID={0};",id);
            return DBHelper.ExecuteDataTable(sql, type);
        }
    }
}
