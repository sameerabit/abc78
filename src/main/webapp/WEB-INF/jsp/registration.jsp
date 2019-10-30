<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <script src="/webjars/jquery/3.3.1-1/jquery.min.js"></script>
    <script src="/webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
    <script src="/webjars/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/webjars/bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/webjars/jquery-ui/1.12.1/jquery-ui.css">

    <link rel="stylesheet" href="/webjars/datatables/1.10.12/media/css/jquery.dataTables.min.css">
    <script src="/webjars/datatables/1.10.12/media/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="/webjars/font-awesome/3.2.1/css/font-awesome.min.css">

</head>

  <body>

    <div class="container">

        <form:form method="POST" modelAttribute="userForm" class="form-signin">
            <h2 class="form-signin-heading">Create your account</h2>
            <spring:bind path="username">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="username" class="form-control" placeholder="Username"
                                autofocus="true"></form:input>
                    <form:errors path="username"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="password">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
                    <form:errors path="password"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="passwordConfirm">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="password" path="passwordConfirm" class="form-control"
                                placeholder="Confirm your password"></form:input>
                    <form:errors path="passwordConfirm"></form:errors>
                </div>
            </spring:bind>

            <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
        </form:form>

    </div>
  </body>
</html>
