<%@ WebHandler Language="C#" Class="Register" %>

using System;
using System.Web;
using Task.BLL;
using Task.DAL;
using Task.Model;
using Newtonsoft.Json;

public class Register : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string json = null;
        loginBll lbl = new loginBll();
        userBll get = new userBll();
        try 
        {
            if (context.Request["Account"] != null) {
                json = lbl.checkUserName(context.Request["Account"]).ToString();
                if (context.Request["Password"] != null)
                {
                    if (lbl.checkUserName(context.Request["Account"])) {
                        json = "用户名存在";
                    }
                    else
                    {
                        UserModel attr = new UserModel();
                        attr.Account = context.Request["Account"];
                        attr.Password = context.Request["Password"];
                        attr.NickName = context.Request["NickName"];
                        attr.MobilePhone = context.Request["MobilePhone"];
                        attr.Email = context.Request["Email"];
                        attr.IsEmail = true;
                        attr.UserState = 1;
                        attr.CurrentTime = DateTime.Now;
                        attr.LastTime = DateTime.Now;
                        attr.CreateTime = DateTime.Now;
                        attr.UpdateTime = DateTime.Now;
                        attr.IsDel = 0;
                        attr.Flag = 0;
                        json = get.AddUser(attr).ToString();
                        int ID = get.getOneUserID(context.Request["Account"]); 
                        UserRoleModel Urm = new UserRoleModel();
                        Urm.UserID = ID;
                        Urm.RoleID = 18;
                        Urm.UpdateTime = DateTime.Now;
                        Urm.IsDel = "False";
                        json = get.AddUserRole(Urm).ToString();
                    }
                }
            }
            else if (context.Request["MobilePhone"] != null) {
                json = lbl.checkMobilePhone(context.Request["MobilePhone"]).ToString();
            }
            else if (context.Request["Email"] != null) {
                json = lbl.checkEmail(context.Request["Email"]).ToString();
            }
        }
        catch (Exception ex) 
        {
            json = ex.ToString();    
        }
        context.Response.Clear();
        context.Response.ContentType = "text/plain";
        context.Response.ContentEncoding = System.Text.Encoding.UTF8;
        context.Response.Write(json);
        context.Response.End();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}