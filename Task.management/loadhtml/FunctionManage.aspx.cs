using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Task.BLL;
using System.Data;
using Newtonsoft.Json;

public partial class loadhtml_FunctionManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["method"] != null)
        {
            //查询数据库的数据
            FunctionDal dal = new FunctionDal();
            DataTable dt = dal.GetAll();
            DataSet set = new DataSet();
            set.Tables.Add(dt);
            string json = JsonConvert.SerializeObject(set);
            //向客户端写回数据
            Response.Clear();
            Response.ContentType = "text/plain";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(json);
            Response.End();
        }
        if(Request["id"]!=null)
        {
            FunctionDal dal=new FunctionDal();
            int rows=dal.Del(Convert.ToInt32(Request["id"]));
            Response.Clear();
            Response.ContentType = "text/plain";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(rows);
            Response.End();
        }
    }
}