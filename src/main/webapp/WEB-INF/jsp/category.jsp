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

        body{
            height: 100vh;
        }
    </style>
</head>
<div class="container h-100 d-flex">

    <div class="m-auto" style="height: 400px;width: 500px;">
    <div class="card">
        <div class="card-header">
            Category
        </div>
        <div class="card-body">

            <form:form method="POST" action="/category/save" modelAttribute="itemCategory">
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="itemCategory">Name :</label>
                    <div class="col-sm-8">
                        <form:input type="text" class="form-control" id="name" path="name"/>
                        <form:input type="hidden" class="form-control" id="id" path="id"/>
                        <form:errors cssClass="text-danger" path="name"></form:errors>

                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="description">Description:</label>
                    <div class="col-sm-8">
                        <form:input type="text" class="form-control" id="description" path="description"/>
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