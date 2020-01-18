<jsp:include page="../index.jsp"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script>

        $(function () {

            function addScript(url) {
                var script = document.createElement('script');
                script.type = 'application/javascript';
                script.src = url;
                document.head.appendChild(script);
            }
            addScript('https://raw.githack.com/eKoopmans/html2pdf/master/dist/html2pdf.bundle.js');


            $("#printBtn").click(function (event) {
                event.preventDefault();
                var element = document.getElementById('printBody');
                html2pdf(element);
            });


        });



    </script>
</head>
<body>
<div class="container my-5" id="printBody">
    <div class="card">
        <div class="card-header">
            <h4>Daily Sales Report</h4>
        </div>
        <div class="card-body">
            <form data-html2canvas-ignore="true" id="searchForm" action="/reports/range_sale">
                <div class="form-group row">
                    <div class="col-sm-4 mx-auto">
                        <input class="form-control" type="date" name="startDate">
                    </div>
                    <div class="col-sm-4 mx-auto">
                        <input class="form-control" type="date" name="endDate">
                    </div>
                    <div class="col">
                        <input type="submit" class="btn btn-info" value="Search">
                    </div>
                    <div class="col text-right">
                    </div>
                </div>
            </form>
            <div data-html2canvas-ignore="true" class="row">
                <div class="col text-right">
                    <button id="printBtn" class="btn btn-info" >Print</button>
                </div>
            </div>
            <h5>Sales</h5>
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

            <h5>Returns</h5>

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

            <h5>Expenses</h5>


            <div class="row">
                <div class="col-6">
                    <table class="table m-auto">
                        <thead class="thead-light">
                        <tr>
                            <th scope="col">Date</th>
                            <th  scope="col">Amount</th>
                            <th scope="col">Reason</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${expenseList}" var="expense">
                            <tr>
                                <td>${expense.id}</td>
                                <td>${expense.name}</td>
                                <td align="right">${expense.amount}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-6">
                    <h6>SUMMARY</h6>
                    <hr>
                    <div class="row">
                        <div class="col-8 text-right"><h6>Sales :</h6></div>
                        <div class="col-4 text-right">${totalSales}</div>
                    </div>
                    <div class="row">
                        <div class="col-8 text-right"><h6> Total Sales Profit :</h6></div>
                        <div class="col-4 text-right">${profit}</div>
                    </div>
                    <div class="row">
                        <div class="col-8 text-right"><h6> Total Returns :</h6></div>
                        <div class="col-4 text-right">${grnTotal}</div>
                    </div>
                    <div class="row">
                        <div class="col-8 text-right"><h6> Total Expenses :</h6></div>
                        <div class="col-4 text-right">${expTotal}</div>
                    </div>
                    <div class="row">
                        <div class="col-8 text-right"><h6>Cash On Hand :</h6></div>
                        <div class="col-4 text-right">${totalSales - (grnTotal+expTotal) }</div>
                    </div>
                    <div class="row">
                        <div class="col-8 text-right"><h5>Profit :</h5></div>
                        <div class="col-4 text-right"><h5>${profit - (grnTotal+expTotal)}</h5></div>
                    </div>
                </div>
            </div>

        </div>

    </div>


</div>

</body>
</html>