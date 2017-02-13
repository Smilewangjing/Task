using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Task.BLL;
using Task.Model;

public partial class loadhtml_AuthorityEdit : System.Web.UI.Page
{
    public UserRoleModel UserRole = new UserRoleModel();
    protected void Page_Load(object sender, EventArgs e)
    {
        userBll ubl = new userBll();
        if (Request["UserRoleID"] != null)
        {
            try
            {
                UserRole.ID = Convert.ToInt32(Request["UserRoleID"]);
                UserRole.UserID = Convert.ToInt32(Request["UserID"]);
                UserRole.RoleID = Convert.ToInt32(Request["RoleID"]);
                UserRole.UpdateTime = DateTime.Now;
                int rows = ubl.UserRoleUpdate(UserRole);
                //User = ubl.selectUserName(Request["id"]);
                //Response.Write(rows);
            }
            catch (Exception ex) { }
        }
        else
        {
            UserRole = ubl.selectRole(Request["id"]);
        }
    }
}