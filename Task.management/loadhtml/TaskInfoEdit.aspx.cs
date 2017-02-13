using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Task.DAL;
using Task.BLL;
using Task.Model;

public partial class loadhtml_TaskInfoEdit : System.Web.UI.Page
{
    public TaskInfoModel task = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["commandNumber"] == null)
        { LoadData(); }
        else
        {
            task = new TaskInfoModel();
            TaskInfoBll BLL = new TaskInfoBll();
            int commandContent = Convert.ToInt32(Request["commandNumber"]);
            task.CommandNumber = commandContent;
            task.CommandContent = Request["commandContent"];
            //task.UpdateTime = DateTime.Now;
            int rows = BLL.Update(task);
            task = BLL.GetById(Convert.ToInt32(Request["commandNumber"]));
            Response.Write(rows);
        }
    }
    public void LoadData()
    {
        TaskInfoBll BLL = new TaskInfoBll();
        //role = BLL.GetById(1);
        task = BLL.GetById(Convert.ToInt32(Request["id"]));
    }
}