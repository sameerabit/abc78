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

            var token = $('#_csrf_token').val();


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
            $('#supplier_name').autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "/supplier/getSuppliersByNameLike",
                        headers: {
                            "X-CSRF-TOKEN":token
                        },
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
                    $('#supplier').val(ui.item.value);
                    $('#supplier_name').val(ui.item.label);
                }
            });

            $('#item').autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "/item/getItemsNameLike",
                        headers: {
                            "X-CSRF-TOKEN":token
                        },
                        data: {
                            name: request.term
                        },
                        dataType: 'json',
                        success: function (data) {
                            var autoCompleteList = [];
                            var goodReceiveNoteTableData = table.data().toArray();
                            if (goodReceiveNoteTableData.length != 0) {
                                goodReceiveNoteTableData.forEach(function (goodReceiveNote) {
                                    data.forEach(function (row, index) {
                                        if (row.value == goodReceiveNote[4]) {
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
                itemId = $('#item_id').val();
                table.row.add([
                    item,
                    price,
                    qty,
                    price*qty,
                    itemId,
                    ''
                ]).draw(false);
                item = $('#item').val("");
                price = $('#price').val("");
                qty = $('#qty').val("");
                itemId = $('#item_id').val("");
                $('#dialog').dialog('close');
                var item_index = $('#item_index').val();
                if (item_index != "") {
                    table.row(item_index).remove().draw(false);
                    $('#item_index').val("");
                }
            });

            function calulateTotal() {
                completeTotal = table.column(3, {page: 'current'}).data().sum();
                $("#total").text(completeTotal);
            }

            table = $('#employeesTable').DataTable({
                "columnDefs": [
                    {
                        "targets": [4],
                        "visible": false,
                        "searchable": false
                    },
                    {
                        "targets": [5],
                        "visible": false,
                        "searchable": false
                    },
                    {
                        "targets": [6],
                        "data": null,
                        "defaultContent": "<button class='btn'><i class=\"icon-remove\"></i></button>"
                    },
                    {
                        "targets": [7],
                        "data": null,
                        "defaultContent": "<button class='btn show'>Show</button>"
                    },
                ]
            });


            var goodReceiveNoteId = $('#goodReceiveNoteId').val();
            if (goodReceiveNoteId != "") {
                var token = $('#_csrf_token').val();
                $.ajax({
                    url: "/api/grn/show",
                    headers: {
                        "X-CSRF-TOKEN":token
                    },
                    data: {grnId: goodReceiveNoteId},
                    success: function (goodReceiveNote) {
                        $("#orderDate").datepicker("setDate", new Date(goodReceiveNote.orderDate));
                        goodReceiveNote.goodReceiveNoteDetail.forEach(function (row) {
                            table.row.add([
                                row.item.name,
                                row.buyingPrice,
                                row.quantity,
                                row.total,
                                row.item.id,
                                row.id,
                            ]).draw(false);
                        });
                        calulateTotal();
                    },
                });
            }

            $('#employeesTable tbody').on('click', '.show', function () {
                var rowData = table.row($(this).parents('tr')).data();
                item = $('#item').val(rowData[0]);
                price = $('#price').val(rowData[1]);
                qty = $('#qty').val(rowData[2]);
                itemId = $('#item_id').val(rowData[4]);
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

            function formatData(goodReceiveNoteTableData) {
                var formattedData = [];
                goodReceiveNoteTableData.forEach(function (data) {
                    var formattedRow = {};
                    formattedRow['buyingPrice'] = data[1];
                    formattedRow['quantity'] = data[2];
                    formattedRow['total'] = data[3];
                    formattedRow['item'] = {'id': data[4]};
                    formattedData.push(formattedRow);
                });
                return formattedData;
            }

            $('#saveButton').click(function (event) {
                var goodReceiveNoteTableData = table.data().toArray();
                formattedData = formatData(goodReceiveNoteTableData);
                goodReceiveNoteId = $('#goodReceiveNoteId').val();
                supplier = $('#supplier').val();
                orderDate = $('#orderDate').val();
                var token = $('#_csrf_token').val();
                var postdata = {};
                postdata =  {
                    id: goodReceiveNoteId,
                    supplier: {
                        id: supplier
                    },
                    orderDate: orderDate,
                    goodReceiveNoteDetails : formattedData
                };
                $.ajax({
                    type: "POST",
                    headers: {
                        "X-CSRF-TOKEN":token
                    },
                    url: "/api/grn/save",
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    data: JSON.stringify(postdata),
                    success: function (response) {
                            $('.alert').show();
                    },
                });
            });

        });
    </script>
</head>
<body>
<form id="dialog" title="Add Item">
    <div class="form-group row">
        <label class="col-sm-4 col-form-label" for="item">Item:</label>
        <input type="hidden" class="form-control" id="item_id"/>
        <input type="hidden" class="form-control" id="item_index"/>
        <input class="form-control col-sm-8" type="text" id="item"/>
        <%--this is important    &lt;%&ndash;<form:select id="supplier" class="form-control" path="supplier.id" items="${supplierList}" itemValue="id" itemLabel="name" />&ndash;%&gt;--%>
        <%--<form:option value="supplier.id">supplier.name</form:option>--%>
        <%--<form:options items="${supplierList}" />--%>
    </div>
    <div class="form-group row">
        <label class="col-sm-4 col-form-label" for="price">Buying Price : </label>
        <input class="form-control col-sm-8" id="price" type="number"/>
    </div>
    <div class="form-group row">
        <label class="col-sm-4 col-form-label" for="qty">Quantity : </label>
        <input class="form-control col-sm-8" id="qty" type="number"/>
    </div>
    <div class="form-group row float-right">
        <input type="button" id="addItem" value="Add">
    </div>
</form>
</div>
<div class="container mt-3">
    <div class="row">
        <div class="col text-center">
            <h3>Good Receive Note</h3>
        </div>
    </div>
</div>
<div class="container">

    <form:form method="POST" action="/goodReceiveNote/save" modelAttribute="goodReceiveNote">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="supplier">Supplier:</label>
            <div class="col-sm-4">
                <form:input type="text" class="form-control" id="supplier_name" path="supplier.name"/>
                <form:input type="hidden" class="form-control" id="supplier" path="supplier.id"/>
                <form:input type="hidden" class="form-control" id="goodReceiveNoteId" path="id"/>
                <input id="_csrf_token" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="orderDate">Date:</label>
            <fmt:formatDate type="date" value="${goodReceiveNote.orderDate}" var="orderDate"/>
            <div class="col-sm-4">
                <form:input id="orderDate" class="datepicker form-control" path="orderDate"/>
            </div>
        </div>
        <div style="float: right;margin-bottom: 10px;">
            <input type="button" id="addRow" class="btn btn-primary" value="Add Row"/>
            <input type="button" class="btn btn-primary" id="saveButton" value="Submit"/>
        </div>
    </form:form>

    <table id="employeesTable" class="display">
        <thead>
        <tr>
            <th>Item</th>
            <th>Buying Price</th>
            <th>Qty</th>
            <th class="sum">Total</th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tfoot>
        <tr>
            <th colspan="3">Total</th>
            <th id="total"></th>
            <th ></th>
            <th ></th>
            <th ></th>
            <th ></th>

        </tr>
        </tfoot>
    </table>
</div>


</body>
</html>