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

        <!-- Plugin CSS -->
        <link href="/magnific-popup/magnific-popup.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="/css/creative.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
              integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
              crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="/">Nebessa.net.ua</a>
                <a class="navbar-brand js-scroll-trigger" href="/albums">Albums</a>
            </div>
        </nav>
        <header class="masthead">
            <div class="header-content">
                <div class="header-content-inner">
                    <c:url value="/newAlbum" var="album" />
                    <form action="${album}" method="POST">
                        <div class="container">
                            <div class="row justify-content-md-center">
                                <div class="col-5" align="left">
                                    <div class="form-group">
                                        <label for="AlbumName">Album name</label>
                                        <input type="text" class="form-control" name="name" id="AlbumName" placeholder="Album name" required>
                                    </div>
                                    <div class="form-group">
                                          <label for="comment">Comment:</label>
                                          <textarea class="form-control" name="note" rows="5" id="comment" placeholder="Note"></textarea>
                                    </div>
                                    <div align="center">
                                        <button type="submit" class="btn btn-primary">Create</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </header>
    </body>
</html>
