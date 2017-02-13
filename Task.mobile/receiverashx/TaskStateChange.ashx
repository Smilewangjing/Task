<%@ WebHandler Language="C#" Class="TaskStateChange" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using Task.BLL;
using Task.DAL;
using Task.Model;
using Newtonsoft.Json;

public class TaskStateChange : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string result = "";
        try
        {
            int state = Convert.ToInt32(context.Request["state"]);
            int id = Convert.ToInt32(context.Request["id"]);
            TaskSendeeBll bll = new TaskSendeeBll();
            //DataTable dt = new DataTable();
            int i = bll.TaskStateChange(state,id);
            //DataSet ds = new DataSet();
            //ds.Tables.Add(dt);
            if (i != null)
            {
                result = "true";
                context.Response.Clear();
                context.Response.ContentType = "text/plain";
                context.Response.ContentEncoding = System.Text.Encoding.UTF8;
                context.Response.Write(result);
                context.Response.End();
            }
            else {
                result = "false";
                context.Response.Clear();
                context.Response.ContentType = "text/plain";
                context.Response.ContentEncoding = System.Text.Encoding.UTF8;
                context.Response.Write(result);
                context.Response.End();
            }
        }
        catch (Exception ex)
        {
            result = ex.ToString();
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}