<jsp:include page="index.jsp"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<body>
<div class="container my-5">
    <div class="card">
        <div class="card-header">
            Good Receive Notes
            <a href="/category/" class="btn btn-info pull-right" >Add New Order</a>

        </div>
        <div class="card-body">
            <form action="/category/list">
                <div class="form-group row">
                    <dov class="col-1">
                        <lable>Start</lable>
                    </dov>
                    <div class="col-4">
                        <input class="form-control"  type="date" placeholder="Start" >
                    </div>
                    <dov class="col-1">
                        <lable>End</lable>
                    </dov>
                    <div class="col-4">
                        <input class="form-control"  type="date" placeholder="End" >
                    </div>
                    <div class="col-2">
                        <input type="submit" class="btn btn-info" value="Search">
                    </div>
                </div>
            </form>

<table class="table">
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
    </div>

</div>

</body>
</html>