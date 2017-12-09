<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Nebessa.net.ua</title>
        <link href="/css_boot/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="/css_font/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
              rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
              rel='stylesheet' type='text/css'>

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
                <a class="navbar-brand js-scroll-trigger" href="/myCabinet">My Cabinet</a>
            </div>
        </nav>
        <header class="masthead">
            <div class="header-content2">
                <div class="header-content-inner">
                    <h2>Update your information</h2>
                    <c:set var="user" value="${user}"/>
                    <p>Your email: ${user.email} and login: ${user.login}</p>
                    <c:url value="/update" var="updateUrl" />
                    <form action="${updateUrl}" method="POST">
                        <div class="container">
                            <div class="row justify-content-md-center">
                                <div class="col-5" align="left">
                                    <div class="form-group">
                                        <label for="exampleInputFirstName">First name</label>
                                        <input type="text" class="form-control" name="firstName" value="${user.firstName}" id="exampleInputFirstName" placeholder="First name" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputLastName">Last name</label>
                                        <input type="text" class="form-control" name="lastName" value="${user.surname}" id="exampleInputLastName" placeholder="Last name" required>
                                    </div>
                                    <c:choose>
                                        <c:when test="${user.birthDate ne null}">
                                            <p>Your birthday: ${user.birthDate} <a href="/update/date" class="badge badge-primary">Change</a></p>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="form-group">
                                                <label for="row-col">Date of birth</label>
                                                <input type="text" name="birthday" value="" id="row-col"/>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="form-group">
                                        <label for="phone">Phone(+380XX-XXX-XX-XX)</label>
                                        <input type="text" class="form-control" name="phone" value="${user.phone}" id="phone" placeholder="Phone" required>
                                    </div>
                                    <div align="center">
                                        <button type="submit" class="btn btn-primary">Update</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </header>
        <script src="https://code.jquery.com/jquery-3.2.1.js"
                integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
                crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
                integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
                crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
                integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
                crossorigin="anonymous"></script>
        <script type="application/javascript" src="/js/bootstrap-birthday.js"></script>
        <script type="application/javascript">
            $('#row-col').bootstrapBirthday({});
        </script>
    </body>
</html>

