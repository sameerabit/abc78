<jsp:include page="../index.jsp"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<body>
<div class="container my-5">
    <div class="card">
        <div class="card-header">
            Daily Sales Report
        </div>
        <div class="card-body">
            <form action="/report/sale">
                <div class="form-group row">
                    <div class="col-sm-6 mx-auto">
                        <input class="form-control" type="date" name="date">
                    </div>
                    <div class="col">
                        <input type="submit" class="btn btn-info" value="Search">
                    </div>
                    <div class="col text-right">
                        <a href="/item/" class="btn btn-info" >PRINT</a>
                    </div>
                </div>
            </form>

            <div class="row">
                <div class="col-6">
                    <h6>#ID: ${sale.id}</h6>
                    <h6>#Date: ${sale.orderDate}</h6>
                </div>
                <div class="col-6">
                    <h6>#ID: ${sale.customer.name}</h6>
                </div>
            </div>
            <table class="table m-auto">
                <thead class="thead-light">
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Category</th>
                    <th scope="col">Quantity</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${sale.saleOrderDetail}" var="item">
                    <tr>
                        <td>${item.item.name}</td>
                        <%--<td>${item[0].itemCategory.name}</td>--%>
                        <%--<td>${item[1]}</td>--%>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

    </div>


</div>

</body>
</html>