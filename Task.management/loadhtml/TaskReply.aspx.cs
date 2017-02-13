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
using Newtonsoft.Json;
public partial class loadhtml_TaskReply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        {
            string result = "";
            if (Request["method"] != null)
            {
                TaskInfoBll bll = new TaskInfoBll();
                DataTable dt = bll.GetTaskReply() ;
                DataSet ds = new DataSet();
                ds.Tables.Add(dt);
                result = JsonConvert.SerializeObject(ds);
                Response.Clear();
                Response.ContentType = "text/plain";
                Response.ContentEncoding = System.Text.Encoding.UTF8;
                Response.Write(result);
                Response.End();
            }
        }
    }
}