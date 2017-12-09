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
    <style>
        p9{
            color: red;
            font-weight: 800;
        }
    </style>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="/">Nebessa.net.ua</a>
            </div>
        </nav>
        <header class="masthead">
            <div class="header-content">
                <div class="header-content-inner">
                    <h2>For registration, please enter information</h2>
                    <br>
                    <c:url value="/newUser" var="regUrl" />
                    <form action="${regUrl}" method="POST">
                        <div class="container">
                            <div class="row justify-content-md-center">
                                <div class="col-4" align="left">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email</label>
                                        <input type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputLogin">Login</label>
                                        <input type="login" class="form-control" name="login" id="exampleInputLogin" placeholder="Enter login" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword">Password</label>
                                        <input type="password" class="form-control" name="password" id="exampleInputPassword" placeholder="Password" required>
                                        <small id="passwordHelp" class="form-text text-muted">Minimum of six characters(letters and digits)</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputConfirmPassword">Confirm Password</label>
                                        <input type="password" class="form-control" id="exampleInputConfirmPassword" placeholder="Confirm Password" required>
                                    </div>
                                    <div align="center">
                                        <button type="submit" class="btn btn-primary">Register</button>
                                    </div>
                                    <c:if test="${exists ne null}">
                                        <c:if test="${email ne null}">
                                            <p9>User with email: ${email} or login: ${login} already exists!</p9>
                                        </c:if>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </header>

        <script type="application/javascript">
            var password = document.getElementById("exampleInputPassword");
            var confirm_password = document.getElementById("exampleInputConfirmPassword");
            
            function validateForm() {
                if (!password.value) {
                    password.setCustomValidity("Please enter password");
                }
                if (password.value.length < 6) {
                    password.setCustomValidity("Please enter correct password");
                } else {
                    password.setCustomValidity('')
                }
                if (password.value !== confirm_password.value) {
                    confirm_password.setCustomValidity("Password don't match");
                } else {
                    confirm_password.setCustomValidity('');
                }
            }
            password.onchange = validateForm;
            confirm_password.onkeyup = validateForm;
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
                crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
                integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
                crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
                integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
                crossorigin="anonymous"></script>
    </body>
</html>

