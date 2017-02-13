using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Task.DAL;
using Task.BLL;
using System.Data;
using System.Text;
using Newtonsoft.Json;

public partial class TaskManageIndex : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string result = "";
        if (!IsPostBack)
        {

            if (Request["method"] != null)
            {
                TaskInfoBll bll = new TaskInfoBll();
                DataTable dt = new DataTable();
                dt = bll.GetTaskInfo();
                //dt=StringHelper.DateChange(bll.GetTaskInfo(),3);
                DataSet ds = new DataSet();
                ds.Tables.Add(dt);
                result = JsonConvert.SerializeObject(ds);
                #region 向客户端写回数据
                Response.Clear();
                Response.ContentType = "text/plain";
                Response.ContentEncoding = System.Text.Encoding.UTF8;
                Response.Write(result);
                Response.End();
                #endregion
            }
            //删除
            if (Request["id"] != null)
            {
                TaskInfoBll BLL = new TaskInfoBll();
                int rows = BLL.Del(Convert.ToInt32(Request["id"]));
                Response.Clear();
                Response.ContentType = "text/plain";
                Response.ContentEncoding = System.Text.Encoding.UTF8;
                Response.Write(rows);
                Response.End();

            }
        }
    }
}