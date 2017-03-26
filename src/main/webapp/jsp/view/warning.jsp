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
        <th>商品编号</th>
        <th>名称</th>
        <th>类别</th>
        <th>数量</th>
        <th>单价(元)</th>
        <th>商品描述</th>
    </tr>
    </thead>

    <tbody>
    <c:forEach items="${goods}" var="good">
        <tr>
            <td>${good.goodId}</td>
            <td>${good.goodName}</td>
            <td>${good.goodType}</td>
            <td>${good.amount}</td>
            <td>${good.price}.00</td>
            <td>${good.description}</td>

           <%-- <td><fmt:formatDate value="${good.intime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>--%>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
