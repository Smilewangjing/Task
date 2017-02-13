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
    public class TaskSendeeBll
    {
        TaskSendeeDal dal = new TaskSendeeDal();
        /// <summary>
        /// 根据指定id获取
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public TaskSendeeModel GetById(int id)
        {
            return dal.GetById(id);
        }
        /// <summary>
        /// 获取全部
        /// </summary>
        /// <returns></returns>
        public DataTable GetAll()
        {
            return dal.GetAll();
        }
        /// <summary>
        ///增加
        /// </summary>
        /// <param name="role"></param>
        /// <returns></returns>
        public int Add(CommandSendee task)
        {
            return dal.Add(task);
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int Del(int id)
        {
            return dal.Del(id);
        }
        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="role"></param>
        /// <returns></returns>
        public int Update(TaskSendeeModel task)
        {
            return dal.Update(task);
        }
        TaskInfoDal tid = new TaskInfoDal();
        public int TaskStateChange(int state,int id) {
            return tid.TaskStateChange(state,id);
        }
    }
}
