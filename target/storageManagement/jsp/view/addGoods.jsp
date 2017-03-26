<%--
  Created by IntelliJ IDEA.
  User: YR
  Date: 2016/5/15
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<link href="jsp/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script src="jsp/js/jquery/jquery-1.11.2.min.js"></script>
<script src="jsp/bootstrap/js/bootstrap.min.js"></script>
<script src="jsp/js/jquery/jquery.validate.js"></script>
<script src="jsp/js/jquery/messages_zh.js"></script>
<style>
    .error{
        padding-left: 16px;

        padding-bottom: 2px;

        font-weight: bold;

        color: #EA5200;
        /*background: url("jsp/image3/unchecked.gif") no-repeat 0px 0px;*/
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
                    添加商品
                </h4>
            </div>
            <div class="modal-body">
                <!--添加文本-->
                <div>
                    <form id="modalForm" name="modalForm" class="form" action="" method="post">
                        <!--<label class="label-default">id</label>-->
                        <div class="form-group">
                            <label class="">商品编号：</label>
                            <input type="text" class="form-control" id="goodId" name="goodId" value=""/>
                        </div>

                        <div class="form-group">
                            <label class="">商品名称：</label>
                            <input type="text" class="form-control" id="goodName" name="goodName" value=""/>
                        </div>
                        <div class="form-group">
                            <label class="">商品类别：</label>
                            <select class="form-control" id="goodType" name="goodType" style="width: 300px">
                                <c:forEach items="${goodsType}" var="type">
                                    <option>${type.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="userLabel" >商品数量：</label>
                            <input type="number" class="form-control" id="amount" name="amount" min="0" value="" />
                        </div>
                        <div class="form-group">
                            <label class="userLabel" >商品单价(元)：</label>
                            <input  type="number" min="0" max="99999999" class="form-control" id="price" name="price" value="" />


                        </div>
                        <div class="form-group">
                            <label class="userLabel" >商品描述：</label>
                            <input type="text" class="form-control" id="description" name="description" value="" />
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

                $.post("/storageManagement/addGood.do",$("#modalForm").serialize(),function (data) {
                    if(data.status=="success"){
                        alert("添加成功");
                        window.location.reload();
                    }else{
                        alert("添加失败");
                    }
                });
            },

            errorPlacement:function(error,element) {
                element.prev().append(error);
            },

            success:"checked",
            rules: {
                goodId: {
                    required: true,
                    minlength: 2,
                    maxlength:30,
                },
                amount:{
                    required:true,
                },
                price:{
                    required:true,
                },

                goodName:{
                    required:true,
                    maxlength:50,
                },
                goodType: {
                    required: true,
                    maxlength:50,
                },
            },
            messages: {
                goodId: {
                    required: "请输入商品名",
                    minlength: "长度为2-30个字符"
                },

            }
        });

    });


</script>
</html>
