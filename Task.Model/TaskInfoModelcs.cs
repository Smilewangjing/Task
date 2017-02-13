using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task.Model
{
    public class TaskInfoModel
    {
        private int id;//id
        private int commandNumber;//指令编号
        private int userID;//用户编号
        private string commandContent;//指令内容
        //附件ID
        private string createTime;//创建时间
        private int isDel;//删除
        private int commandLevelID;//指令级别号
        private int themeID;//任务来源编号
        private string commandSerialNumber;//指令流水编号        
        private string serverName;//服务信息名称       
        private string validDate;//有效时间
        private string disableDate;//停用时间
        private double urgent;//紧急引导参数
        private int commandState;//指令状态
        private int isReview;//是否回复
        private int sendState;//发送状态
        private int organID;//机构编号
        private int commandEventID;//命令事件编号
        private string possyURL;//目标URL
        private int isMessage;//短信通知
        private int feedbackCount;//反馈条数限制
        private string updateTime;//操作时间
        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public int CommandLevelID
        {
            get { return commandLevelID; }
            set { commandLevelID = value; }
        }
        public int UserID
        {
            get { return userID; }
            set { userID = value; }
        }
        public int ThemeID
        {
            get { return themeID; }
            set { themeID = value; }
        }
        public string CommandSerialNumber
        {
            get { return commandSerialNumber; }
            set { commandSerialNumber = value; }
        }
        public int CommandNumber
        {
            get { return commandNumber; }
            set { commandNumber = value; }
        }
        public string ServerName
        {
            get { return serverName; }
            set { serverName = value; }
        }
        public string CommandContent
        {
            get { return commandContent; }
            set { commandContent = value; }
        }
        public string  ValidDate
        {
            get { return validDate; }
            set { validDate = value; }
        }
        public string  DisableDate
        {
            get { return disableDate; }
            set { disableDate = value; }
        }
        public double Urgent
        {
            get { return urgent; }
            set { urgent = value; }
        }
        public int CommandState
        {
            get { return commandState; }
            set { commandState = value; }
        }
        public int IsReview
        {
            get { return isReview; }
            set { isReview = value; }
        }
        public int SendState
        {
            get { return sendState; }
            set { sendState = value; }
        }
        public int OrganID
        {
            get { return organID; }
            set { organID = value; }
        }
        public int CommandEventID
        {
            get { return commandEventID; }
            set { commandEventID = value; }
        }
        public int IsMessage
        {
            get { return isMessage; }
            set { isMessage = value; }
        }
        public string PossyURL
        {
            get { return possyURL; }
            set { possyURL = value; }
        }
        public int FeedbackCount
        {
            get { return feedbackCount; }
            set { feedbackCount = value; }
        }
        public string CreateTime
        {
            get { return createTime; }
            set { createTime = value; }
        }
        public string UpdateTime
        {
            get { return updateTime; }
            set { updateTime = value; }
        }
        public int IsDel
        {
            get { return isDel; }
            set { isDel = value; }
        }
    }
}
