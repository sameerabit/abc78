<jsp:include page="index.jsp"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <style type="text/css">
        div.container {
            width: 70%;
            margin-top: 10px;
        }

        body{
            height: 100vh;
        }
    </style>
</head>
<div class="container h-100 d-flex">
    <div class="m-auto" style="height: 400px;width: 700px;">
        <div class="card">
            <div class="card-header">
                Supplier
            </div>
            <div class="card-body">
    <form:form method="POST" action="/supplier/save" modelAttribute="supplier">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="supplier">Name :</label>
            <div class="col-sm-10">
                <form:input type="text" class="form-control" id="supplier_name" path="name"/>
                <form:errors cssClass="text-danger" path="name"></form:errors>
                <form:input type="hidden" class="form-control" id="supplier" path="id"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="address">Address:</label>
            <div class="col-sm-10">
                <form:input type="text" class="form-control" id="address" path="address"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="address">Email:</label>
            <div class="col-sm-10">
                <form:input type="email" class="form-control" id="email" path="email"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="address">Tel:</label>
            <div class="col-sm-10">
                <form:input type="number" class="form-control" id="telNo" path="telNo"/>
            </div>
        </div>
        <div style="float: right;margin-bottom: 10px;">
            <input type="submit" class="btn btn-primary" id="saveButton" value="Save"/>
        </div>
    </form:form>
</div>
        </div>
    </div>
</div>
