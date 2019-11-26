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

    <link rel="stylesheet" href="/webjars/font-awesome/3.2.1/css/font-awesome.css">
</head>
  <body style="height: 100vh">


    <div class="container-fluid h-100">
        <div class="row justify-content-center align-items-center h-100">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header">Login</div>

                            <div class="card-body">
                                <span>${message}</span>
                                <form method="POST" action="${contextPath}/login">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <div class="form-group row ${error != null ? 'has-error' : ''}">
                                        <label for="username" class="col-sm-4 col-form-label text-md-right">User Name</label>

                                        <div class="col-md-6">
                                            <input name="username" type="text" class="form-control" placeholder="Username" id="username"
                                                   autofocus="true"/>

                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>

                                        <div class="col-md-6">
                                            <input id="password" type="password" class="form-control" name="password" required="">

                                        </div>
                                        <span>${error}</span>

                                    </div>


                                    <div class="form-group row mb-0">
                                        <div class="col-md-8 offset-md-4">
                                            <button type="submit" class="btn btn-primary">
                                                Login
                                            </button>
                                        </div>
                                    </div>						</form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


  </body>
</html>
