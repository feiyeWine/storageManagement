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

</head>
<body>
<button id="addType" class="btn-info" data-target="#addModal" data-toggle="modal" style="margin-left: 400px;">添加新类别</button>
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <tr>
        <th>序号</th>
        <th>商品类别</th>
        <th>创建时间</th>
        <th>操作</th>
    </tr>
    </thead>

    <tbody>
        <c:forEach items="${types}" var="type">
            <tr>
                <td>${type.id}</td>
                <td>${type.name}</td>
                <td><fmt:formatDate value="${type.datetime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>

                 <td>  <a class="modalA" href="#deleteModal" data-toggle="modal" title="删除此类别">删除<img src="jsp/img/icons/actions/delete.png" alt="" /></a></td>

            </tr>
        </c:forEach>

    </tbody>
</table>

<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 style="font-weight: bold" class="modal-title" id="myModalLabel">
                    添加新商品类别
                </h4>
            </div>
            <div class="modal-body">
                <!--添加文本-->
                <div>
                    <span>输入新类别名称：</span>
                    <form id="addForm" name="modalForm" class="form" action="/storage/addType.do" method="post">
                        <input type="text" class="control-label" id="type" name="type" value="" />
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">关闭
                            </button>

                            <button id="add" type="button" class="btn btn-primary">
                                确认添加
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
                    <span>是否删除此商品类别？删除后不可恢复</span>
                    <form id="deleteForm" name="modalForm" class="form" action="" method="post">
                        <input type="text" class="control-label" id="id2" name="id" value="" style="display: none"/>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">关闭
                            </button>

                            <button id="delete" type="button" class="btn btn-primary">
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
    $(".modalA").click(function(){
        var $td = $(this).parents("tr").children("td");

        $("#id2").val($td.eq(0).text());
    });


    $("#delete").click(function(){
        $.post("/storageManagement/deleteType.do",{"id":$("#id2").val()},function(data){
            if(data.status=="success"){
                window.location.reload();
            }else{
                alert("删除失败");
            }
        })
    });

    $("#add").click(function(){
        $.post("/storageManagement/addType.do",{"type":$("#type").val()},function(data){
            if(data.status=="success"){
                window.location.reload();
            }else{
                alert("添加失败");
            }
        })
    });
</script>

</html>