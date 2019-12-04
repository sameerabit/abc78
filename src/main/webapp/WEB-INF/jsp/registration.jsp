<jsp:include page="index.jsp"/>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <%--<script src="/webjars/jquery/3.3.1-1/jquery.min.js"></script>--%>
    <%--<script src="/webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>--%>
    <%--<script src="/webjars/bootstrap/4.1.0/js/bootstrap.min.js"></script>--%>
    <%--<link rel="stylesheet" type="text/css" href="/webjars/bootstrap/4.1.0/css/bootstrap.min.css">--%>
    <%--<link rel="stylesheet" type="text/css" href="/webjars/jquery-ui/1.12.1/jquery-ui.css">--%>

    <%--<link rel="stylesheet" href="/webjars/datatables/1.10.12/media/css/jquery.dataTables.min.css">--%>
    <%--<script src="/webjars/datatables/1.10.12/media/js/jquery.dataTables.min.js"></script>--%>
    <%--<link rel="stylesheet" href="/webjars/font-awesome/3.2.1/css/font-awesome.min.css">--%>

</head>

  <body>

  <div class="container h-100 d-flex my-5">
      <div class="m-auto" style="height: 400px;width: 700px;">
          <div class="card">
              <div class="card-header">
                  <h2 class="form-signin-heading">User Account</h2>
              </div>
              <div class="card-body">
        <form:form method="POST" action="/registration" modelAttribute="userForm" class="form-signin">
            <spring:bind path="username">
                <div class="form-group row ${status.error ? 'has-error' : ''}">
                    <label class="col-sm-4 col-form-label" for="username">User Name :</label>
                    <div class="col-sm-8">
                    <form:input type="text" path="username" class="form-control" placeholder="Username"
                                autofocus="true"></form:input>
                    <form:input type="hidden" path="id" class="form-control" ></form:input>
                    <div class="text-danger">
                        <form:errors path="username"></form:errors>
                    </div>
                    </div>

                </div>
            </spring:bind>
            <div class="form-group row">
                <label class="col-sm-4 col-form-label" for="role">Role :</label>
                <div class="col-sm-8">
                    <form:select id="role" class="form-control" path="role.id" items="${roles}" itemValue="id" itemLabel="name" >
                        <form:option value="role.id">role.name</form:option>
                    </form:select>
                </div>
            </div>
            <spring:bind path="password">
                <div class="form-group row ${status.error ? 'has-error' : ''}">
                    <label class="col-sm-4 col-form-label" for="password">Password :</label>
                    <div class="col-sm-8">

                    <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
                    <div class="text-danger">
                        <form:errors path="password"></form:errors>
                    </div>
                    </div>

                </div>
            </spring:bind>

            <spring:bind path="passwordConfirm">
                <div class="form-group row ${status.error ? 'has-error' : ''}">
                    <label class="col-sm-4 col-form-label" for="password">Confirm Password :</label>
                    <div class="col-sm-8">

                    <form:input type="password" path="passwordConfirm" class="form-control"
                                placeholder="Confirm your password"></form:input>
                        <div class="text-danger">
                            <form:errors path="passwordConfirm"></form:errors>
                        </div>
                    </div>
                </div>
            </spring:bind>

            <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
        </form:form>
              </div>
          </div>
      </div>

  </div>