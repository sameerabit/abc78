<jsp:include page="index.jsp"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script>

        $(function () {

            function addScript(url) {
                var script = document.createElement('script');
                script.type = 'application/javascript';
                script.src = url;
                document.head.appendChild(script);
            }
            addScript('https://raw.githack.com/eKoopmans/html2pdf/master/dist/html2pdf.bundle.js');


            $("#printBtn").click(function (event) {
                event.preventDefault();
                var element = document.getElementById('printBody');
                html2pdf(element);
            });


        });



    </script>
</head>
<body>
<div id="printBody" class="container my-5">
    <div class="card">
        <div class="card-header">
            Item Stock Report
        </div>
        <div class="card-body">
            <form data-html2canvas-ignore="true" action="/item/stock">
                <div class="form-group row">
                    <div class="col-sm-6 mx-auto">
                        <input class="form-control" type="text" name="search">
                    </div>
                    <div class="col">
                        <input type="submit" class="btn btn-info" value="Search">
                    </div>

                </div>
            </form>
            <div data-html2canvas-ignore="true" class="row">
                <div class="col text-right">
                    <button id="printBtn" class="btn btn-info" >Print</button>
                </div>
            </div>
    <table class="table m-auto">
        <thead class="thead-light">
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col">Quantity</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${items}" var="item">
            <tr>
                <td>${item[0].name}</td>
                <td>${item[0].itemCategory.name}</td>
                <td>${item[1]}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
        </div>

    </div>


</div>

</body>
</html>