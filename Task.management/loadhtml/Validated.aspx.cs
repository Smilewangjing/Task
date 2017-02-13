using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class loadhtml_Validated : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["ValidatedCode"] != null)
        {
            string vCode = Session["CheckCode"].ToString();
            string Bool = vCode.ToUpper() == Request["ValidatedCode"].Trim().ToUpper() ? "true" : "false";
            Response.Clear();
            Response.ContentType = "text/plain";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(Bool);
            Response.End();
        }
    }
}