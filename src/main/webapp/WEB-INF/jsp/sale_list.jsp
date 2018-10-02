<jsp:include page="index.jsp"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<body>
<div class="container">
<div class="float-none">
    <h5>Sales List</h5>

</div>
<table class="table" style="width: 80%">
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

</body>
</html>