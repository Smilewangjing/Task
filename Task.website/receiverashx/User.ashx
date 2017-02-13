<%@ WebHandler Language="C#" Class="User" %>

using System;
using System.Web;
using Task.BLL;
using Task.DAL;
using Task.Model;
using Newtonsoft.Json;

public class User : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string json = null;
        try
        {
            userBll get = new userBll();
            //忘记密码
            if (context.Request["Account"] != null)
            {
                //json = JsonConvert.SerializeObject(get.selectUserName(context.Request["Account"]));
                if (context.Request["Password"] != null)
                {
                    UserModel User = new UserModel();
                    User.Account = context.Request["Account"].ToString();
                    User.Password = context.Request["Password"].ToString();
                    json = get.UpdatePassword(User).ToString();
                }
            }
            else if (context.Request["ID"] != null)
            {
                json = get.Del(context.Request["ID"]).ToString();
            }
            else
            {
                json = JsonConvert.SerializeObject(get.getUser());
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