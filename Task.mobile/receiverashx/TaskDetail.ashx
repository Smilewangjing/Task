<%@ WebHandler Language="C#" Class="TaskDetail" %>

using System;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using Task.Model;
using Task.BLL;
using Task.DAL;
using Newtonsoft.Json;

public class TaskDetail : IHttpHandler {
    public void ProcessRequest (HttpContext context) {
         string result = "";
         int id = Convert.ToInt32(context.Request["id"]);
         //int id = 3;
         try
         {
             TaskInfoBll bll = new TaskInfoBll();
             DataTable dt = new DataTable();
             dt = bll.TaskDetailMobile(id);
             DataSet ds = new DataSet();
             ds.Tables.Add(dt);
             result = Convert.ToString(JsonConvert.SerializeObject(ds));
         }
         catch (Exception ex) {
             result = ex.ToString();
         }
        context.Response.Clear();
        context.Response.ContentType = "text/plain";
        context.Response.ContentEncoding = System.Text.Encoding.UTF8;
        context.Response.Write(result);
        context.Response.End();
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}