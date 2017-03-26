<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <th>商品编号</th>
        <th>名称</th>
        <th>类别</th>
        <th>数量</th>
        <th>单价(元)</th>
        <th>商品描述</th>
        <th>检验状况</th>
        <th>进货时间</th>
        <th>操作</th>
    </tr>
    </thead>

    <tbody>
    <c:forEach items="${goods}" var="good">
        <tr>
            <td>${good.id}</td>
            <td>${good.goodId}</td>
            <td>${good.goodName}</td>
            <td>${good.goodType}</td>
            <td>${good.amount}</td>
            <td>${good.price}.00</td>
            <td>${good.description}
            </td><td>${good.status}</td>
            <td><fmt:formatDate value="${good.datetime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td class="actions"><a class="modalA" href="#myModal"  data-toggle="modal" title="修改商品信息">修改<img src="jsp/img/icons/actions/edit.png" alt="" /></a>
                &nbsp;&nbsp;&nbsp;<a class="modalB" href="#deleteModal" data-toggle="modal" title="删除此商品">删除<img src="jsp/img/icons/actions/delete.png" alt="" /></a></td>
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
                    修改商品信息：
                </h4>
            </div>
            <div class="modal-body">
                <!--添加文本-->
                <div>
                    <form id="modalForm" name="modalForm" class="form" action="" method="post">
                        <!--<label class="label-default">id</label>-->
                        <div class="form-group">
                            <input type="text" class="control-label" id="id" name="id" value="" style="display: none"/>
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
                                <label class="">数量：</label>
                                <input type="number" class="form-control" min="0" max="99999999" id="amount" name="amount" value=""/>
                            </div>
                            <div class="form-group">
                                <label class="">单价：</label>
                                <input type="number" class="form-control" min="0" max="99999999" id="price" name="price" value=""/>
                            </div>
                            <div class="form-group">
                                <label class="">商品描述：</label>
                                <input type="text" class="form-control" id="description" name="description" value=""/>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">关闭
                            </button>

                            <button id="submit" type="button" class="btn btn-primary">
                                提交
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
                    <span>是否删除此商品信息？删除后不可恢复</span>
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

    $(function(){
        $(".modalA").click(function(){
            var $td = $(this).parents("tr").children("td");
            $("#id").val($td.eq(0).text());
             $("#goodId").val($td.eq(1).text()) ;
             $("#goodName").val($td.eq(2).text()) ;
             $("#goodType").val($td.eq(3).text()) ;
             $("#amount").val($td.eq(4).text()) ;

             $("#description").val($td.eq(6).text()) ;

            var arr = new Array();
            arr = $td.eq(5).text().split(".");
            $("#price").val(arr[0]) ;

        });
        $(".modalB").click(function(){
            var $td = $(this).parents("tr").children("td");
            $("#id2").val($td.eq(0).text());

        });

        $("#deleteButton").click(function(){
            $.post("/storageManagement/deleteGood.do",{"id":$("#id2").val()}, function (data) {
                if(data.status=="success"){
                    window.location.reload();
                }else{
                    alert("删除失败");
                }
            });
        });

        $("#submit").click(function(){
            $.post("/storageManagement/modifyGood.do",$("#modalForm").serialize(), function (data) {
                if(data.status=="success"){
                    window.location.reload();
                }else{
                    alert("修改失败");
                }
            });
        });

        $("#modalForm").validate({
            submitHandler: function(form) {

                $.post("/storageManagement/addGood.do",$("#modalForm").serialize(),function (data) {
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