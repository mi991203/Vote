using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyWeb.INC
{
    public partial class VerifyCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string checkCode = this.CreateStr();
                this.CreateCode(checkCode);
                Session["check_code"] = checkCode;
            }

        }
        protected string CreateStr()
        {
            string str = "";
            Random random = new Random();
            str = random.Next(1000, 9999).ToString();
            return str;
        }
        protected void CreateCode(string code)
        {
            if (code.Length == 0)
                return;
            Random random = new Random();
            Bitmap map = new Bitmap(4 * 16, 35);//定义一个宽度为4*13,高度为30像素的位图
            Graphics g = Graphics.FromImage(map);
            g.Clear(Color.White);
            g.DrawRectangle(new Pen(Color.Gray), 0, 0, map.Width - 1, map.Height - 1);//进行描边

            //...开始写字
            Matrix matrix;//声明用来操作矩阵的类
            LinearGradientBrush brush = new LinearGradientBrush(new Point(0, 0), new Point(map.Width, map.Height), Color.Red, Color.Green);
            for (int j = 0; j < code.Length; j++)
            {
                string schar = code.Substring(j, 1);
                matrix = g.Transform;//获取当前绘图的世界坐标系。
                float shearx = 0.0F;
                float sheary = 0.0F;
                matrix.Shear(shearx, sheary);
                g.Transform = matrix;
                g.DrawString(schar, new Font("黑体", 14.0f, FontStyle.Bold), brush, new PointF(0.0f + (15.0f * j), random.Next(30 - 20)));
            }
            //画干扰线
            int x1 = random.Next(map.Width);
            int y1 = random.Next(map.Height);
            int x2 = random.Next(map.Width);
            int y2 = random.Next(map.Height);
            g.DrawLine(new Pen(Color.Black), new Point(x1, y1), new Point(x2, y2));
            //画干扰点
            for (int i = 0; i < 10; i++)
            {
                map.SetPixel(random.Next(map.Width), random.Next(map.Height), Color.FromArgb(random.Next(255), random.Next(255), random.Next(255)));
            }
            Response.Clear();
            MemoryStream stream = new MemoryStream();
            map.Save(stream, ImageFormat.Gif);
            Response.ContentType = "image/Gif";
            Response.BinaryWrite(stream.ToArray());
        }
    }
}