<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageForUser.Master" AutoEventWireup="true" CodeBehind="UserVote.aspx.cs" Inherits="MyWeb.UserVote" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="clearfix data" style="">
        
    </div>
    <%--<div id="divPro" class="list_right"></div>--%>
    <div class="paging clearfix" style="width: 1000px;">
        <a class="up_page"><i class="mai-ico"></i>上一页</a><a class="showpage">1</a><a class="showpage">2</a><a
             class="showpage">3</a><a class="showpage">4</a><a class="showpage">5</a><a class="down_page">下一页<i
                class="mai-ico"></i></a></div>
    <input type="hidden" id="pi" value="1" runat="server" />
    <input type="hidden" id="ps" value="20" runat="server" />
    <input type="hidden" id="userid" value="" runat="server" />
    <script type="text/javascript">
        var pi = $("#ContentPlaceHolder1_pi").val();
        var ps = $("#ContentPlaceHolder1_ps").val();
        //加载页面
        $.ajax({
            type: "post",
            dataType: "json",
            contentType: "application/json", //注意：WebMethod()必须加这项，否则客户端数据不会传到服务端
            data: "{ 'pi': '" + pi + "','ps': '" + ps + "'}", //注意：data参数可以是string个int类型
            url: "UserVote.aspx/loadInfo", //模拟web服务，提交到方法
            // 可选的 async:false,阻塞的异步就是同步
            beforeSend: function () {                   // do something.
                // 一般是禁用按钮等防止用户重复提交
                //$("#btnClick").attr({disabled:"disabled"});
                // 或者是显示loading图片
            },
            success: function (data) {
                //alert("success: " + data.d);//注意这里：必须通过data.d才能获取到服务器返回的值
                // 服务端可以直接返回Model，也可以返回序列化之后的字符串，如果需要反序列化：string json = JSON.parse(data.d);
                // 有时候需要嵌套调用ajax请求，也是可以的
                //                alert("1234");
                //                alert($("#navSearch"));
                $(".data").append(data.d);
            },
            complete: function () {
                //do something.
                //$("#btnClick").removeAttr("disabled");
                // 隐藏loading图片
                //$("#showMessage").val("");
            },
            error: function (data) {
                alert("error: " + data.d);
            }
        });

        $(".showpage").click(function () {

            var pi = $(this).text();
            $("#ContentPlaceHolder1_pi").val($(this).text());
            var ps = $("#ContentPlaceHolder1_ps").val();
            //加载页面
            $.ajax({
                type: "post",
                dataType: "json",
                contentType: "application/json", //注意：WebMethod()必须加这项，否则客户端数据不会传到服务端
                data: "{ 'pi': '" + pi + "','ps': '" + ps + "'}", //注意：data参数可以是string个int类型
                url: "UserVote.aspx/loadInfo", //模拟web服务，提交到方法
                // 可选的 async:false,阻塞的异步就是同步
                beforeSend: function () {                   // do something.
                    // 一般是禁用按钮等防止用户重复提交
                    //$("#btnClick").attr({disabled:"disabled"});
                    // 或者是显示loading图片
                    $(".data").html("");
                },
                success: function (data) {
                    //alert("success: " + data.d);//注意这里：必须通过data.d才能获取到服务器返回的值
                    // 服务端可以直接返回Model，也可以返回序列化之后的字符串，如果需要反序列化：string json = JSON.parse(data.d);
                    // 有时候需要嵌套调用ajax请求，也是可以的
                    //                alert("1234");
                    //                alert($("#navSearch"));
                    //                    alert(data.d);
                    $(".data").append(data.d);
                },
                complete: function () {
                    //do something.
                    //$("#btnClick").removeAttr("disabled");
                    // 隐藏loading图片
                    //$("#showMessage").val("");
                },
                error: function (data) {
                    alert("error: " + data.d);
                }
            });
        });
        $(".up_page").click(function () {
            if ((parseInt($("#ContentPlaceHolder1_pi").val()) - 1) > 1) {
                $("#ContentPlaceHolder1_pi").val((parseInt($("#ContentPlaceHolder1_pi").val()) - 1).toString());
                var pi = $("#ContentPlaceHolder1_pi").val();
                var ps = $("#ContentPlaceHolder1_ps").val();
                //        alert(classId);
                //加载页面
                $.ajax({
                    type: "post",
                    dataType: "json",
                    contentType: "application/json", //注意：WebMethod()必须加这项，否则客户端数据不会传到服务端
                    data: "{ 'pi': '" + pi + "','ps': '" + ps + "'}", //注意：data参数可以是string个int类型
                    url: "UserVote.aspx/loadInfo", //模拟web服务，提交到方法
                    // 可选的 async:false,阻塞的异步就是同步
                    beforeSend: function () {                   // do something.
                        // 一般是禁用按钮等防止用户重复提交
                        //$("#btnClick").attr({disabled:"disabled"});
                        // 或者是显示loading图片
                        $(".data").html("");
                    },
                    success: function (data) {
                        //alert("success: " + data.d);//注意这里：必须通过data.d才能获取到服务器返回的值
                        // 服务端可以直接返回Model，也可以返回序列化之后的字符串，如果需要反序列化：string json = JSON.parse(data.d);
                        // 有时候需要嵌套调用ajax请求，也是可以的
                        //                alert("1234");
                        //                alert($("#navSearch"));
                        //                    alert(data.d);
                        $(".data").append(data.d);
                    },
                    complete: function () {
                        //do something.
                        //$("#btnClick").removeAttr("disabled");
                        // 隐藏loading图片
                        //$("#showMessage").val("");
                    },
                    error: function (data) {
                        alert("error: " + data.d);
                    }
                });
            }
            else {
                var pi = "1";
                var ps = $("#ContentPlaceHolder1_ps").val();
                //加载页面
                $.ajax({
                    type: "post",
                    dataType: "json",
                    contentType: "application/json", //注意：WebMethod()必须加这项，否则客户端数据不会传到服务端
                    data: "{ 'pi': '" + pi + "','ps': '" + ps + "'}", //注意：data参数可以是string个int类型
                    url: "UserVote.aspx/loadInfo", //模拟web服务，提交到方法
                    // 可选的 async:false,阻塞的异步就是同步
                    beforeSend: function () {                   // do something.
                        // 一般是禁用按钮等防止用户重复提交
                        //$("#btnClick").attr({disabled:"disabled"});
                        // 或者是显示loading图片
                        $(".data").html("");
                    },
                    success: function (data) {
                        //alert("success: " + data.d);//注意这里：必须通过data.d才能获取到服务器返回的值
                        // 服务端可以直接返回Model，也可以返回序列化之后的字符串，如果需要反序列化：string json = JSON.parse(data.d);
                        // 有时候需要嵌套调用ajax请求，也是可以的
                        //                alert("1234");
                        //                alert($("#navSearch"));
                        //                    alert(data.d);
                        $(".data").append(data.d);
                    },
                    complete: function () {
                        //do something.
                        //$("#btnClick").removeAttr("disabled");
                        // 隐藏loading图片
                        //$("#showMessage").val("");
                    },
                    error: function (data) {
                        alert("error: " + data.d);
                    }
                });
            }
        });
        $(".down_page").click(function () {
            if ((parseInt($("#ContentPlaceHolder1_pi").val()) - 1) >= 0) {
                $("#ContentPlaceHolder1_pi").val((parseInt($("#ContentPlaceHolder1_pi").val()) + 1).toString());
                var pi = $("#ContentPlaceHolder1_pi").val();
                var ps = $("#ContentPlaceHolder1_ps").val();
                //加载页面
                $.ajax({
                    type: "post",
                    dataType: "json",
                    contentType: "application/json", //注意：WebMethod()必须加这项，否则客户端数据不会传到服务端
                    data: "{ 'pi': '" + pi + "','ps': '" + ps + "'}", //注意：data参数可以是string个int类型
                    url: "UserVote.aspx/loadInfo", //模拟web服务，提交到方法
                    // 可选的 async:false,阻塞的异步就是同步
                    beforeSend: function () {                   // do something.
                        // 一般是禁用按钮等防止用户重复提交
                        //$("#btnClick").attr({disabled:"disabled"});
                        // 或者是显示loading图片
                        $(".data").html("");
                    },
                    success: function (data) {
                        //alert("success: " + data.d);//注意这里：必须通过data.d才能获取到服务器返回的值
                        // 服务端可以直接返回Model，也可以返回序列化之后的字符串，如果需要反序列化：string json = JSON.parse(data.d);
                        // 有时候需要嵌套调用ajax请求，也是可以的
                        //                alert("1234");
                        //                alert($("#navSearch"));
                        //                    alert(data.d);
                        $(".data").append(data.d);
                    },
                    complete: function () {
                        //do something.
                        //$("#btnClick").removeAttr("disabled");
                        // 隐藏loading图片
                        //$("#showMessage").val("");
                    },
                    error: function (data) {
                        alert("error: " + data.d);
                    }
                });
            }
        });

        //
        $(".data").on("click", "#vote", function () {
            var userid = $("#ContentPlaceHolder1_userid").val();
            var val = $('input[name="xm"]:checked').val();
            if ($('input[name="xm"]:checked').size()==0) {
                alert("请选择一个项目");
                return false;
            }
            $.ajax({
                type: "post",
                dataType: "json",
                contentType: "application/json", //注意：WebMethod()必须加这项，否则客户端数据不会传到服务端
                data: "{ 'val': '" + val + "','userid': '" + userid + "'}", //注意：data参数可以是string个int类型
                url: "UserVote.aspx/loadClick", //模拟web服务，提交到方法
                // 可选的 async:false,阻塞的异步就是同步
                beforeSend: function () {                   // do something.
                    // 一般是禁用按钮等防止用户重复提交
                    //$("#btnClick").attr({disabled:"disabled"});
                    // 或者是显示loading图片

                },
                success: function (data) {
                    //alert("success: " + data.d);//注意这里：必须通过data.d才能获取到服务器返回的值
                    // 服务端可以直接返回Model，也可以返回序列化之后的字符串，如果需要反序列化：string json = JSON.parse(data.d);
                    // 有时候需要嵌套调用ajax请求，也是可以的
                    //                alert("1234");
                    //                alert($("#navSearch"));
                    //                    alert(data.d);
                    if (data.d == "1") {
                        alert("投票成功");
                        window.location.reload();
                    }
                    else if (data.d == "-1") {
                        alert("该主题不可投票");
                    }
                    else if (data.d == "-2") {
                        alert("你已经投过这个主题的票了，请勿重复投票！");
                    }
                    else {
                        alert("投票失败");
                    }
                },
                complete: function () {
                    //do something.
                    //$("#btnClick").removeAttr("disabled");
                    // 隐藏loading图片
                    //$("#showMessage").val("");
                },
                error: function (data) {
                    alert("error: " + data.d);
                }
            });
        });
    </script>
</asp:Content>
