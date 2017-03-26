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
        <th>退货状态</th>
        <th>检验时间</th>
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
            <td>${good.amout}</td>
            <td>${good.price}.00</td>
            <td>${good.description}</td>
            <td>${good.status}</td>
            <td><fmt:formatDate value="${good.checktime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td class="actions"><a class="modalA" href="#myModal"  data-toggle="modal" title="退货">退货<img src="jsp/img/icons/actions/edit.png" alt="" /></a>
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
                    退货处理
                </h4>
            </div>
            <div class="modal-body">
                <!--添加文本-->
                <div>
                    <form id="modalForm" name="modalForm" class="form" action="" method="post">
                        <!--<label class="label-default">id</label>-->
                        <div class="form-group">
                            <input type="text" class="control-label" id="id" name="id" value="" style="display: none;"/>
                        是否确认退货？
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

</body>
<script type="text/javascript">


    $(function(){

        $(".modalA").click(function(){
            var $td = $(this).parents("tr").children("td");
            /*$("#id").val($td.eq(0).text());
             $("#memberName").val($td.eq(1).text()) ;
             $("#memberPhoneNum").val($td.eq(2).text()) ;
             $("#memberEmail").val($td.eq(3).text()) ;*/

            $("#id").val($td.eq(0).text());

        });

        $("#submit").click(function(){
            $.post("/storageManagement/returning.do",$("#modalForm").serialize(),function(data){
                if(data.status=="success"){
                    window.location.reload();
                }else{
                    alert("退货失败");
                }

            })});
    });



</script>
</html>
