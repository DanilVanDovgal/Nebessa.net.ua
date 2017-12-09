<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
  <head>
      <title>Nebessa.net.ua</title>
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.1.25/jquery.fancybox.min.css"/>
      <style>
          p9{
              color: red;
              font-weight: 500;
              font-size: 20px;
          }
      </style>
  </head>
      <body>
          <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
              <div class="container">
                  <a class="navbar-brand js-scroll-trigger" href="/">Nebessa.net.ua</a>
                  <a class="navbar-brand js-scroll-trigger" href="/albums">Albums</a>
              </div>
          </nav>
          <header class="masthead">
              <div class="header-content2">
                  <div class="header-content-inner">
                      <c:url value="/addPhoto/${albumId}" var="addUrl" />
                      <form action="${addUrl}" enctype="multipart/form-data" method="POST">
                          <div class="container">
                              <h3>Add one or several photos</h3>
                              <div class="row justify-content-md-center">
                                  <div class="col-5" align="center">
                                      <div class="form-group">
                                          <label for="exampleInputFile">File input</label>
                                          <input type="file" class="form-control-file" name="photo" accept="image/*" multiple="" id="exampleInputFile" placeholder="AddPhoto" aria-describedby="fileHelp" required>
                                          <small class="form-text text-muted">Max file size 10Mb!!! Max  request size 50Mb!!!</small>
                                      </div>
                                  </div>
                              </div>
                          </div>
                          <div align="center">
                              <button type="submit" class="btn btn-primary">Upload</button>
                          </div>
                          <div align="center">
                              <c:if test="${full ne null}">
                                  <p9>SORRY NOT ENOUGH SPACE</p9>
                              </c:if>
                          </div>
                      </form>
                  </div>
              </div>
          </header>
      </body>
</html>
