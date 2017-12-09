<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Nebessa.net.ua</title>
        <link href="/css_boot/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="/css_font/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

        <!-- Custom styles for this template -->
        <link href="/css/creative.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
              integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
              crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="/">Nebessa.net.ua</a>
                <a class="navbar-brand js-scroll-trigger" href="/myCabinet">My Cabinet</a>
            </div>
        </nav>
        <header class="masthead">
            <div class="header-content">
                <div class="header-content-inner">
                    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <div class="btn-group mr-2">
                                    <button class="btn btn-success" type="button" id="add_album">Add album</button>
                                </div>
                                <div class="btn-group mr-2">
                                    <button class="btn btn-danger" type="button" id="delete_album">Del album</button>
                                </div>
                            </ul>
                            <form class="form-inline my-2 my-lg-0" action="/search" method="post">
                                <input class="form-control mr-sm-2" type="text" name="pattern" placeholder="Search" aria-label="Search" required>
                                <button class="btn btn-success" type="submit">Search</button>
                            </form>
                        </div>
                    </nav>

                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <td></td>
                            <td><b>Name</b></td>
                            <td><b>Date</b></td>
                            <td><b>Note</b></td>
                        </tr>
                        </thead>
                        <c:forEach items="${albums}" var="album">
                            <tr>
                                <td><input type="checkbox" name="toDelete[]" value="${album.id}" id="checkbox_${album.id}"/></td>
                                <td><a href="/gallery/${album.id}">${album.name}</a></td>
                                <td>${album.date}</td>
                                <td>${album.note}</td>
                            </tr>
                        </c:forEach>
                    </table>
                    <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <c:if test="${allPages ne null}">
                            <c:forEach var="i" begin="1" end="${allPages}">
                                <li class="page-item active mr-1">
                                    <a class="page-link" href="/albums?page=<c:out value="${i - 1}"/>"><c:out value="${i}"/></a>
                                </li>
                            </c:forEach>
                        </c:if>
                    </ul>
                    </nav>
                </div>
            </div>
        </header>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
                integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
                crossorigin="anonymous"></script>
        <script>
            $('#add_album').click(function(){
                window.location.href='/albumAddPage';
            });

            $('#delete_album').click(function(){
                var data = { 'toDelete[]' : []};
                $(":checked").each(function() {
                    data['toDelete[]'].push($(this).val());
                });
                $.post("/album/delete", data, function(data, status) {
                    window.location.reload();
                });
            });
        </script>
    </body>
</html>
