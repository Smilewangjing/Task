using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Task.BLL;
using Newtonsoft.Json;
using System.Data;
using Task.Model;

public partial class loadhtml_UserEdit : System.Web.UI.Page
{
    public UserModel User = new UserModel();
    protected void Page_Load(object sender, EventArgs e)
    {
        userBll ubl = new userBll();
        if (Request["UserID"] != null)
        {
            try {
                User.Id = Convert.ToInt32(Request["UserID"]);
                User.Password = Request["Password"];
                User.NickName = Request["NickName"];
                User.MobilePhone = Request["MobilePhone"];
                User.Email = Request["Email"];
                User.UpdateTime = DateTime.Now;
                int rows = ubl.Update(User);
                User = ubl.selectUserName(Request["id"]);
                Response.Write(rows);
            }
            catch (Exception ex) { }
        }
        else 
        {
            User = ubl.selectUserName(Request["id"]);
        }
    }
}