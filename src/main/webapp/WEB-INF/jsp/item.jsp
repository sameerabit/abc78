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
                Item
            </div>
            <div class="card-body">
    <form:form method="POST" cssClass="m-5" action="/item/save" modelAttribute="item">
        <div class="form-group row">
            <label class="col-sm-4 col-form-label" for="itemCategory">Category :</label>
            <div class="col-sm-8">
                    <form:select id="itemCategory" class="form-control" path="itemCategory.id" items="${itemCategories}" itemValue="id" itemLabel="name" >
                    <form:option value="itemCategory.id">itemCategory.name</form:option>
                    </form:select>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label" for="cat_name">Name :</label>
            <div class="col-sm-8">
                <form:input type="text" class="form-control" id="cat_name" path="name"/>
                <form:input type="hidden" class="form-control" id="id" path="id"/>
                <form:errors path="name"></form:errors>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label" for="description">Description:</label>
            <div class="col-sm-8">
                <form:input type="text" class="form-control" id="description" path="description"/>
            </div>
        </div>
        <div class="float-right">
            <input type="submit" class="btn btn-primary" id="saveButton" value="Save"/>
        </div>
    </form:form>
            </div>
        </div>
    </div>

</div>