using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;

namespace Task.Model
{
    public class SqlAndParameter
    {
        public string Sql
        {
            get;
            set;
        }

        public SqlParameter[] Parameters
        {
            get;
            set;
        }

        public CommandType CmdType
        {
            get;
            set;
        }
    }
}
