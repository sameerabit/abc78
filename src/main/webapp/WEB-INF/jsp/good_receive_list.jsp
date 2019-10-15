<jsp:include page="index.jsp"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<body>
<div class="container">
<div class="float-none">
    <h5>Good Receive Note List</h5>

</div>
<table class="table" style="width: 80%">
    <thead class="thead-light">
    <tr>
        <th scope="col">#</th>
        <th scope="col">Supplier</th>
        <th scope="col">Date</th>
        <th colspan="2" scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${goodReceiveNoteList}" var="goodReceiveNote">
        <tr>
            <td>${goodReceiveNote.id}</td>
            <td>${goodReceiveNote.supplier.name}</td>
            <td>${goodReceiveNote.orderDate}</td>
            <td><a class="btn btn-primary" href="/grn/show/${goodReceiveNote.id}">View</a></td>
            <td><a class="btn btn-danger" href="/grn/delete/${goodReceiveNote.id}">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</div>

</body>
</html>