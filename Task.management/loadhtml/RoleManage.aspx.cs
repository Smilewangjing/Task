using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using Newtonsoft.Json;
using Task.DAL;
using Task.BLL;

public partial class loadhtml_RoleManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request["method"]!=null)
        {
            //查询数据库的数据
            RoleBll BLL=new RoleBll();
            DataTable dt = BLL.GetAll();
            DataSet set = new DataSet();
            set.Tables.Add(dt);
            string json =JsonConvert.SerializeObject(set);
            //向客户端写回数据
            Response.Clear();
            Response.ContentType = "text/plain";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(json);
            Response.End();
        }
        if(Request["id"]!=null)
        {
            RoleBll BLL = new RoleBll();
            int rows = BLL.Del(Convert.ToInt32(Request["id"]));
            Response.Clear();
            Response.ContentType = "text/plain";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(rows);
            Response.End();   
           
        }
    }
}