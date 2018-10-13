<jsp:include page="index.jsp"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<body>
<div class="container">
    <div class="float-none">
        <h5>Item List</h5>

    </div>
    <table class="table" style="width: 80%">
        <thead class="thead-light">
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Description</th>
            <th scope="col">Category</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${items}" var="item">
            <tr>
                <td>${item.name}</td>
                <td>${item.description}</td>
                <td>${item.itemCategory.name}</td>
                <td><a href="/item/show/${item.id}">View</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

</body>
</html>