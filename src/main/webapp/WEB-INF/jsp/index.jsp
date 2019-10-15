<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

</head>

<body>
<nav class="navbar navbar-expand-lg navbar navbar-dark bg-primary">
    <a class="navbar-brand" href="#"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
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
                <a class="nav-link dropdown-toggle" href="#" id="grnLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Good Receive Notes
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="/grn/">Create</a>
                    <a class="dropdown-item" href="/grn/list">View</a>
                </div>
            </li>
        </ul>
    </div>
</nav>
</body>
</html>