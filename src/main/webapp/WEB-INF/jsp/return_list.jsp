<jsp:include page="index.jsp"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<body>
<div class="container my-5">
    <div class="card">
        <div class="card-header">
            Returns
        </div>
        <div class="card-body">
            <form action="/sale/return_list">
                <div class="form-group row">
                    <dov class="col-1">
                        <lable>Start</lable>
                    </dov>
                    <div class="col-4">
                        <input class="form-control" name="start"  type="date" placeholder="Start" >
                    </div>
                    <dov class="col-1">
                        <lable>End</lable>
                    </dov>
                    <div class="col-4">
                        <input class="form-control" name="end"  type="date" placeholder="End" >
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
        <th scope="col">Sale ID</th>
        <th scope="col">Returned Date</th>
        <th scope="col">Returned Price</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${returnList}" var="returns">
        <tr>
            <td>${returns.id}</td>
            <td>${returns.sale.id}</td>
            <td>${returns.returnDate}</td>
            <td>${returns.total}</td>
            <td><a href="/sale/return/show/${returns.id}">View</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
        </div>

    </div>


</div>

</body>
</html>