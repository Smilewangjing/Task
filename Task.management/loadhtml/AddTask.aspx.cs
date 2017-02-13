using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Task.Model;
using Task.BLL;
using System.Data;
using Newtonsoft.Json;

public partial class loadhtml_AddTask : System.Web.UI.Page
{
    public loginModel login = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        //处理添加任务
        if (Request["taID"] != null && Request["reID"]!=null)
        {
            userBll bll = new userBll();
            login = bll.GetByID(Convert.ToInt32(Request["reID"]));
            
            //创建并实例化一个CommandSendee对象
            CommandSendee cs = new CommandSendee();
            cs.CommandID = Convert.ToInt32(Request["taID"]);
            cs.UserID = Convert.ToInt32(Request["reID"]);
            cs.State = 1;
            cs.CreateTime = DateTime.Now;
            cs.IsDel = 0;
            //插入到数据库中
            TaskSendeeBll bll2 = new TaskSendeeBll();
            int rows = bll2.Add(cs);
            //返回受影响的行数
            Response.Clear();
            Response.ContentType = "text/plain";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(rows);
            Response.End();

        }
        //处理该网评员还没有被分配的任务
        if(Request["method"]!=null)
        {
            //获取该网评员还没有被分配的任务
            ReceiverBll bll=new ReceiverBll();
            DataTable dt = bll.GetRestTask(Convert.ToInt32(Request["receiverID"]));
            DataSet set = new DataSet();
            set.Tables.Add(dt);
            string json = JsonConvert.SerializeObject(set);
            //写回该网评员还没有被分配的任务
            Response.Clear();
            Response.ContentType = "text/plain";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(json);
            Response.End();
        }
        //处理用户ID和用户名
        if(Request["id"]!=null)
        {
            GetData();
        }
    }

    private void GetData()
    {
        //设置ID
        userBll bll=new userBll();
        login=bll.GetByID(Convert.ToInt32(Request["id"]));
    }
}