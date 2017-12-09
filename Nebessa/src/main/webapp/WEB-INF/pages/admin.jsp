<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Nebessa.net.ua</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
              integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
              crossorigin="anonymous">
        <style>
            body{
                background-color: #6c757d;
            }
            p{
                font-weight: 400;
                color: black;
            }
        </style>
    </head>
    <body>
        <div align="center">
            <h1>ADMIN PANEL</h1>
            <c:url value="/logout" var="logoutUrl" />
            <p align="center">Click to logout: <a href="${logoutUrl}">LOGOUT</a></p>

            <div class="container" align="center">
                <div class="row">
                    <div class="col">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <td><b>id</b></td>
                                <td><b>login</b></td>
                                <td><b>email</b></td>
                                <td><b>name</b></td>
                                <td><b>surname</b></td>
                                <td><b>birthday</b></td>
                                <td><b>phone</b></td>
                                <td><b>max space</b></td>
                                <td><b>role</b></td>
                            </tr>
                            </thead>
                            <c:forEach items="${users}" var="user">
                                <tr>
                                    <td><b>${user.id}</b></td>
                                    <td><b>${user.login}</b></td>
                                    <td><b>${user.email}</b></td>
                                    <td><b>${user.firstName}</b></td>
                                    <td><b>${user.surname}</b></td>
                                    <td><b>${user.birthDate}</b></td>
                                    <td><b>${user.phone}</b></td>
                                    <td><b>${user.maxMemory}</b></td>
                                    <td><b>${user.role}</b></td>
                                </tr>
                            </c:forEach>
                        </table>
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <c:if test="${pages ne null}">
                                    <c:forEach var="i" begin="1" end="${pages}">
                                        <li class="page-item active mr-1">
                                            <a class="page-link" href="/admin?pages=<c:out value="${i - 1}"/>"><c:out value="${i}"/></a>
                                        </li>
                                    </c:forEach>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <a href="/admin/statistics"  class="btn btn-dark btn-lg active" role="button">Statistics</a>
        </div>
    </body>
</html>
