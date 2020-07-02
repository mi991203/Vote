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
    public partial class AddVoteInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            DBHelper db = new DBHelper();
            WebHelper wb = new WebHelper();
            string savePath = Server.MapPath("~/Pictures/");
            string Url = "";
            string Name = "";
            if (FileUpload1.HasFile)
            {

                if (!System.IO.Directory.Exists(savePath))
                {
                    System.IO.Directory.CreateDirectory(savePath);
                }
                Url = "~/Pictures/" + FileUpload1.FileName + "";
                Name = FileUpload1.FileName;
                savePath = savePath + "\\" + FileUpload1.FileName;

                FileUpload1.SaveAs(savePath);
                try
                {
                    string sql = "insert into Vote_Tbl values('" + TextBox1.Text + "','" + Url + "',1,getdate(),0)";
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
                catch
                {
                    //Response.Write("<script type='text / javascript'>alert('请正确的填写！');</script>");
                    //wb.Alert("请正确的填写");
                }
            }
            else
            {
                wb.Alert("请上传文件");
            }

        }
    }
}