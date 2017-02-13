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
    public class TaskInfoBll
    {   
        #region 任务信息查询
        TaskInfoDal dal = new TaskInfoDal();
        /// <summary>
        /// 根据指定id获取
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public TaskInfoModel GetById(int id)
        {
            return dal.GetById(id);
        }
        /// <summary>
        /// 获取任务信息
        /// </summary>
        /// <returns></returns>
        public DataTable GetTaskInfo()
        {
            return dal.GetTaskInfo();
        }
        public DataTable AllTaskInfo() {
            return dal.AllTaskInfo();
        }
        /// <summary>
        ///增加任务
        /// </summary>
        /// <param name="task"></param>
        /// <returns></returns>
        public int Add(TaskInfoModel task)
        {
            //调用DAL层的add方法并返回
            return dal.Add(task);
        }
        public UserModel GetUserID(string userNmae) {
            return dal.GetUserID(userNmae);
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
        public int Update(TaskInfoModel task)
        {
            return dal.Update(task);
        }
        public int GetTaskNumber()
        {
            return dal.TaskNumber();
        } 
        #endregion 
        #region 任务分发查询
        TaskDispenseDal fee = new TaskDispenseDal();
        /// <summary>
        /// 任务分发表
        /// </summary>
        /// <returns></returns>
        public DataTable GetTaskDispense() {
            return fee.GetTaskDispense();
        }
        # endregion
        # region 任务回复查询
        TaskReplyDal trd = new TaskReplyDal();
        public DataTable GetTaskReply() {
            return trd.GetTaskReply();
        }
        #endregion
        # region 任务详细信息
        TaskDetailDal tdd = new TaskDetailDal();
        public DataTable GetTaskDetails() {
            return tdd.GetTaskDetail(); 
        }
        public DataTable TaskDetailMobile(int id)
        {
            return tdd.TaskDetailMobile(id);
        }
        # endregion
    }
}
