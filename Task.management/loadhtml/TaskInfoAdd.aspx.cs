using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using Task.BLL;
using Task.DAL;
using Task.Model;

public partial class loadhtml_TaskInfoAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["commandNumber"] != null)
        {
            #region 从前台得到数据
            //int commandLevelID = Convert.ToInt32(Request["commandLevelID"]);
            //string userName =Request["userID"];
            //int themeID = Convert.ToInt32(Request["themeID"]);
            //string commandSerialNumber = Request["commandSerialNumber"];//任务流水号
            //int commandNumber = Convert.ToInt32(Request["commandNumber"]);
            //string serverName=Request["serverName"];
            string commandContent = Request["commandContent"];
            //DateTime validDate = Convert.ToDateTime(Request["validDate"]);
            //DateTime disableDate = Convert.ToDateTime(Request["disableDate"]);
            double urgent = Convert.ToDouble(Request["urgent"]);
            string vaildDate = Request["vaildDate"];
            string disableDate=Request["disableDate"];
            //int isReview = Convert.ToInt32(Request["isReview"]);
            //int organID = Convert.ToInt32(Request["organID"]);
            //int commandEventID = Convert.ToInt32(Request["commandEventID"]);
            //string possyURL = Request["possyURL"];
            //int isMessage = Convert.ToInt32(Request["isMessage"]);
            //int feedbackCount = Convert.ToInt32(Request["feedbackCount"]);
#endregion
            //插入数据库
            #region TaskInfoMode对象
            TaskInfoModel task = new TaskInfoModel();
            TaskInfoBll tib = new TaskInfoBll();
            //task.CommandLevelID = commandLevelID;
            //task.UserID = userID;
            //task.ThemeID = themeID;
            //task.CommandSerialNumber = ("{0}{1}{2}",);
            task.CommandNumber = tib.GetTaskNumber();
            //task.ServerName = serverName;
            task.CommandContent = commandContent;
            //task.ValiDate = DateTime.Now;
            //task.DisableDate = DateTime.Now;
            //task.Urgent = urgent;
            //task.CommandState = 0;
            //task.IsReview = isReview;
            //task.SendState = 0;
            //task.OrganID = organID;
            //task.CommandEventID = commandEventID;
            //task.PossyURL = possyURL;
            //task.IsMessage = isMessage;
            //task.FeedbackCount = feedbackCount;
            task.ValidDate = vaildDate;
            task.DisableDate = disableDate;
            task.CreateTime = Convert.ToString(DateTime.Now);
            task.UpdateTime = Convert.ToString(DateTime.Now);
            task.IsDel = 0;
            #endregion
            TaskInfoBll BLL = new TaskInfoBll();
            int rows = -1;
            rows = BLL.Add(task);
            //返回执行结果
            Response.Clear();
            Response.ContentType = "text/plain";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(rows);
            Response.End();
        }
    }
}