<jsp:include page="index.jsp"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<body>
<div class="container border my-5">
    <div class="my-3 mx-auto d-flex" style="width: 80%">
        <h4>Category List</h4>

    </div>
    <table class="table m-auto" style="width: 80%">
        <thead class="thead-light">
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Description</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${itemCategories}" var="itemCategory">
            <tr>
                <td>${itemCategory.name}</td>
                <td>${itemCategory.description}</td>
                <td><a href="/category/show/${itemCategory.id}">View</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

</body>
</html>