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
            <a href="/user" class="btn btn-info pull-right">New User</a>

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
                </div>
            </form>
            <table class="table" >
                <thead class="thead-light">
                <tr>
                    <th scope="col">User Name</th>
                    <th scope="col">User Role</th>
                    <th scope="col">#</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${users}" var="user">
                    <tr>
                        <td>${user.username}</td>
                        <td>${user.role.name}</td>
                        <td><a href="/user/edit/${user.username}">Update Password</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>
    </div>

</div>

</body>
</html>