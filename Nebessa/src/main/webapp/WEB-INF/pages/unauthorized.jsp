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
                background: url(/static/access-denied.jpg) no-repeat center top;
            }
            h1{
                font-weight: 800;
                color: red;
                margin-top: 100px;
            }
            h2{
                font-weight: 800;
                color: red;
            }
            p{
                font-weight: 800;
                color: red;
                font-size: 20px;
            }
        </style>
    </head>
    <body>
        <div align="center">
            <h1>LogIn like admin</h1>
            <c:url value="/login" var="login" />
            <p>Click to login: <a href="${login}">LOGIN</a></p>
            <h2>OR</h2>

            <c:url value="/logout" var="logoutUrl" />
            <p>Click to logout: <a href="${logoutUrl}">LOGOUT</a></p>
        </div>
    </body>
</html>