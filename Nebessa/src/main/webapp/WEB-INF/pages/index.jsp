<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Nebessa.net.ua</title>

    <!-- Bootstrap core CSS -->
    <link href="/css_boot/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="/css_font/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

    <!-- Plugin CSS -->
    <link href="/magnific-popup/magnific-popup.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/creative.min.css" rel="stylesheet">

  </head>

  <body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">Nebessa.net.ua</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#about">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#services">Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#portfolio">Sing in</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#contact">Contact</a>
            </li>
            <c:if test="${email ne null}">
              <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="/myCabinet">My Cabinet</a>
              </li>
              <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="/logout">Log out</a>
              </li>
            </c:if>
          </ul>
        </div>
      </div>
    </nav>

    <header class="masthead">
      <div class="header-content">
        <div class="header-content-inner">
          <h1 id="homeHeading">Your favorite source for storing and saving photos</h1>
          <hr>
          <p>Nebessa can help you to enable new ways of organizing photos!</p>
          <a class="btn btn-primary btn-xl js-scroll-trigger" href="#about">Find Out More</a>
        </div>
      </div>
    </header>

    <section class="bg-primary" id="about">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto text-center">
            <h2 class="section-heading text-blue">We've got what you need!</h2>
            <hr class="light">
            <p class="text-faded">Nebessa.net.ua has everything you need to save and organize your photo!
                                  We create products that are easy to use and are built on trust!</p>
            <a class="btn btn-default btn-xl js-scroll-trigger" href="#services">Get Started!</a>
          </div>
        </div>
      </div>
    </section>

    <section id="services">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading">At Your Service</h2>
            <hr class="primary">
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box">
              <i class="fa fa-4x fa-globe text-primary sr-icons"></i>
              <h3>Availability</h3>
              <p class="text-muted">Take your photos anywhere.</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box">
              <i class="fa fa-4x fa-folder-open-o text-primary sr-icons"></i>
              <h3>Easement</h3>
              <p class="text-muted">Easily manage your photos.</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box">
              <i class="fa fa-4x fa-shield text-primary sr-icons"></i>
              <h3>Security</h3>
              <p class="text-muted">Never lose your photo.</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box">
              <i class="fa fa-4x fa-heart text-primary sr-icons"></i>
              <h3>Made with Love</h3>
              <p class="text-muted">We builds simple, powerful products for people with love!</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="p-0" id="portfolio">
      <div class="container-fluid">
        <div class="row no-gutter popup-gallery">
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="/static/1.jpg">
              <img class="img-fluid" src="/static/1.jpg" alt="">
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="/static/2.jpg">
              <img class="img-fluid" src="/static/2.jpg" alt="">
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="/static/3.jpg">
              <img class="img-fluid" src="/static/3.jpg" alt="">
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="/static/4.jpg">
              <img class="img-fluid" src="/static/4.jpg" alt="">
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="/static/5.jpg">
              <img class="img-fluid" src="/static/5.jpg" alt="">
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="/static/6.jpg">
              <img class="img-fluid" src="/static/6.jpg" alt="">
            </a>
          </div>
        </div>
      </div>
    </section>

    <div class="call-to-action bg-dark">
      <div class="container text-center">
        <h2>Sing in</h2>
        <a class="btn btn-default btn-xl sr-button" href="/login">Let's rock!!!</a>
      </div>
    </div>

    <section id="contact">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto text-center">
            <h2 class="section-heading">Let's Get In Touch!</h2>
            <hr class="primary">
            <p>You want to join us or have a great idea! Give us a call or send us an email and we will get back to you as soon as possible!</p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 ml-auto text-center">
            <i class="fa fa-phone fa-3x sr-contact"></i>
              <br>+(38)096-086-22-06
              <br>+(38)093-086-22-06
          </div>
          <div class="col-lg-4 mr-auto text-center">
            <i class="fa fa-envelope-o fa-3x sr-contact"></i>
            <p>
              <a href="mailto:your-email@your-domain.com">info@nebessa.net.ua</a>
              <a href="mailto:your-email@your-domain.com">d.dovgal.kiev@gmail.com</a>
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- Bootstrap core JavaScript -->
    <script src="/jquery/jquery.min.js"></script>
    <script src="/popper/popper.min.js"></script>
    <script src="/js_boot/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="/jquery-easing/jquery.easing.min.js"></script>
    <script src="/scrollreveal/scrollreveal.min.js"></script>
    <script src="/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="/js/creative.min.js"></script>

  </body>

</html>
