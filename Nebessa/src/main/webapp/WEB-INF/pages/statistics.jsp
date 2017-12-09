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
        </div>
        <div class="container">
            <div class="row">
                <div class="col">
                    <h1 align="left">Total users = ${users}</h1>
                    <h1 align="left">Total albums = ${albums}</h1>
                    <h1 align="left">Total used space = ${usingSpace}Mb</h1>
                </div>
            </div>
        </div>
    </body>
</html>
