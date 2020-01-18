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
                Expenses
            </div>
            <div class="card-body">
    <form:form method="POST" action="/expenses/save" modelAttribute="expense">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="date">Date:</label>
            <fmt:formatDate type="date" value="${expense.date}" var="date" pattern="yyyy-MM-dd"/>
            <div class="col-sm-10">
                <form:input type="date" id="date" class="form-control" path="date"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="expense_name">Amount :</label>
            <div class="col-sm-10">
                <form:input type="number" class="form-control" id="amount" path="amount"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="expense_name">Reason :</label>
            <div class="col-sm-10">
                <form:input type="textarea" class="form-control" id="expense_name" path="name"/>
                <form:input type="hidden" class="form-control" id="expense" path="id"/>
            </div>
        </div>
        <div class="form-group row">
            <div class="col">
                <input type="submit" class="btn btn-primary" id="saveButton" value="Save"/>
            </div>
        </div>

    </form:form>
            </div>
        </div>
    </div>

</div>