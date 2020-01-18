<jsp:include page="index.jsp"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<body>
<div class="container my-5">
    <div class="card">
        <div class="card-header">
            Expense List
        </div>

        <div class="card-body">
            <form action="/expenses/list">
                <div class="form-group row">
                    <%--<div class="col-sm-6 mx-auto">--%>
                        <%--<input class="form-control" type="text" name="search">--%>
                    <%--</div>--%>
                    <%--<div class="col">--%>
                        <%--<input type="submit" class="btn btn-info" value="Search">--%>
                    <%--</div>--%>
                    <div class="col text-right">
                        <a href="/expenses/" class="btn btn-info" >New Expense</a>
                    </div>
                </div>
            </form>
<table class="table">
    <thead class="thead-light">
    <tr>
        <th scope="col">Date</th>
        <th scope="col">Reason</th>
        <th scope="col">Amount</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${expenses}" var="expense">
        <tr>
            <td>${expense.date}</td>
            <td>${expense.name}</td>
            <td>${expense.amount}</td>
            <td>
                <a href="/expenses/show/${expense.id}">View</a>
                <a href="/expenses/delete/${expense.id}">Delete</a>

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