<jsp:include page="index.jsp"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<body>
<div class="container my-5">
    <div class="card">
        <div class="card-header">
            Item List
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
                        <a href="/item/" class="btn btn-info" >New Item</a>
                    </div>
                </div>
            </form>
    <table class="table m-auto">
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
                <td>
                    <a href="/item/show/${item.id}">View</a>
                    <a href="/item/delete/${item.id}">Delete</a>
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