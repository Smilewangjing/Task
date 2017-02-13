using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Task.BLL;
using System.Data;
using Newtonsoft.Json;

public partial class loadhtml_OrganizManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request["method"]!=null)
        {
            //获得角色
            int flag = Convert.ToInt32(Request["flag"]);
            //查询
            OrganizDal dal = new OrganizDal();
            DataTable dt = dal.GetAll(flag);
            DataSet set = new DataSet();
            set.Tables.Add(dt);
            string json = JsonConvert.SerializeObject(set, Formatting.Indented);
            //返回
            Response.Clear();
            Response.ContentType = "text/plain";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(json);
            Response.End();
        }
        if(Request["id"]!=null)
        {
            //执行删除
            OrganizDal dal = new OrganizDal();
            int rows = dal.Del(Convert.ToInt32(Request["id"]));
            //返回
            Response.Clear();
            Response.ContentType = "text/plain";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(rows);
            Response.End();
        }
    }
}