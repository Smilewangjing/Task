using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task.Model
{
    public class TaskInfoManage
    {
        private int id;//id
        private int commandLevelID;//指令级别号
        private int userID;//用户编号
        private int themeID;//任务来源编号
        private string  commandSerialNumber;//指令流水编号
        private string commandNumber;//指令编号
        private string serverName;//服务信息名称
        private string commandContent;//指令内容
        private DateTime validDate;//有效时间
        private DateTime disableDate;//停用时间
        private double urgent;//紧急引导参数
        private int commandState;//指令状态
        private int  isReview;//是否回复
        private int sendState;//发送状态
        private int organID;//机构编号
        private int commandEventID;//命令事件编号
        private string possyURL;//目标URL
        private int isMessage;//短信通知
        private int feedbackCount;//反馈条数限制
        private DateTime createTime;//创建时间
        private DateTime updateTime;//操作时间
        private int isDel;//删除
        private int ID
        {
            get { return id; }
            set { id = value; }
        }
        private int CommandLevelID {
            get { return commandLevelID; }
            set { commandLevelID = value; }
        }
        private int UserID{
            get { return userID; }
            set { userID = value; }
        }
        private int ThemeID {
            get { return themeID; }
            set { themeID = value; }
        }
        private string CommandSerialNumber {
            get { return commandSerialNumber; }
            set { commandSerialNumber = value; }
        }
        private string CommandNumber {
            get { return commandNumber; }
            set { commandNumber = value; }
        }
        private string ServerName{
            get { return serverName; }
            set { serverName = value; }
        }
        private string CommandContent {
            get { return commandContent; }
            set { commandContent = value; }
        }
        private DateTime ValiDate {
            get { return validDate; }
            set { validDate = value; }
        }
        private DateTime DisableDate {
            get { return disableDate; }
            set { disableDate = value; }
        }
        private double Urgent{
            get { return urgent; }
            set { urgent = value; }
        }
        private int CommandState {
            get { return commandState; }
            set { commandState = value; }
        }
        private int IsReview {
            get { return isReview; }
            set { isReview = value; }
        }
        private int SendState {
            get { return sendState; }
            set { sendState = value; }
        }
        private int OrganID {
            get { return organID; }
            set { organID = value; }
        }
        private int CommandEventID {
            get { return commandEventID; }
            set { commandEventID = value; }
        }
        private int IsMessage
        {
            get { return isMessage; }
            set { isMessage = value; }
        }
        private string PossyURL
        {
            get { return possyURL; }
            set { possyURL = value; }
        }
        private int FeedbackCount
        {
            get { return feedbackCount; }
            set { feedbackCount = value; }
        }
        private DateTime CreateTime
        {
            get { return createTime; }
            set { createTime = value; }
        }
        private DateTime UpdateTime
        {
            get { return updateTime; }
            set { updateTime = value; }
        } 
        private int IsDel
        {
            get { return isDel;}
            set { isDel = value; }
        } 
    }
}
