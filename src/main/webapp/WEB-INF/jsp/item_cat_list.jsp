<jsp:include page="index.jsp"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<body>
<div class="container my-5">
    <div class="card">
        <div class="card-header">
            Category List
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
                        <a href="/category/" class="btn btn-info" >New Category</a>
                    </div>
                </div>
            </form>

            <table class="table m-auto">
                <thead class="thead-light">
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Description</th>
                    <th colspan="2" scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${itemCategories}" var="itemCategory">
                    <tr>
                        <td>${itemCategory.name}</td>
                        <td>${itemCategory.description}</td>
                        <td>
                            <a href="/category/show/${itemCategory.id}">View</a>
                            <a href="/category/delete/${itemCategory.id}">Delete</a>

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