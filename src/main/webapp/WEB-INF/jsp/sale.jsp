<jsp:include page="index.jsp"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <head>
        <script src="/webjars/jquery/3.3.1-1/jquery.min.js"></script>
        <script src="/webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
        <script src="/webjars/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="/webjars/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="/webjars/jquery-ui/1.12.1/jquery-ui.css">

        <link rel="stylesheet" href="/webjars/datatables/1.10.12/media/css/jquery.dataTables.min.css">
        <script src="/webjars/datatables/1.10.12/media/js/jquery.dataTables.min.js"></script>
    </head>
    <style type="text/css">
        div.container {
            width: 70%;
            margin-top: 10px;
        }

        input[type=text] {
            width: 300px !important;
            height: 35px !important;
        }
    </style>
    <script>

        var editor;
        var table;
        var selectedRow;
        $(function () {

            $("#orderDate").datepicker();
            $("#orderDate").datepicker("option", "dateFormat", "yy-mm-dd");

            jQuery.fn.dataTable.Api.register('sum()', function () {
                return this.flatten().reduce(function (a, b) {
                    return (a * 1) + (b * 1); // cast values in-case they are strings
                });
            });


            $("#dialog").dialog({
                autoOpen: false
            });

            $("#addRow").click(function (event) {
                event.preventDefault();
                $('#dialog').dialog('open');
            });

            $(".datepicker").datepicker();
            $('#customer_name').autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "/customer/getCustomersByNameLike",
                        data: {
                            name: request.term
                        },
                        dataType: 'json',
                        success: function (data) {
                            response(data);
                        },

                    });
                },
                minLength: 1,
                select: function (event, ui) {
                    event.preventDefault();
                    $('#customer').val(ui.item.value);
                    $('#customer_name').val(ui.item.label);
                }
            });

            $('#item').autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "/item/getItemsNameLike",
                        data: {
                            name: request.term
                        },
                        dataType: 'json',
                        success: function (data) {
                            var autoCompleteList = [];
                            var saleTableData = table.data().toArray();
                            if (saleTableData.length != 0) {
                                saleTableData.forEach(function (sale) {
                                    data.forEach(function (row, index) {
                                        if (row.value == sale[5]) {
                                            delete data[index];
                                        }
                                    });
                                });
                            }
                            var compactArray = data.filter(function (item) {
                                return item !== undefined;
                            });
                            response(compactArray);
                        },

                    });
                },
                minLength: 1,
                select: function (event, ui) {
                    event.preventDefault();
                    $('#item_id').val(ui.item.value);
                    $('#item').val(ui.item.label);
                }
            });

            var counter = 1;

            $('#addItem').click(function (event) {
                item = $('#item').val();
                price = $('#price').val();
                qty = $('#qty').val();
                discount = $('#discount').val();
                itemId = $('#item_id').val();
                table.row.add([
                    item,
                    price,
                    qty,
                    price * (discount / 100) * qty,
                    price * qty * (1 - (discount / 100)),
                    itemId,
                ]).draw(false);
                item = $('#item').val("");
                price = $('#price').val("");
                qty = $('#qty').val("");
                discount = $('#discount').val("");
                itemId = $('#item_id').val("");
                $('#dialog').dialog('close');
                var item_index = $('#item_index').val();
                if (item_index != "") {
                    table.row(item_index).remove().draw(false);
                }
            });

            function calulateTotal() {
                completeTotal = table.column(4, {page: 'current'}).data().sum();
                totalDiscount = $("#totalDiscount").val();
                $('#discountedPrice').text(completeTotal * (totalDiscount / 100));
                finalTotal = completeTotal * (1 - (totalDiscount / 100));
                $("#total").text(finalTotal);
            }

            table = $('#employeesTable').DataTable({
                "columnDefs": [
                    {
                        "targets": [5],
                        "visible": false,
                        "searchable": false
                    }
                ]
            });

            $('#employeesTable tbody').on('click', 'tr', function () {
                var rowData = table.row(this).data();
                discount = (rowData[3] * 100) / (rowData[1] * rowData[2]);
                item = $('#item').val(rowData[0]);
                price = $('#price').val(rowData[1]);
                qty = $('#qty').val(rowData[2]);
                discount = $('#discount').val(discount);
                itemId = $('#item_id').val(rowData[5]);
                $('#dialog').dialog('open');
                $('#item_index').val(table.row(this).index());
            });

            $("#employeesTable").on('search.dt', function () {
                calulateTotal();
            });

            $("#totalDiscount").keyup(function () {
                calulateTotal();
            });

            function formatData(saleTableData) {
                var formattedData = [];
                saleTableData.forEach(function (data) {
                    var formattedRow = {};
                    formattedRow['price'] = data[1];
                    formattedRow['quantity'] = data[2];
                    formattedRow['discount'] = data[3];
                    formattedRow['total'] = data[4];
                    formattedRow['item'] = {'id': data[5]};
                    formattedData.push(formattedRow);
                });
                return formattedData;
            }

            $('#saveButton').click(function (event) {
                var saleTableData = table.data().toArray();
                formattedData = formatData(saleTableData);
                totalDiscount = $('#totalDiscount').val();
                customer = $('#customer').val();
                orderDate = $('#orderDate').val();
                var postdata = {};
                postdata.totalDiscount = totalDiscount;
                postdata.sale = {
                    customer: {
                        id: customer
                    },
                    orderDate: orderDate,
                    saleOrderDetail: formattedData
                };
                $.ajax({
                    type: "POST",
                    url: "/api/sale/save",
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    data: JSON.stringify(postdata),
                    success: function (response) {

                    },
                });
            });

        });
    </script>
</head>
<body>
<form id="dialog" title="Add Item">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label" for="item">Item:</label>
        <input type="hidden" class="form-control" id="item_id"/>
        <input type="hidden" class="form-control" id="item_index"/>
        <input class="form-control" type="text" id="item"/>
        <%--this is important    &lt;%&ndash;<form:select id="customer" class="form-control" path="customer.id" items="${customerList}" itemValue="id" itemLabel="name" />&ndash;%&gt;--%>
        <%--<form:option value="customer.id">customer.name</form:option>--%>
        <%--<form:options items="${customerList}" />--%>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label" for="price">Price : </label>
        <input class="form-control" id="price" type="number"/>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label" for="qty">Quantity : </label>
        <input class="form-control" id="qty" type="number"/>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label" for="discount">Discount : </label>
        <input class="form-control" id="discount" type="number"/>
    </div>
    <div class="form-group row float-right">
        <input type="button" id="addItem" value="Add">
    </div>
</form>
</div>
<div class="container">
    <form:form method="POST" action="/sale/save" modelAttribute="sale">
            <div class="form-group row">
                    <label class="col-sm-2 col-form-label" for="customer">Customer:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="customer_name"/>
                    <form:input type="hidden" class="form-control" id="customer" path="customer.id"/>
                </div>
            </div>
            <div class="form-group row">
                    <label class="col-sm-2 col-form-label" for="orderDate">Date:</label>
                    <fmt:formatDate type="text" value="${sale.orderDate}" var="orderDate"/>
                <div class="col-sm-10">
                    <form:input id="orderDate" class="datepicker form-control" path="orderDate" value="${orderDate}"/>
                </div>
            </div>
        <div style="float: right;margin-bottom: 10px;">
            <input type="button" id="addRow" class="btn btn-primary" value="Add Row"/>
            <input type="button" class="btn btn-primary" id="saveButton" value="Submit"/>
        </div>
    </form:form>
    <h5>Invoice</h5>
    <table id="employeesTable" class="display">
        <thead>
        <tr>
            <th>Item</th>
            <th>Price</th>
            <th>Qty</th>
            <th>Discount</th>
            <th class="sum">Total</th>
            <th></th>
        </tr>
        </thead>
        <tfoot>
        <tr>
            <th style="text-align:right">Discount:<input type="number" id="totalDiscount" value="0"></th>
            <th>Discount Total</th>
            <th id="discountedPrice">0.00</th>
            <th style="text-align:right">Total</th>
            <th id="total"></th>
            <th></th>
        </tr>
        </tfoot>
    </table>
</div>


</body>
</html>