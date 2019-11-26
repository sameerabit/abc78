<jsp:include page="index.jsp"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<body>
<div class="container my-5">
    <div class="card">
        <div class="card-header">
            Sales
        </div>
        <div class="card-body">
            <form action="/category/list">
                <div class="form-group row">
                    <div class="col-sm-6 mx-auto">
                        <input class="form-control" type="text" name="search">
                    </div>
                    <div class="col">
                        <input type="submit" class="btn btn-info" value="Search">
                    </div>
                    <div class="col text-right">
                        <a href="/category/" class="btn btn-info" >New Sale</a>
                    </div>
                </div>
            </form>

<table class="table" >
    <thead class="thead-light">
    <tr>
        <th scope="col">#</th>
        <th scope="col">Customer</th>
        <th scope="col">Order Date</th>
        <th scope="col">Discount Given(%)</th>
        <th scope="col">Total(Rs.)</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${saleList}" var="sale">
        <tr>
            <td>${sale.id}</td>
            <td>${sale.customer.name}</td>
            <td>${sale.orderDate}</td>
            <td>${sale.totalDiscount}%</td>
            <td>${sale.total}</td>
            <td><a href="/sale/show/${sale.id}">View</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
        </div>

    </div>


</div>

</body>
</html>