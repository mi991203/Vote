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
    public partial class AddVoteDetailInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            DBHelper db = new DBHelper();
            WebHelper wb = new WebHelper();
            string sql = "insert into VoteDetail_Tbl values('" + Request["id"].ToString() + "','" + TextBox1.Text + "',0,getdate(),0)";
            int renum = db.ExecuteSql(sql);
            if (renum == 1)
            {
                wb.Alert("添加成功");
                TextBox1.Text = "";
            }
            else
            {
                wb.Alert("添加失败");
            }

        }
    }
}