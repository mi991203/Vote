﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyWeb.WebUtility
{
    public class WebHelper
    {
        /// <summary>
        /// 输出提示信息，并返回上一页
        /// </summary>
        public void Alert(string message)
        {
            HttpResponse Response = System.Web.HttpContext.Current.Response;
            Response.Write("<script language=javascript>");
            Response.Write("alert(\"" + message + "\");");
            Response.Write("history.back();");
            Response.Write("</script>");
            Response.End();
        }

        /// <summary>
        /// 输出提示信息，不返回上一页
        /// </summary>
        public void AlertMsg(string message)
        {
            System.Web.UI.Page current = HttpContext.Current.CurrentHandler as System.Web.UI.Page;

            current.ClientScript.RegisterStartupScript(current.GetType(), "msg", "<script>alert('" + message + "');</script>");
        }

        /// <summary>
        /// 输出提示信息，并转到相应页面
        /// </summary>
        public void Alert(string message, string redirectUrl)
        {
            HttpResponse Response = System.Web.HttpContext.Current.Response;
            Response.Write("<script language=javascript>");
            Response.Write("alert(\"" + message + "\");");
            Response.Write("location='" + redirectUrl + "';");
            Response.Write("</script>");
            Response.End();
        }

        /// <summary>
        /// 输出提示信息，并关闭当前页面
        /// </summary>
        public void AlertAndClose(string message)
        {
            HttpResponse Response = System.Web.HttpContext.Current.Response;
            Response.Write("<script language=javascript>");
            Response.Write("alert(\"" + message + "\");");
            Response.Write("opener='shoes';window.close();");
            Response.Write("</script>");
            Response.End();
        }
    }
}