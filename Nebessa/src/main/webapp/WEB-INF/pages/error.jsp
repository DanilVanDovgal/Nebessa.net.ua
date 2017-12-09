<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Nebessa.net.ua</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body{
                background: url(/static/3.jpg) no-repeat center top;
            }
            h1{
                font-family: 'Merriweather', 'Helvetica Neue', Arial, sans-serif;
                font-size: 100px;
                color: red;
                margin-top: 200px;
            }
            P{
                font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
                font-size: 60px;
                margin-top: 50px;
                color: red;
            }
            a{
                font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
                font-size: 30px;
                font-weight: 700;
                margin-top: 50px;
                color: blue;
            }
        </style>
    </head>
    <body>
        <div align="center">
            <a href="/">HOME</a>
        </div>
        <div align="center">
            <h1>404</h1>
            <p>
                ${message}
            </p>
        </div>
    </body>
</html>