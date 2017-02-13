using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Task.BLL;
using Task.Model;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;

public partial class loadhtml_TaskDispense2 : System.Web.UI.Page
{
    public Organiz org = null;
    public List<Organiz> list = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        //初始化表格的数量
        //拿到组织的数量
        OrganizDal dal = new OrganizDal();
        DataTable dt = dal.GetAll(18);
        string json = JsonConvert.SerializeObject(dt);
        list = JsonConvert.DeserializeObject<List<Organiz>>(json);
        
        //拿到每个执行员的数据
        if (Request["method2"] != null)
        {
            //获取执行员数据
            ReceiverBll bll = new ReceiverBll();
            DataTable dt2 = bll.GetAll();
            DataSet set = new DataSet();
            set.Tables.Add(dt2);
            string json2 = JsonConvert.SerializeObject(set);
            //返回
            Response.Clear();
            Response.ContentType = "text/plain";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(json2);
            Response.End();
        }
        //拿到组织每个表里面的数据
        if (Request["method"] != null && Request["organiz"]!=null) 
        { 
            //获得数据
            int id = Convert.ToInt32(Request["organiz"]);
            OrganiUserBll bll = new OrganiUserBll();
            DataTable dt2 = bll.GetUserByID(id,1);
            DataSet set = new DataSet();
            set.Tables.Add(dt2);
            string json2 = JsonConvert.SerializeObject(set);
            //返回
            Response.Clear();
            Response.ContentType = "text/plain";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(json2);
            Response.End();
        }
    }
}