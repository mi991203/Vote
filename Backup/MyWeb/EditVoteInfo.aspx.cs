using MyWeb.DBUtility;
using MyWeb.WebUtility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MyWeb
{
    public partial class EditVoteInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DBHelper db = new DBHelper();
                string sql = "select * from Vote_Tbl where del=0 and id='" + Request["id"].ToString() + "'";
                DataSet ds1 = db.Query(sql);
                TextBox1.Text = ds1.Tables[0].Rows[0]["name"].ToString();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            DBHelper db = new DBHelper();
            WebHelper wb = new WebHelper();
            string sql = "update Vote_Tbl set name='" + TextBox1.Text + "' where del=0 and id='" + Request["id"].ToString() + "'";
            int renum = db.ExecuteSql(sql);
            if (renum == 1)
            {
                wb.Alert("修改成功");
                TextBox1.Text = "";
            }
            else
            {
                wb.Alert("修改失败");
            }
        }
    }
}