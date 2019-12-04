<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html lang="en">

<head>
    <script src="/webjars/jquery/3.3.1-1/jquery.min.js"></script>
    <script src="/webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
    <script src="/webjars/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/webjars/bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/webjars/jquery-ui/1.12.1/jquery-ui.css">

    <link rel="stylesheet" href="/webjars/datatables/1.10.12/media/css/jquery.dataTables.min.css">
    <script src="/webjars/datatables/1.10.12/media/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="/webjars/font-awesome/3.2.1/css/font-awesome.min.css">
    <style type="text/css">
        h5 a {
            color: black !important;
        }
    </style>
</head>

<body>
<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">
    <a class="navbar-brand" href="#">ABC78 BOTIQUES</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="saleLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Sales
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="/sale/">Create</a>
                    <a class="dropdown-item" href="/sale/list">View</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="itemLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Items
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="/item/">Create</a>
                    <a class="dropdown-item" href="/item/list">View</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="supplierLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Suppliers
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="/supplier/">Create</a>
                    <a class="dropdown-item" href="/supplier/list">View</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="categoryLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="/category/">Create</a>
                    <a class="dropdown-item" href="/category/list">View</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="categoryLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Expenses
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="/expense/">Create</a>
                    <a class="dropdown-item" href="/expense/list">View</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="grnLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Good Receive Notes
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="/grn/">Create</a>
                    <a class="dropdown-item" href="/grn/list">View</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="usersLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Users
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="/user">Create</a>
                    <a class="dropdown-item" href="/users">View</a>
                </div>
            </li>
            <li class="nav-item">
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <form id="logoutForm" method="POST" action="${contextPath}/logout">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                        <span class="nav-link" >Welcome ${pageContext.request.userPrincipal.name} |
                            <a  onclick="document.forms['logoutForm'].submit()">Logout</a>
                        </span>
                    </c:if>
            </li>

        </ul>
    </div>
</nav>
<%--&lt;%&ndash;<c:if test="${ empty paramValues }" >&ndash;%&gt;--%>
<%--<div class="row">--%>
    <%--<div class="col-4">--%>
        <%--<div class="card text-white bg-danger m-5" >--%>
            <%--<div class="card-body">--%>
                <%--<h5 class="card-title"><a href="/item/stock">Stocks</a></h5>--%>
                <%--<p class="card-text"></p>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="col-4">--%>
        <%--<div class="card text-white bg-info m-5" >--%>
            <%--<div class="card-body">--%>
                <%--<h5 class="card-title"><a href="/item/stock">Sales</a></h5>--%>
                <%--<p class="card-text"></p>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="col-4">--%>
        <%--<div class="card text-white bg-primary m-5" >--%>
            <%--<div class="card-body">--%>
                <%--<h5 class="card-title"><a href="/item/stock">Purchases</a></h5>--%>
                <%--<p class="card-text"></p>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>

<%--</div>--%>

<%--<div class="row">--%>
    <%--<div class="col-4">--%>
        <%--<div class="card text-white bg-info m-5" >--%>
            <%--<div class="card-body">--%>
                <%--<h5 class="card-title"><a href="/item/stock">Expenses</a></h5>--%>
                <%--<p class="card-text"></p>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="col-4">--%>
        <%--<div class="card text-white bg-success m-5" >--%>
            <%--<div class="card-body">--%>
                <%--<h5 class="card-title"><a href="/item/stock">Fast Moving Items</a></h5>--%>
                <%--<p class="card-text"></p>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="col-4">--%>
        <%--<div class="card text-white bg-warning m-5" >--%>
            <%--<div class="card-body">--%>
                <%--<h5 class="card-title"><a href="/item/stock">Profit</a></h5>--%>
                <%--<p class="card-text"></p>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>

</div>
</body>
</html>

