<jsp:include page="index.jsp"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<body>
<div class="container my-5">
    <div class="card">
        <div class="card-header">
            Supplier List
        </div>

        <div class="card-body">
            <form action="/item/list">
                <div class="form-group row">
                    <div class="col-sm-6 mx-auto">
                        <input class="form-control" type="text" name="search">
                    </div>
                    <div class="col">
                        <input type="submit" class="btn btn-info" value="Search">
                    </div>
                    <div class="col text-right">
                        <a href="/supplier/" class="btn btn-info" >New Supplier</a>
                    </div>
                </div>
            </form>
<table class="table">
    <thead class="thead-light">
    <tr>
        <th scope="col">Name</th>
        <th scope="col">Address</th>
        <th scope="col">Email</th>
        <th scope="col">Tel No</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${suppliers}" var="supplier">
        <tr>
            <td>${supplier.name}</td>
            <td>${supplier.address}</td>
            <td>${supplier.email}</td>
            <td>${supplier.telNo}</td>
            <td>
                <a href="/supplier/show/${supplier.id}">View</a>
                <a href="/supplier/delete/${supplier.id}">Delete</a>

            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

        </div>
    </div>

</div>

</body>
</html>