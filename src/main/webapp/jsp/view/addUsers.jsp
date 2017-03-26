<%--
  Created by IntelliJ IDEA.
  User: YR
  Date: 2016/5/15
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script src="../js/jquery/jquery-1.11.2.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script src="../js/jquery/jquery.validate.js"></script>
<script src="../js/jquery/messages_zh.js"></script>
<style>
    .error{
        padding-left: 16px;

        padding-bottom: 2px;

        font-weight: bold;

        color: #EA5200;
        /*background: url("../image3/unchecked.gif") no-repeat 0px 0px;*/
    }
</style>
<body>

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
                    添加仓管员
                </h4>
            </div>
            <div class="modal-body">
                <!--添加文本-->
                <div>
                    <form id="modalForm" name="modalForm" class="form" action="/addUser.do" method="post">
                        <!--<label class="label-default">id</label>-->
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
                            <label class="userLabel" >密码：</label>
                            <input type="password" class="form-control" id="password" name="password" value="" />
                        </div>
                        <div class="form-group">
                            <label class="userLabel" >确认密码：</label>
                            <input type="password" class="form-control" id="userInsurePassword" name="userInsurePassword" value="" />
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">关闭
                            </button>

                            <button type="submit" class="btn btn-primary">
                                确认添加
                            </button>
                        </div>
                    </form>
                </div>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
    <script>
        $(function(){
            $('#myModal').modal("show");

            $("#modalForm").validate({

                submitHandler: function(form) {
                    $.post("/storageManagement/addUser.do",$("#modalForm").serialize(),function (data) {
                        if(data.status=="success"){
                            alert("添加成功");
                            window.location.reload();
                        }else{
                            alert("添加失败");
                        }
                    });
                    /*$(form).ajaxSubmit({
                        success: function (data) {
                            if(data.status=="success"){
                                alert("添加成功");
                            }else{
                                alert("添加失败");
                            }
                        }
                    });*/

//                $("#submit").click(function () {
                   /* $.post("/sqmy/modifyAccount.do", {
                        "id": $("#id").val(),
                        "userAccount": $("#userAccount").val(),
                        "userNumber": $("#userNumber").val(),
                        "userType": $("#userType").val(),
                        "userAuthority": $("#userAuthority").val(),
                        "userPassword": $("#userPassword").val()
                    }, function (data) {
                        if (data.status == "success") {
                            alert("修改成功");
                            window.location.reload();
                        } else {
                            alert("修改失败");
                        }
//                    });
                    });*/
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
                    password:{
                        required:true,
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
                    password:"请设置用户初始密码"
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
