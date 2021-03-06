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

    <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>

    <link rel="stylesheet" href="/webjars/font-awesome/3.2.1/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css">
    <script src="/webjars/jquery-validation/1.19.0/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/js/jspdf.min.js"></script>


    <style type="text/css">
        .error {
            color: red;
        }

        .navbar-dark .navbar-nav .nav-link {
            color: white;
        }
    </style>
</head>

<body>
<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">
    <a class="navbar-brand" href="#">ABC<span class="bg-danger">78</span> BOTIQUES</a>
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
                    <a class="dropdown-item" href="/expenses/">Create</a>
                    <a class="dropdown-item" href="/expenses/list">View</a>
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
                <a class="nav-link dropdown-toggle" href="#" id="grnLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Good Return Notes
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="/sale/return_list">Return On Sales</a>
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
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="reportLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    REPORTS
                </a>
                <div class="dropdown-menu" aria-labelledby="reportLink">
                    <a class="dropdown-item" href="/reports/daily_sale">Daily Sales Report</a>
                    <a class="dropdown-item" href="/item/stock">Stock Report</a>
                    <a class="dropdown-item" href="/reports/range_sale">Date Wise Sales Report</a>
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

<div class="container my-5">
    <div class="row">
        <div class="col">
            <c:if test="${SUCCESS_MESSAGE != null}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                        ${SUCCESS_MESSAGE}
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            </c:if>
        </div>
    </div>
</div>
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

