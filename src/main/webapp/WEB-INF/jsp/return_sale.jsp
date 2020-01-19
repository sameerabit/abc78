<jsp:include page="index.jsp"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <style type="text/css">
        .ui-dialog {
            width: 600px !important;
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
                if(this.flatten().count() != 0){
                    return this.flatten().reduce(function (a, b) {
                        return (a * 1) + (b * 1); // cast values in-case they are strings
                    });
                }
                return 0;

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
                        headers: {
                            "X-CSRF-TOKEN": $('#_csrf_token').val()
                        },
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
                        headers: {
                            "X-CSRF-TOKEN":$('#_csrf_token').val()
                        },
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
                event.preventDefault();
                item = $('#item').val();
                price = $('#price').val();
                qty = $('#qty').val();
                discount = $('#discount').val();
                returnQty = $('#returnQty').val();

                itemId = $('#item_id').val();
                table.row.add([
                    item,
                    price,
                    qty,
                    price * (discount / 100) * qty,
                    price * qty * (1 - (discount / 100)),
                    returnQty,
                    itemId,
                    $('#sale_index').val()
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
                    $('#item_index').val("");
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
                dom: 'Bfrtip',
                buttons: [
                    'print'
                ],
                "columnDefs": [
                    {
                        "targets": [6],
                        "visible": false,
                        "searchable": false
                    },
                    {
                        "targets": [7],
                        "visible": false,
                        "searchable": false
                    },
                    {
                        "targets": [8],
                        "data": null,
                        "defaultContent": "<button class='btn show'>Show</button>"
                    },
                ]
            });


            var saleId = $('#saleId').val();
            if (saleId != "") {
                $.ajax({
                    headers: {
                        "X-CSRF-TOKEN": $('#_csrf_token').val()
                    },
                    url: "/api/sale/show",
                    data: {sale: saleId},
                    success: function (sale) {
                        $("#orderDate").datepicker("setDate", new Date(sale.orderDate));
                        $('#totalDiscount').val(sale.totalDiscount);
                        sale.saleOrderDetail.forEach(function (row) {
                            table.row.add([
                                row.item.name,
                                row.price,
                                row.quantity,
                                row.discount,
                                row.total,
                                0.00,
                                row.item.id,
                                row.id,
                            ]).draw(false);
                        });
                    },
                });
            }

            $('#employeesTable tbody').on('click', '.show', function () {
                var rowData = table.row($(this).parents('tr')).data();
                console.log(rowData);
                discount = (rowData[3] * 100) / (rowData[1] * rowData[2]);
                item = $('#item').val(rowData[0]);
                price = $('#price').val(rowData[1]);
                qty = $('#qty').val(rowData[2]);
                discount = $('#discount').val(discount);
                itemId = $('#item_id').val(rowData[6]);
                saleindex = $('#sale_index').val(rowData[7]);

                $('#dialog').dialog('open');
                $('#item_index').val(table.row($(this).parents('tr')).index());
            });

            $('#employeesTable tbody').on('click', '.icon-remove', function () {
                console.log($(this).parents('tr'));
                table.row($(this).parents('tr')).remove().draw();
                calulateTotal();
            });

            $("#employeesTable").on('search.dt', function () {
                calulateTotal();
            });

            $("#totalDiscount").keyup(function () {
                calulateTotal();
            });

            function formatData(saleTableData) {
                var formattedData = [];
                console.log(saleTableData);
                saleTableData.forEach(function (data) {
                    var formattedRow = {};
                    formattedRow['sellingPrice'] = data[1];
                    formattedRow['quantity'] = data[5];
                    formattedRow['item'] = {'id': data[6]};
                    formattedData.push(formattedRow);
                });
                return formattedData;
            }

            function getFormData($form) {
                var unindexed_array = $form.serializeArray();
                var indexed_array = {};

                $.map(unindexed_array, function(n, i) {
                    indexed_array[n["name"]] = n["value"];
                });

                return indexed_array;
            }



            $('#saveButton').click(function (event) {
                var saleTableData = table.data().toArray();
                console.log(saleTableData);
                formattedData = formatData(saleTableData);
                totalDiscount = $('#totalDiscount').val();
                saleId = $('#saleId').val();
                customer = $('#customer').val();
                orderDate = $('#orderDate').val();
                var postdata = {};
                postdata = {
                    sale: {
                        id: saleId
                    },
                    returnDate: orderDate,
                    goodReturnNoteDetail: formattedData
                };
                var token = $('#_csrf_token').val();
                var header = "X-CSRF-TOKEN";
                $.ajax({
                    headers: {
                        "X-CSRF-TOKEN":token
                    },
                    type: "POST",
                    url: "/api/return/save",
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    data: JSON.stringify(postdata),
                    success: function (response) {
                        alert('Successfully Returned');
                    },
                });
            });

        });
    </script>
</head>
<body>
    <div class="container">
    <form novalidate id="dialog" title="Add Item">
        <div class="form-group row">
            <label class="col-4 col-form-label" for="item">Item:</label>
            <input type="hidden" class="form-control" id="item_id"/>
            <input type="hidden" class="form-control" id="item_index"/>
            <input type="hidden" class="form-control" id="sale_index"/>
            <input class="form-control col-8" type="text" id="item"/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        </div>
        <div class="form-group row">
           <%--<label class="col-4 col-form-label" for="price">Price : </label>--%>
            <input class="form-control col-8" id="price" type="hidden"/>
        </div>
        <div class="form-group row">
            <label class="col-4 col-form-label" for="qty">Quantity : </label>
            <input disabled class="form-control col-8" id="qty" type="number"/>
        </div>
        <div class="form-group row">
            <%--<label class="col-4 col-form-label" for="discount">Discount : </label>--%>
            <input class="form-control col-8" id="discount" type="hidden"/>
        </div>
        <div class="form-group row">
            <label class="col-4 col-form-label" for="returnQty">Return : </label>
            <input class="form-control col-8" id="returnQty" type="number"/>
        </div>
        <div class="form-group row float-right">
            <input class="btn btn-success" type="submit" id="addItem" value="Add">
        </div>
    </form>
    </div>
    <div class="container mt-3">

        <div class="row">
            <div class="col text-center">
                <h3>Create Return on Sales</h3>
            </div>

        </div>
    </div>
<div class="container mt-5">
    <form:form method="POST" action="/sale/save" modelAttribute="sale">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="customer">Customer:</label>
            <div class="col-sm-4">
                <form:input type="text" disabled="disabled" class="form-control" id="customer_name" path="customer.name"/>
                <form:input type="hidden" class="form-control" id="customer" path="customer.id"/>
                <form:input type="hidden" class="form-control" id="saleId" path="id"/>
                <input id="_csrf_token" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <%--<input id="_csrf_header" type="hidden" name="${_csrf.parameterName}" value="${_csrf.header}"/>--%>

            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="orderDate">Date:</label>
            <fmt:formatDate type="date"   value="${sale.orderDate}" var="orderDate"/>
            <div class="col-sm-4">
                <form:input id="orderDate" disabled="disabled" class="datepicker form-control" path="orderDate"/>
            </div>
        </div>
        <div style="float: right;margin-bottom: 10px;">
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
            <th>Returned Qty</th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tfoot>
        <tr>
            <%--<th style="text-align:right">Discount:<input type="number" id="totalDiscount" value="0"></th>--%>
            <%--<th id="returnedTotal">0.00</th>--%>
            <%--<th>Discount Total</th>--%>
            <%--<th id="discountedPrice">0.00</th>--%>
            <%--<th style="text-align:right">Total</th>--%>
            <%--<th id="total"></th>--%>
            <%--<th></th>--%>
            <%--<th></th>--%>
            <%--<th></th>--%>

        </tr>
        </tfoot>
    </table>
</div>




</body>
</html>