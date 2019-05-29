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
    <form:form method="POST" action="/itemCategory/save" modelAttribute="itemCategory">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="itemCategory">Name :</label>
            <div class="col-sm-10">
                <form:input type="text" class="form-control" id="name" path="name"/>
                <form:input type="hidden" class="form-control" id="id" path="id"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="description">Description:</label>
            <div class="col-sm-10">
                <form:input type="text" class="form-control" id="description" path="description"/>
            </div>
        </div>
        <div style="float: right;margin-bottom: 10px;">
            <input type="submit" class="btn btn-primary" id="saveButton" value="Save"/>
        </div>
    </form:form>
</div>