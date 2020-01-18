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
                    <th scope="col">Sale No</th>
                    <th scope="col">Name</th>
                    <th scope="col">Selling Price</th>
                    <th scope="col">Buying Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Discount</th>
                    <th scope="col">Total</th>
                    <th scope="col">Profit</th>

                </tr>
                </thead>
                <tbody>
                <c:forEach items="${saleList}" var="sale">
                <c:forEach items="${sale.saleOrderDetail}" var="item">
                    <c:forEach items="${item.itemBatches}" var="batch">
                    <tr>
                        <td>${sale.id}</td>
                        <td >${item.item.name}</td>
                        <td align="right">${item.price}</td>
                        <td align="right">${batch.buyingPrice}</td>
                        <td align="right">${item.quantity}</td>
                        <td align="right">${item.discount}</td>
                        <td align="right">${item.total}</td>
                        <td align="right">${(item.price - batch.buyingPrice)*item.quantity}</td>

                    </tr>
                    </c:forEach>

                </c:forEach>
                </c:forEach>
                </tbody>
            </table>

            <table class="table m-auto">
                <thead class="thead-light">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th  scope="col">Selling Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Total</th>

                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${goodReturnNoteList}" var="grn">
                    <c:forEach items="${grn.goodReturnNoteDetail}" var="grnDetail">
                                <tr>
                                    <td>${grn.id}</td>
                                    <td>${grnDetail.item.name}</td>
                                    <td align="right">${grnDetail.sellingPrice}</td>
                                    <td align="right">${grnDetail.quantity}</td>
                                    <td align="right">${grnDetail.sellingPrice*grnDetail.quantity}</td>
                                </tr>
                    </c:forEach>
                    </c:forEach>
                </tbody>
            </table>


        </div>

    </div>


</div>

</body>
</html>