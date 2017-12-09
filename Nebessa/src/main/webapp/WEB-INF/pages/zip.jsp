<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
      <title>Nebessa.net.ua</title>
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
      <link
              rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
              integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
              crossorigin="anonymous">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.1.25/jquery.fancybox.min.css"/>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.1.25/jquery.fancybox.min.js"></script>


      <style>
          .thumb img {
              filter: none; /* IE6-9 */
              -webkit-filter: grayscale(0);
              border-radius:5px;
              background-color: #fff;
              border: 1px solid #ddd;
              padding:5px;
          }
          .thumb img:hover {
              filter: gray; /* IE6-9 */
              -webkit-filter: grayscale(1);
          }
          .thumb {
              padding:5px;
          }
          body{
              background: url(/static/header.jpg) no-repeat center top;
          }
      </style>

  </head>
      <body>
          <div class="container">
              <h1>Your zip archive <a href="/downloads?file=${zipFile}">link</a></h1>
          </div>
      </body>
</html>
