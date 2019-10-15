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

        input[type=text] input[type=select] {
            width: 300px !important;
            height: 35px !important;
        }
    </style>
</head>
<div class="container">
    <form:form method="POST" action="/expense/save" modelAttribute="expense">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="expense_name">Name :</label>
            <div class="col-sm-10">
                <form:input type="text" class="form-control" id="expense_name" path="name"/>
                <form:input type="hidden" class="form-control" id="expense" path="id"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="date">Date:</label>
            <div class="col-sm-10">
                <form:input type="date" class="form-control" id="date" path="date"/>
            </div>
        </div>
        <div style="float: right;margin-bottom: 10px;">
            <input type="submit" class="btn btn-primary" id="saveButton" value="Save"/>
        </div>
    </form:form>
</div>