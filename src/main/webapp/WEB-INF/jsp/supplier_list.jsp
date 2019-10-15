<jsp:include page="index.jsp"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<body>
<div class="container">
<div class="float-none">
    <h5>Suppliers List</h5>

</div>
<table class="table" style="width: 80%">
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
            <td><a href="/supplier/show/${supplier.id}">View</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</div>

</body>
</html>