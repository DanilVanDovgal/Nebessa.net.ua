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
              <div class="row">
                  <div class="col" align="center">
                      <br>
                      <a href="/photoAddPage/${albumId}" class="btn btn-success btn-lg active" role="button" aria-disabled="true">Add photo</a>
                      <a href="/albums" class="btn btn-success btn-lg active" role="button" aria-disabled="true">Back to albums</a>
                      <button class="btn btn-success btn-lg" id="select_all">Select all</button>
                      <button class="btn btn-success btn-lg" id="unselect_all">Unselect all</button>
                      <button class="btn btn-danger btn-lg" id="delete_photo">Del photo</button>
                  </div>
              </div>
          </div>
          <br>
          <div class="container">
              <form action="/photo/zip" method="post">
                  <div class="row">
                          <c:forEach items="${listPhoto}" var="i">
                              <div class="col-md-3 col-sm-4 col-xs-6 thumb">
                                  <a class="fancyimage" data-fancybox-group="group" href="/photo/${i.id}">
                                      <img class="img-responsive" src="/photo/${i.id}" />
                                  </a>
                                  <div class="form-check" align="center">
                                      <label class="form-check-label">
                                          <input class="form-check-input" type="checkbox" name="toCheck[]" value="${i.id}" id="checkbox_${i.id}">
                                      </label>
                                  </div>
                              </div>
                          </c:forEach>
                  </div>
                  <div align="center">
                      <button type="submit" class="btn btn-primary">Download Zip</button>
                  </div>
              </form>
              <nav aria-label="Page navigation">
                  <ul class="pagination">
                      <c:if test="${allPages ne null}">
                          <c:forEach var="i" begin="1" end="${allPages}">
                              <li>
                                  <a class="page-link" href="/gallery/${albumId}?page=<c:out value="${i - 1}"/>"><c:out value="${i}"/></a>
                              </li>
                          </c:forEach>
                      </c:if>
                  </ul>
              </nav>
          </div>
          <script type="text/javascript">
              $(document).ready(function() {
                  $("a.fancyimage").fancybox();
              });

              $('#delete_photo').click(function(){
                  var data = { 'toCheck[]' : []};
                  $(":checked").each(function() {
                      data['toCheck[]'].push($(this).val());
                  });
                  $.post("/photo/delete", data, function(data, status) {
                      window.location.reload();
                  });
              });

              $('#zip').click(function(){
                  var data = { 'toCheck[]' : []};
                  $(":checked").each(function() {
                      data['toCheck[]'].push($(this).val());
                  });
                  $.post("/zip", data);
              });
              
              $('#select_all').click(function() {
                  var checkers = document.getElementsByName('toCheck[]');
                  for(var i = 0; i < checkers.length; i++) {
                      if(checkers[i].type === 'checkbox')
                          checkers[i].checked = true;
                  }
              });

              $('#unselect_all').click(function() {
                  var checkers = document.getElementsByName('toCheck[]');
                  for(var i = 0; i < checkers.length; i++) {
                      if(checkers[i].type === 'checkbox')
                          checkers[i].checked = false;
                  }
              });
          </script>
      </body>
</html>
