 using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;

namespace Task.DAL
{
    public class StringHelper
    {
        /// <summary>
        /// 格式化日期格式为XXXX年XX月XX日
        /// </summary>
        /// <param name="dt">DataTable</param>
        /// <param name="col">date类型数据所在列号</param>
        /// <returns></returns>
        public static DataTable DateChange(DataTable dt, int col)
        {
            DataTable dtnew = new DataTable();
            if (dt != null && dt.Rows.Count > 0)
            {
                dtnew = dt.Clone();
                //将DateTime转化为string类型
                foreach (DataColumn dc in dtnew.Columns)
                {
                    if (dc.DataType == (new DateTime()).GetType())
                    {
                        dc.DataType = Type.GetType("System.String");
                    }
                }
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    dtnew.Rows.Add(dt.Rows[i].ItemArray);
                }
                //格式化日期格式
                foreach (DataRow dr in dtnew.Rows)
                {
                    dr[col] = Convert.ToDateTime(dr[col]).ToString("D");
                }
            }
            return dtnew;
        }
    }
}
