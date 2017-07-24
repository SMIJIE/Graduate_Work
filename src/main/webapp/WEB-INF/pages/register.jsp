<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>HomeFinance</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!-- JQuery library -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Masked Input plugin -->
    <script src="<c:url value="/static/jquery.maskedinput.min.js"/>"></script>
    <link href="<c:url value="/static/Logo_3.png"/>" rel="shortcut icon">
    <link href="<c:url value="/static/Style.css"/>" rel="stylesheet" type="text/css"/>

    <style>
        html,body {
            background: url('<c:url value="/static/Background_Title.jpg"/>');
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
    </style>

    <%--For email validation--%>
    <script>
        $(document).ready(function() {
            $('#email').blur(function() {
                if($(this).val() != '') {
                    var pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;
                    if(pattern.test($(this).val())){
                        $(this).css({'border' : '1px solid #569b44'});
                        $('#valid').text('Correctly');
                    } else {
                        $(this).css({'border' : '1px solid #ff0000'});
                        $('#valid').text('Incorrectly');
                    }
                }
            });
        });
    </script>
    <%--For email validation--%>

    <!-- Setting the input mask -->
    <script type="text/javascript">
        $(function(){
            //элемент, к которому необходимо добавить маску
            $("#phone").mask("+38 (999) 999 99 99",{placeholder: "*" });
        });
    </script>
    <!-- Setting the input mask -->
</head>

<body>
<%--Logo--%>
<img hspace="20" vspace="20" height="10%" width="10%" src="<c:url value="/static/Logo.png"/>"/>
<%--Logo--%>

<%--Form of registration--%>
<div id="action_form" align="center">

    <c:url value="/newuser" var="regUrl"/>

    <form action="${regUrl}" method="POST">
        <input type="text" class="form-control" name="login" placeholder="Login" maxlength="18"><br>
        <input type="text" class="form-control" name="password" placeholder="Password" maxlength="18"><br>
        <!-- Text field for entering email -->
        <input type="text" class="form-control" id="email" name="email" placeholder="E-mail"><span id="valid"></span><br>
        <!-- Text field for entering phone number -->
        <input type="text" class="form-control" name="phone" id="phone" placeholder="Phone"><br>
        <input class="btn btn-success" type="submit" value="Sign up"><br>
    </form>

    <c:if test="${emptyFields ne null}">
        <div class="alert alert-danger" role="alert">Empty fields!</div>
    </c:if>
    <c:if test="${exists ne null}">
        <div class="alert alert-danger" role="alert">User with login '${newLogin}' already exists!</div>
    </c:if>

</div>
<%--Form of registration--

<%--Block below the form--%>
<div id="block2">
    <div class="row" align="center">
        <h2><u>Features of Home Finance</u></h2><br>
        <div class="col-lg-4">
            <img class="img-circle" src="<c:url value="/static/Emblem_4.png"/>" alt="Generic placeholder image"
                 width="140" height="140">
            <h4>Use on different devices</h4>
            <p>Use Home Accounting, on another computer or on a mobile device Android, iPhone, iPad.</p>
        </div>
        <div class="col-lg-4">
            <img class="img-circle" src="<c:url value="/static/Emblem_5.png"/>" alt="Generic placeholder image"
                 width="140" height="140">
            <h4>Keep records in any currency of the world</h4>
            <p>In the list of currencies of Home Accounting, there are all currencies in the world. Select the currencies that you use.</p>
        </div>
        <div class="col-lg-4">
            <img class="img-circle" src="<c:url value="/static/Emblem_6.png"/>" alt="Generic placeholder image"
                 width="140" height="140">
            <h4>Your data is under reliable protection</h4>
            <p>With a reliable system, rest assured that your data is always safe and you will never lose it.</p>
        </div>
    </div>
</div>
<%--Block below the form--%>

</body>
</html>
