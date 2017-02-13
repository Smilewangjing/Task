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
    public class TaskInfoDal
    {
        private CommandType type = System.Data.CommandType.Text;

        /// <summary>
        /// 获取全部
        /// </summary>
        /// <returns></returns>
        public DataTable GetTaskInfo()
        {
            //string sql = "select * from CMT_Command";
            string sql = "select a.ID,b.NickName,a.CommandNumber,a.CommandContent,Convert(date,a.CreateTime,23),c.State,a.IsDel from CMT_Command as a join EHS_User as b on a.UserID=b.ID join CMT_CommandState as c on a.CommandState=c.ID;";
            return DBHelper.ExecuteDataTable(sql, type);
        }
         /// <summary>
        /// 通过Account取用户ID
        /// </summary>
        /// <param name="UserName"></param>
        /// <returns></returns>
        public UserModel GetUserID(string UserName) {
            UserModel userModel = null;
            string sql = string.Format("select ID from EHS_User where Account='{0}';", UserName);
            using (SqlDataReader reader = DBHelper.ExecuteReader(sql, type)) {
                if (reader.HasRows)
                {
                    if (reader.Read())
                    {
                        userModel = new UserModel();
                        userModel.Id = reader.GetInt32(0);
                    }
                }
            }
            return userModel;
        }
        public DataTable AllTaskInfo() {
            string sql = "select * from CMT_Command";
            return DBHelper.ExecuteDataTable(sql, type);
        }
        /// <summary>
        /// 根据单个ID进行获取
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public TaskInfoModel GetById(int id)
        {
            TaskInfoModel taskInfo = null;
            string sql = string.Format("select ID,UserID,CommandNumber,CommandContent,(date,CreateTime,23),IsDel from CMT_Command where ID={0}", id);
            using (SqlDataReader reader = DBHelper.ExecuteReader(sql, type))
            {
                if (reader.HasRows)
                {
                    if (reader.Read())
                    {
                        taskInfo = new TaskInfoModel();
                        taskInfo.Id = reader.GetInt32(0);
                        taskInfo.CommandContent = reader.GetString(1);
                        taskInfo.CommandNumber = reader.GetInt32(2);
                    }
                }
            }
            return taskInfo;
        }
        /// <summary>
        /// 增加
        /// </summary>
        /// <param name="fun"></param>
        /// <returns></returns>
        public int Add(TaskInfoModel fun)
        {
            //string sql = "insert into CMT_Command values (@commandLevelID,@userID,@themeID,@commandSerialNumber,@commandNumber,@serverName,@commandContent,@valiDate,@disableDate,@urgent,@commandState,@isReview,@sendState,@organID,@commandEventID,@possyURL,@isMessage,@feedbackCount,@createTime,@updateTime,@isDel)";
            //用户ID，指令编号，指令内容，逻辑删除
            //string sql = "insert into CMT_Command(UserID,CommandNumber,CommandContent,IsDel) values(@userID,@commandNumber,@commandContent,@isDel)";
            string sql = "insert into CMT_Command(CommandNumber,CommandContent,CreateTime,ValidDate,DisableDate,Urgent,IsDel) values(@commandNumber,@commandContent,@createTime,@validDate,@disableDate,@urgent,@isDel)";
            SqlParameter[] pms =
            {
                //new SqlParameter("@commandLevelID",fun.CommandLevelID),
                //new SqlParameter("@userID",fun.UserID),
                //new SqlParameter("@themeID",fun.ThemeID),
                //new SqlParameter("@commandSerialNumber",fun.CommandSerialNumber),
                new SqlParameter("@commandNumber",fun.CommandNumber ),
                //new SqlParameter("@serverName",fun.ServerName),
                new SqlParameter("@commandContent",fun.CommandContent),
                new SqlParameter("@validDate",fun.ValidDate),
                new SqlParameter("@disableDate",fun.DisableDate),
                new SqlParameter("@urgent",fun.Urgent),
                //new SqlParameter("@commandState",fun.CommandState),
                //new SqlParameter("@isReview",fun.IsReview),
                //new SqlParameter("@sendState",fun.SendState),
                //new SqlParameter("@organID",fun.OrganID),
                //new SqlParameter("@commandEventID",fun.CommandEventID),
                //new SqlParameter("@isMessage",fun.IsMessage),
                //new SqlParameter("@possyURL",fun.PossyURL),
                //new SqlParameter("@feedbackCount",fun.FeedbackCount),
                new SqlParameter("@createTime",fun.CreateTime),
                new SqlParameter("@updateTime",fun.UpdateTime),
                new SqlParameter("@isDel",fun.IsDel)
            };
            return (int)DBHelper.ExecuteNonQuery(sql, type, pms);
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int Del(int id)
        {
            string sql = string.Format("update CMT_CommandUser set IsDel=1 where ID={0}", id);
            return (int)DBHelper.ExecuteNonQuery(sql, type);
        }
        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="fun"></param>
        /// <returns></returns>
        public int Update(TaskInfoModel fun)
        {
            string sql = "update CMT_Command set UserID=@userID,CommandNumber=@commandNumber,CommandContent=@commandContent,CreateTime=@createTime,IsDel=@isDel where ID=@id";
            SqlParameter[] pms =
            {
                new SqlParameter("@userID",fun.UserID),
                new SqlParameter("@commandNumber",fun.CommandNumber ),
                new SqlParameter("@commandContent",fun.CommandContent),
                new SqlParameter("@createTime",fun.CreateTime),
                new SqlParameter("@isDel",fun.IsDel),
            };
            return (int)DBHelper.ExecuteNonQuery(sql, type, pms);
        }
        public int TaskNumber() {
            string sql = "select count(ID) from CMT_Command;";
            return (int)DBHelper.ExecuteNonQuery(sql, type);
        }
        /// <summary>
        /// 修改任务状态
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int TaskStateChange(int state,int id) {
            string sql = string.Format("update CMT_CommandSendee set State={0} where ID={1}",state,id);
            return (int)DBHelper.ExecuteNonQuery(sql, type);
        }
    }
}
