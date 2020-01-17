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
                itemId = $('#item_id').val();
                table.row.add([
                    item,
                    price,
                    qty,
                    qty*price,
                    itemId,
                    $('#grnd_id').val()
            ]).draw(false);
                item = $('#item').val("");
                price = $('#price').val("");
                qty = $('#qty').val("");
                itemId = $('#item_id').val("");
                $('#dialog').dialog('close');
                var grn_index = $('#item_index').val();
                if (grn_index != "") {
                    table.row(grn_index).remove().draw(false);
                    $('#grn_index').val("");
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
                        "targets": [4],
                        "visible": true,
                        "searchable": false
                    },
                    {
                        "targets": [5],
                        "visible": true,
                        "searchable": false
                    },
                    {
                        "targets": [6],
                        "data": null,
                        "defaultContent": "<button class='btn show'>Show</button>"
                    },
                ]
            });


            var grnId = $('#grnId').val();
            if (grnId != "") {
                $.ajax({
                    headers: {
                        "X-CSRF-TOKEN": $('#_csrf_token').val()
                    },
                    url: "/api/return/show",
                    data: {grnId: grnId},
                    success: function (grn) {
                        $("#orderDate").datepicker("setDate", new Date(grn.returnDate));
                        grn.goodReturnNoteDetail.forEach(function (row) {
                            table.row.add([
                                row.item.name,
                                row.sellingPrice,
                                row.quantity,
                                row.sellingPrice * row.quantity,
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
                item = $('#item').val(rowData[0]);
                price = $('#price').val(rowData[1]);
                qty = $('#qty').val(rowData[2]);
                itemId = $('#item_id').val(rowData[4]);
                itemId = $('#grnd_id').val(rowData[5]);

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
                    formattedRow['quantity'] = data[2];
                    formattedRow['item'] = {'id': data[4]};
                    formattedRow['id'] = data[5];
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
                grnId = $('#grnId').val();
                customer = $('#customer').val();
                orderDate = $('#orderDate').val();
                var postdata = {};
                postdata = {
                    id: grnId,
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
            <input type="hidden" class="form-control" id="grnd_id"/>
            <input type="hidden" class="form-control" id="item_index"/>
            <input class="form-control col-8" type="text" id="item"/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        </div>
        <div class="form-group row">
            <label class="col-4 col-form-label" for="price">Price : </label>
            <input disabled class="form-control col-8" id="price" type="text"/>
        </div>
        <div class="form-group row">
            <label class="col-4 col-form-label" for="qty">Quantity : </label>
            <input class="form-control col-8" id="qty" type="number"/>
        </div>
        <div class="form-group row float-right">
            <input class="btn btn-success" type="submit" id="addItem" value="Add">
        </div>
    </form>
    </div>
    <div class="container mt-3">

        <div class="row">
            <div class="col text-center">
                <h3>Return Note</h3>
            </div>

        </div>
    </div>
<div class="container mt-5">
    <form:form method="POST" action="/sale/save" modelAttribute="grn">
        <div class="form-group row">
            <div class="col-sm-4">
                <form:input disabled="true" type="text"   class="form-control" id="grnId" path="id"/>
                <input id="_csrf_token" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <%--<input id="_csrf_header" type="hidden" name="${_csrf.parameterName}" value="${_csrf.header}"/>--%>

            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="orderDate">Date:</label>
            <fmt:formatDate type="date"   value="${grn.returnDate}" var="returnDate"/>
            <div class="col-sm-4">
                <form:input id="orderDate" disabled="disabled" class="datepicker form-control" path="returnDate"/>
            </div>
        </div>
        <div style="float: right;margin-bottom: 10px;">
            <input type="button" class="btn btn-primary" id="saveButton" value="Submit"/>
        </div>
    </form:form>
    <table id="employeesTable" class="display">
        <thead>
        <tr>
            <th>Item</th>
            <th>Price</th>
            <th>Qty</th>
            <th class="sum">Total</th>
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