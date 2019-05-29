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
    <form:form method="POST" action="/item/save" modelAttribute="item">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="customer">Category :</label>
            <div class="col-sm-10">
                <form:select id="itemCategory" class="form-control" path="itemCategory.id" items="${itemCategories}" itemValue="id" itemLabel="name" >
                    <form:option value="itemCategory.id">itemCategory.name</form:option>
                </form:select>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="customer">Name :</label>
            <div class="col-sm-10">
                <form:input type="text" class="form-control" id="cat_name" path="name"/>
                <form:input type="hidden" class="form-control" id="id" path="id"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="description">Description:</label>
            <div class="col-sm-10">
                <form:input type="text" class="form-control" id="item_name" path="description"/>
            </div>
        </div>
        <div style="float: right;margin-bottom: 10px;">
            <input type="submit" class="btn btn-primary" id="saveButton" value="Save"/>
        </div>
    </form:form>
</div>