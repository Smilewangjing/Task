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
    public class CommandSendeeBll
    {
        private CommandType type = System.Data.CommandType.Text;
        
        //添加
        public int Add(CommandSendee cs) 
        {
            string sql = string.Format("insert into CMT_CommandSendee(CommandID,UserID,State,CreateTime,IsDel) values({0},{1},{2},{3}),{4}",cs.CommandID,cs.UserID,cs.State,cs.CreateTime,cs.IsDel);
            return DBHelper.ExecuteNonQuery(sql,type);
        }

    }
}
