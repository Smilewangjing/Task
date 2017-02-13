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

public partial class loadhtml_ReceiverOrganizEdit : System.Web.UI.Page
{
    public Organiz org = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["method"]!=null) 
        {
            //Response.Write(Request["id"]);
            int id = Convert.ToInt32(Request["id"]);
            int flag = Convert.ToInt32(Request["flag"]);
            //查询数据
            OrganiUserBll bll = new OrganiUserBll();
            DataTable dt = bll.GetUserByID(id, flag);
            DataSet set = new DataSet();
            set.Tables.Add(dt);
            string json = JsonConvert.SerializeObject(set);
            //返回
            Response.Clear();
            Response.ContentType = "text/plain";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(json);
            Response.End();
        }
        if (Request["OrganizID"]!=null) 
        { 
            //获取数据
            int id = Convert.ToInt32(Request["OrganizID"]);
            OrganiUserBll bll = new OrganiUserBll();
            DataTable dt = bll.GetRestTaskByID(id);
            DataSet set = new DataSet();
            set.Tables.Add(dt);
            string json = JsonConvert.SerializeObject(set);
            //返回
            Response.Clear();
            Response.ContentType = "text/plain";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(json);
            Response.End();

        }
        //给组内的用户分配任务
        if (Request["arr"]!=null) 
        {
            //增加
            int id = Convert.ToInt32(Request["id"]);//组id
            string arr = Request["arr"];//组内用户id
            List<int> list = JsonConvert.DeserializeObject<List<int>>(@arr);
            OrganiUserBll bll = new OrganiUserBll();
            bll.AddTaskToGroup(id,list);
            //返回
            Response.Clear();
            Response.ContentType = "text/plain";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write("right");
            Response.End();
        }
        //第一次访问先展示用户数据
        if (Request["id"] != null)
        {
            ShowData();
        }
    }
     private void ShowData()
    {
        OrganizDal dal = new OrganizDal();
        org = dal.GetByID(Convert.ToInt32(Request["id"]));
    }
}