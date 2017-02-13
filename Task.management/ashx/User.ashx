<%@ WebHandler Language="C#" Class="User" %>

using System;
using System.Web;
using Task.DAL;
using Task.BLL;
using Newtonsoft.Json;
using System.Data;
using System.Data.SqlClient;
using Task.Model;


public class User : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string json = null;
        try
        {
            userBll get = new userBll();
            if (context.Request["Account"] != null) {
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
            }
            else if (context.Request["ID"] != null)
            {
                json = get.Del(context.Request["ID"]).ToString();
            }
            else {
                DataSet set = new DataSet();
                set.Tables.Add(get.getUser());
                json = JsonConvert.SerializeObject(set);
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