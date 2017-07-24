<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>HomeFinance</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <link href="<c:url value="/static/Logo_3.png"/>" rel="shortcut icon">
    <link href="<c:url value="/static/Style.css"/>" rel="stylesheet" type="text/css"/>

    <style>
        body {
            background: url('<c:url value="/static/Background_Title.jpg"/>');
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
    </style>
</head>

<body>

<%--Video background--%>
<div id="block1">
    <video loop muted autoplay poster="img/videoframe.jpg" class="fullscreen-bg__video">
        <source src="<c:url value="/static/Background_Title.mp4"/>" type="video/mp4"></source>
        <source src="<c:url value="/static/Background_Title.webm"/>" type="video/webm"></source>
    </video>
</div>
<%--Video background--%>

<%--Logo--%>
<img hspace="20" vspace="20" height="10%" width="10%" src="<c:url value="/static/Logo.png"/>"/>
<%--Logo--%>

<%--Form login and password--%>
<div id="action_form" align="center">
    <c:url value="/j_spring_security_check" var="loginUrl"/>

    <form action="${loginUrl}" method="POST">
        <input type="text" class="form-control" name="j_login" placeholder="Login" maxlength="18"><br>
        <input type="password" class="form-control" name="j_password" placeholder="Password" maxlength="18"><br>
        <input class="btn btn-success" type="submit" value="Sign in">
        <input class="btn btn-primary" type="button" id="register" value="Sign up"><br>
    </form>

    <c:if test="${param.error ne null}">
        <div class="alert alert-danger" role="alert">Wrong login or password!</div>
    </c:if>

    <c:if test="${param.logout ne null}">
        <div class="alert alert-info" role="alert">Good Bye!</div>
    </c:if>
</div>
<%--Form login and password--%>

<%--Block below the video--%>
<div id="block2">
    <div class="row" align="center">
        <h2><u>Features of Home Finance</u></h2><br>
        <div class="col-lg-4">
            <img class="img-circle" src="<c:url value="/static/Emblem_1.png"/>" alt="Generic placeholder image"
                 width="140" height="140">
            <h4>Home accounting for the whole family</h4>
            <p>Keep records of the personal finances and finances of all members of your family.</p>
        </div>
        <div class="col-lg-4">
            <img class="img-circle" src="<c:url value="/static/Emblem_2.png"/>" alt="Generic placeholder image"
                 width="140" height="140">
            <h4>Consider all your expenses and incomes</h4>
            <p>Make all your expenses and incomes in the Home Accounting Department to keep the finances under full
                control.</p>
        </div>
        <div class="col-lg-4">
            <img class="img-circle" src="<c:url value="/static/Emblem_3.png"/>" alt="Generic placeholder image"
                 width="140" height="140">
            <h4>Visual reports and diagrams are a simple and convenient tool for analysis</h4>
            <p>Home accounting will help you analyze your finances with reports and graphs.</p>
        </div>
    </div>
</div>
<%--Block below the video--%>

<%--Processing button to register--%>
<script>
    $('#register').click(function () {
        window.location.href = '/register';
    });
</script>
<%--Processing button to register--%>

</body>
</html>
