<jsp:include page="index.jsp"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>

    <script>

        $(function () {

          //  $("#date").datepicker();
       //     $("#date").datepicker().datepicker("setDate", new Date());
         //   $("#date").datepicker("option", "dateFormat", "yy-MM-dd");
       //     $("#date").datepicker().datepicker("setDate",$('#date').val());
         //   debugger;
        });
    </script>
</head>
<div class="container">
    <form:form method="POST" action="/expenses/save" modelAttribute="expense">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="expense_name">Name :</label>
            <div class="col-sm-10">
                <form:input type="text" class="form-control" id="expense_name" path="name"/>
                <form:input type="hidden" class="form-control" id="expense" path="id"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="date">Date:</label>
            <fmt:formatDate type="date" value="${expense.date}" var="date" pattern="yyyy-MM-dd"/>
            <div class="col-sm-10">
                <form:input type="date" id="date" class="form-control" path="date"/>
            </div>
        </div>
        <div class="form-group row">
            <div class="col">
                <input type="submit" class="btn btn-primary" id="saveButton" value="Save"/>
            </div>
        </div>

    </form:form>
</div>