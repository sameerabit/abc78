<jsp:include page="index.jsp"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<body>
<div class="container">
<div class="float-none">
    <h5>Users</h5>

</div>
<table class="table" style="width: 80%">
    <thead class="thead-light">
    <tr>
        <th scope="col">User Name</th>
        <th scope="col">#</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.username}</td>
            <td><a href="/user/edit/${user.username}">Update Password</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</div>

</body>
</html>