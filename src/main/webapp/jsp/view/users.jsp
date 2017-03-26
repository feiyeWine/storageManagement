<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="jsp/dataTables/media/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="jsp/dataTables/media/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="jsp/dataTables/media/css/jquery.dataTables_themeroller.css">
    <script type="text/javascript" src="jsp/dataTables/media/js/jquery.js"></script>
    <script type="text/javascript" src="jsp/dataTables/media/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="jsp/dataTables/media/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="jsp/js/datatables.js"></script>

    <link href="jsp/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <script src="jsp/bootstrap/js/bootstrap.min.js"></script>
    <script src="jsp/js/jquery/jquery.validate.js"></script>
    <script src="jsp/js/jquery/messages_zh.js"></script>

    <style type="text/css">
        .error{
            padding-left: 16px;

            padding-bottom: 2px;

            font-weight: bold;

            color: #EA5200;
            /*background: url("jsp/image3/unchecked.gif") no-repeat 0px 0px;*/
        }
    </style>
</head>
<body>
	<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
        	<th>序号</th>
        	<th>用户名</th>
            <th>电话号码</th>
            <th>邮箱</th>
            <th>创建时间</th>
            <th>操作</th>
        </tr>
    </thead>
 
    <tbody>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.phone}</td>
            <td>${user.email}</td>
            <td> <fmt:formatDate value="${user.datetime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td class="actions"><a class="modalA" href="#myModal"  data-toggle="modal" title="修改信息"><img src="jsp/img/icons/actions/edit.png" alt="" /></a>
                &nbsp;&nbsp;&nbsp;<a class="modalB" href="#deleteModal" data-toggle="modal" title="删除此用户"><img src="jsp/img/icons/actions/delete.png" alt="" /></a></td>

        </tr>
    </c:forEach>
    </tbody>
</table>


<!--加入模态框-->
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 style="font-weight: bold" class="modal-title" id="myModalLabel">
                        修改仓管员信息
                    </h4>
                </div>
                <div class="modal-body">
                    <!--添加文本-->
                    <div>
                        <form id="modalForm" name="modalForm" class="form" action="" method="post">
                            <!--<label class="label-default">id</label>-->
                            <input type="text" class="control-label" id="id" name="id" value="" style="display: none"/>
                            <div class="form-group">
                                <label class="">用户名：</label>
                                <input type="text" class="form-control" id="name" name="name" value=""/>
                           </div>

                            <div class="form-group">
                                <label class="">电话号码：</label>
                                <input type="text" class="form-control" id="phone" name="phone" value=""/>
                            </div>
                            <div class="form-group">
                                <label class="">邮箱：</label>
                                <input type="text" class="form-control" id="email" name="email" value=""/>
                            </div>
                            <div class="form-group">
                                <label class="userLabel" style="display: none">修改密码：</label>
                                <input type="password" class="form-control" id="password" name="password" value="" style="display: none"/>
                            </div>
                            <div class="form-group">
                                <label class="userLabel" style="display: none">确认密码：</label>
                                <input type="password" class="form-control" id="userInsurePassword" name="userInsurePassword" value="" style="display: none"/>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default"
                                        data-dismiss="modal">关闭
                                </button>

                                <button type="button" id="modifyPassword" class="btn btn-primary" style="margin-left: 20px">
                                    修改密码
                                </button>
                                <button type="submit" class="btn btn-primary">
                                    提交更改
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 style="font-weight: bold" class="modal-title" id="myModalLabel2">
                        删除此条信息
                    </h4>
                </div>
                <div class="modal-body">
                    <!--添加文本-->
                    <div>
                        <span>是否删除此用户信息？删除后不可恢复</span>
                        <form id="deleteForm" name="modalForm" class="form" action="deleteUser.do" method="post">
                            <input type="text" class="control-label" id="id2" name="id" value="" style="display: none;"/>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default"
                                        data-dismiss="modal">关闭
                                </button>

                                <button id="deleteButton" type="button" class="btn btn-primary">
                                    确认删除
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</body>
    <script type="text/javascript">

        $("#deleteButton").click(function(){
            $.post("/storageManagement/deleteUser.do",{"id":$("#id2").val()}, function (data) {
                if(data.status=="success"){
                    window.location.reload();
                }else{
                    alert("删除失败");
                }
            });
        });

        $(function(){
            $(".modalA").click(function(){
               var $td = $(this).parents("tr").children("td");
                $("#id").val($td.eq(0).text());
                $("#name").val($td.eq(1).text()) ;
                $("#phone").val($td.eq(2).text()) ;
                $("#email").val($td.eq(3).text()) ;
            });

            $(".modalB").click(function(){
                var $td = $(this).parents("tr").children("td");
                $("#id2").val($td.eq(0).text());

            });
        });

        $("#modifyPassword").click(function(){
            $(".userLabel").css("display","block");
            $("#password").css("display","block");
            $("#userInsurePassword").css("display","block");
        })

        //验证表单
        $().ready(function() {
            // 在键盘按下并释放及提交后验证提交表单


            $("#modalForm").validate({

                submitHandler: function(form) {

                    $.post("/storageManagement/modifyUser.do",$("#modalForm").serialize(),function (data) {
                        if(data.status=="success"){
                            alert("修改成功");
                            window.location.reload();
                        }else{
                            alert("修改失败");
                        }
                    });
                },

                errorPlacement:function(error,element) {
                    element.prev().append(error);
                },

                success:"checked",
                rules: {
                    name: {
                        required: true,
                        minlength: 2,
                        maxlength:20,
                    },

                    userInsurePassword:{
                        isEnsurePassword:true,
                    },

                    phone:{
                        required:true,
                        isPhone:true,
                        maxlength:15,
                    },
                    email: {
                        required: true,
                        email: true,
                        maxlength:30,
                    },
                },
                messages: {
                    name: {
                        required: "请输入用户名",
                        minlength: "长度为2-20个字符"
                    },

                    email: "请输入正确的邮箱",
                    phone:"请输入正确的电话号码",
                }
            });
        });
        // 联系电话(手机/电话皆可)验证
        jQuery.validator.addMethod("isPhone", function(value,element) {
            var length = value.length;
            var mobile = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
            var tel = /^\d{3,4}-?\d{7,9}$/;
            return this.optional(element) || (tel.test(value) || mobile.test(value));

        }, "请正确填写您的联系电话");

        jQuery.validator.addMethod("isEnsurePassword", function(value,element) {
            return  $("#password").val()==$(element).val();
        }, "两次密码不相同，请重新输入");

    </script>

</html>