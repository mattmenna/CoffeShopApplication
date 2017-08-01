<%--
  Created by IntelliJ IDEA.
  User: Matt
  Date: 7/26/2017
  Time: 1:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Grand Circus - CoffeeShop and Cafe</title>

    <!-- Bootstrap Core CSS -->
    <link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css' />" rel="stylesheet"/>

    <!-- Custom Fonts -->
    <link href="<c:url value='/resources/vendor/font-awesome/css/font-awesome.min.css' />" rel="stylesheet"
          type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
          rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
          rel='stylesheet' type='text/css'>

    <!-- Plugin CSS -->
    <link href="<c:url value='/resources/vendor/magnific-popup/magnific-popup.css'/>" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="<c:url value='/resources/css/creative.min.css'/>" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script>
        $.validator.setDefaults({
            submitHandler: function () {
                alert("submitted!");
            }
        });
        $().ready(function () {
            // validate the comment form when it is submitted
            $("#commentForm").validate();
            // validate signup form on keyup and submit
            $("#signupForm").validate({
                rules: {
                    firstname: "required",
                    lastname: "required",
                    username: {
                        required: true,
                        minlength: 2
                    },
                    password: {
                        required: true,
                        minlength: 5
                    },
                    confirm_password: {
                        required: true,
                        minlength: 5,
                        equalTo: "#password"
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    topic: {
                        required: "#newsletter:checked",
                        minlength: 2
                    },
                    agree: "required"
                },
                messages: {
                    firstname: "Please enter your firstname",
                    lastname: "Please enter your lastname",
                    username: {
                        required: "Please enter a username",
                        minlength: "Your username must consist of at least 2 characters"
                    },
                    password: {
                        required: "Please provide a password",
                        minlength: "Your password must be at least 5 characters long"
                    },
                    confirm_password: {
                        required: "Please provide a password",
                        minlength: "Your password must be at least 5 characters long",
                        equalTo: "Please enter the same password as above"
                    },
                    email: "Please enter a valid email address",
                    agree: "Please accept our policy",
                    topic: "Please select at least 2 topics"
                }
            });
            // propose username by combining first- and lastname
            $("#username").focus(function () {
                var firstname = $("#firstname").val();
                var lastname = $("#lastname").val();
                if (firstname && lastname && !this.value) {
                    this.value = firstname + "." + lastname;
                }
            });
            //code to hide topic selection, disable for demo
            var newsletter = $("#newsletter");
            // newsletter topics are optional, hide at first
            var inital = newsletter.is(":checked");
            var topics = $("#newsletter_topics")[inital ? "removeClass" : "addClass"]("gray");
            var topicInputs = topics.find("input").attr("disabled", !inital);
            // show when newsletter is checked
            newsletter.click(function () {
                topics[this.checked ? "removeClass" : "addClass"]("gray");
                topicInputs.attr("disabled", !this.checked);
            });
        });
    </script>
    <style>
        #commentForm {
            width: 500px;
        }

        #commentForm label {
            width: 250px;
        }

        #commentForm label.error, #commentForm input.submit {
            margin-left: 253px;
        }

        #signupForm {
            width: 670px;
        }

        #signupForm label.error {
            margin-left: 10px;
            width: auto;
            display: inline;
        }

        #newsletter_topics label.error {
            display: none;
            margin-left: 103px;
        }
    </style>

</head>

<body id="page-top">

<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand page-scroll" href="/">Start Bootstrap</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a class="page-scroll" href="/UserRegistration">Registration</a>
                </li>
                <li>
                    <a class="page-scroll" href="#services">View Menu</a>
                </li>

            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>

<form action="/formresults" method="post" id="commentForm class=" cmxform
" role="form">

<fieldset>
    <legend>Please provide your name, email address (won't be published) and a comment</legend>
    <p>
        <label for="cname">Name (required, at least 2 characters)</label>
        <input id="cname" name="name" minlength="2" type="text" required>
    </p>
    <p>
        <label for="cemail">E-Mail (required)</label>
        <input id="cemail" type="email" name="email" required>
    </p>
    <p>
        <label for="curl">URL (optional)</label>
        <input id="curl" type="url" name="url">
    </p>
    <p>
        <label for="ccomment">Your comment (required)</label>
        <textarea id="ccomment" name="comment" required></textarea>
    </p>
    <p>
        <input class="submit" type="submit" value="Submit">
    </p>
</fieldset>
</form>
</form>

<section class="bg-primary" id="about">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 text-center">
                <h2 class="section-heading">We've got what you need!</h2>
                <hr class="light">
                <p class="text-faded">Grand Circus Coffe has got what you need, when you need it!!</p>
                <a href="/" class="page-scroll btn btn-default btn-xl sr-button">Come on by!</a>
            </div>
        </div>
    </div>
</section>


<section id="contact">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 text-center">
                <h2 class="section-heading">Let's Get In Touch!</h2>
                <hr class="primary">
                <p>Ready to start your next project with us? That's great! Give us a call or send us an email and we
                    will get back to you as soon as possible!</p>
            </div>
            <div class="col-lg-4 col-lg-offset-2 text-center">
                <i class="fa fa-phone fa-3x sr-contact"></i>
                <p>123-456-6789</p>
            </div>
            <div class="col-lg-4 text-center">
                <i class="fa fa-envelope-o fa-3x sr-contact"></i>
                <p><a href="mailto:mattmenna@gmail.com">mattmenna@gmail.com</a></p>
            </div>
        </div>
    </div>
</section>

<!-- jQuery -->
<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.min.js'/>"></script>

<!-- Plugin JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="<c:url value='/resources/vendor/scrollreveal/scrollreveal.min.js'/>"></script>
<script src="<c:url value='/resources/vendor/magnific-popup/jquery.magnific-popup.min.js'/>"></script>

<!-- Theme JavaScript -->
<script src="<c:url value='/resources/js/creative.min.js' />" type="text/javascript"></script>

<script src="https://cdn.jsdelivr.net/jquery.validation/1.17.0/jquery.validate.js"></script>

</body>

</html>

