using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Task.BLL;
using Task.Model;
using System.Data;
using Newtonsoft.Json;

public partial class loadhtml_receiverMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["method"] != null)
        {
            //查询
            ReceiverBll bll = new ReceiverBll();
            DataTable dt = bll.GetAll();
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
    }
}