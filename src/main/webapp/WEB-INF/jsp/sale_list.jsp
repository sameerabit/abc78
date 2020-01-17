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
            <a href="/sale/" class="btn btn-info pull-right" >New Sale</a>
        </div>
        <div class="card-body">
            <form action="/sale/list">
                <div class="form-group row">
                    <dov class="col-1">
                        <lable>Start</lable>
                    </dov>
                    <div class="col-4">
                        <input class="form-control" id="start" name="start"  type="date" placeholder="Start" >
                    </div>
                    <dov class="col-1">
                        <lable>End</lable>
                    </dov>
                    <div class="col-4">
                        <input class="form-control" id="end" name="end"  type="date" placeholder="End" >
                    </div>
                    <div class="col-2">
                        <input type="submit" class="btn btn-info" value="Search">
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