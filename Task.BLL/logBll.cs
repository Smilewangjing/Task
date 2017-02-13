using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

using Task.DAL;
using Task.Model;

namespace Task.BLL
{
    public class logBll
    {
        logDal ldl = new logDal();
        public DataTable getLog(string limit,string id)
        {
            string sqlStr = null;
            if(Convert.ToInt32(limit)== 1){
                sqlStr = string.Format("select * from 表名");
            }
            else
            {
                sqlStr = string.Format("select * from 表名 where 列名=" + id + "");
            }
            return ldl.getLog(sqlStr);
        }
    }
}
