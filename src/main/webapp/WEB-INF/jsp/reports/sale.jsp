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
            <form action="/reports/daily_sale">
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

            <table class="table m-auto">
                <thead class="thead-light">
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Selling Price</th>
                    <th scope="col">Buying Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Total</th>
                    <th scope="col">Discount</th>

                </tr>
                </thead>
                <tbody>
                <c:forEach items="${saleList}" var="sale">
                <c:forEach items="${sale.saleOrderDetail}" var="item">
                    <c:forEach items="${item.itemBatches}" var="batch">
                    <tr>
                        <td>${item.item.name}</td>
                        <td>${item.price}</td>
                        <td>${batch.buyingPrice}</td>
                        <td>${item.quantity}</td>
                        <td>${item.total}</td>
                        <td>${item.discount}</td>
                    </tr>
                    </c:forEach>

                </c:forEach>
                </c:forEach>
                </tbody>
            </table>
        </div>

    </div>


</div>

</body>
</html>