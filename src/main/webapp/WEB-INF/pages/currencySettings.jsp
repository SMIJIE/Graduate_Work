<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>HomeFinance</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
    <!-- JQuery library -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Masked Input plugin -->
    <script src="<c:url value="/static/jquery.maskedinput.min.js"/>"></script>
    <link href="<c:url value="/static/Logo_3.png"/>" rel="shortcut icon">
    <link href="<c:url value="/static/Style.css"/>" rel="stylesheet" type="text/css"/>
    <script src="<c:url value="/static/JavaScript.js"/>" type="text/javascript"></script>
    <style>
        html,
        body {
            overflow-x: hidden !important;
            font-family: 'Source Sans Pro', sans-serif;
            -webkit-font-smoothing: antialiased;
            min-height: 100%;
            background: url('<c:url value="/static/Background.jpg"/>');
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
    </style>
    <%--For email validation--%>
    <script>
        $(document).ready(function () {
            $('#email').blur(function () {
                if ($(this).val() != '') {
                    var pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;
                    if (pattern.test($(this).val())) {
                        $(this).css({'border': '1px solid #569b44'});
                        $('#valid').text('Correctly');
                    } else {
                        $(this).css({'border': '1px solid #ff0000'});
                        $('#valid').text('Incorrectly');
                    }
                }
            });
        });
    </script>
    <%--For email validation--%>

    <!-- Setting the input mask -->
    <script type="text/javascript">
        $(function () {
            //элемент, к которому необходимо добавить маску
            $("#phone").mask("+38 (999) 999 99 99", {placeholder: "*"});
        });
    </script>
    <!-- Setting the input mask -->
</head>

<body class="skin-black">

<%--Top line--%>
<header class="header">
    <%--Logo--%>
    <a href="/" class="logo">
        <img height="50px" width="45%" src="<c:url value="/static/Logo_2.png"/>"/>
    </a>
    <%--Logo--%>

    <nav class="navbar navbar-static-top" role="navigation">
        <%--Toggle navigation--%>
        <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </a>
        <%--Toggle navigation--%>

        <%--Dropdown user-menu--%>
        <div class="navbar-right">
            <ul class="nav navbar-nav">
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="glyphicon glyphicon-user"></i>
                        <span>${user.login} <i class="caret"></i></span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <c:url value="/logout" var="logoutUrl"/>
                            <a href="${logoutUrl}"
                               class="btn btn-inverse btn-flat">Sign out &nbsp;<span class="glyphicon glyphicon-send"
                                                                                     aria-hidden="true"></span></a>
                            <a href="/userSettings"
                               class="btn btn-inverse btn-flat">Settings &nbsp;<span
                                    class="glyphicon glyphicon-paperclip" aria-hidden="true"></span></a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <%--Dropdown user-menu--%>
    </nav>
</header>
<%--Top line--%>

<%--Left menu bar--%>
<aside class="left-side sidebar-offcanvas">
    <section class="sidebar">

        <ul class="sidebar-menu">
            <li class="active">
                <a href="/"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp; Home</a>
            </li>
            <li class="active">
                <a href="/income"><span class="glyphicon glyphicon-export" aria-hidden="true"></span>&nbsp; Income</a>
            </li>
            <li class="active">
                <a href="/expense"><span class="glyphicon glyphicon-import" aria-hidden="true"></span>&nbsp; Expense</a>
            </li>
            <li class="active">
                <a href="/analytics"><span class="glyphicon glyphicon-stats" aria-hidden="true"></span>&nbsp; Analytics</a>
            </li>
            <li class="active">
                <a href="/scheduler"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>&nbsp;
                    Scheduler</a>
            </li>
            <li class="active">
                <a href="/exchangeRate"><span class="glyphicon glyphicon-usd" aria-hidden="true"></span>&nbsp; Exchange
                    Rates</a>
            </li>
            <li class="active">
                <a href="/currencySettings"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>&nbsp;
                    Settings</a>
            </li>
            <li class="active">
                <a href="/help"><span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>&nbsp;
                    Help</a>
            </li>
            <li class="active">
                <a href="/entertainment"><span class="glyphicon glyphicon-play" aria-hidden="true"></span>&nbsp;Entertainment</a>
            </li>

            <!-- clock widget -->
            <li>
                <p></p>
                <script type="text/javascript"> var css_file = document.createElement("link");
                css_file.setAttribute("rel", "stylesheet");
                css_file.setAttribute("type", "text/css");
                css_file.setAttribute("href", "//s.bookcdn.com//css/cl/bw-cl-180x170r4.css");
                document.getElementsByTagName("head")[0].appendChild(css_file); </script>
                <div id="tw_14_455325530">
                    <div style="width:145px; height:50px; margin: 0 auto;"><a
                            href="http://www.booked.net/time/kiev-18881">Kiev</a><br/></div>
                </div>
                <script type="text/javascript"> function setWidgetData_455325530(data) {
                    if (typeof(data) != 'undefined' && data.results.length > 0) {
                        for (var i = 0; i < data.results.length; ++i) {
                            var objMainBlock = '';
                            var params = data.results[i];
                            objMainBlock = document.getElementById('tw_' + params.widget_type + '_' + params.widget_id);
                            if (objMainBlock !== null) objMainBlock.innerHTML = params.html_code;
                        }
                    }
                }

                var clock_timer_455325530 = -1; </script>
                <script type="text/javascript" charset="UTF-8"
                        src="https://widgets.booked.net/time/info?ver=2&domid=&type=14&id=455325530&scode=2&city_id=18881&wlangid=1&mode=2&details=0&background=ffffff&color=00c8ff&add_background=ffffff&add_color=00c8ff&head_color=ffffff&border=0&transparent=0"></script>
            </li>
            <!-- clock widget -->

            <%--Button for admins--%>
            <c:if test="${user.role eq 'ADMIN'}">
                <li class="active">
                    <a href="/usersForAdmin"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;
                        Show users</a>
                </li>
            </c:if>
            <%--Button for admins--%>
        </ul>
    </section>
</aside>
<%--Left menu bar--%>

<%--Main content--%>
<aside class="right-side">
    <section class="content-header">
        <h1>Currency settings:</h1>
    </section>

    <%--Users settings--%>
    <div class="row">
        <div class="col-xs-9 form-group has-success">
            <c:url value="/updateCurrency" var="updateUrl"/>
            <form action="${updateUrl}" method="POST">
                <h4>Currency:</h4>
                <select name="currencyCode" class="form-control">
                    <option value="${user.currencyCode}">${user.currencyCode} (${currencyCodeName})</option>

                    <c:forEach items="${exchangeRates}" var="exchangeRate">
                        <c:if test="${user.currencyCode ne exchangeRate.codeCurrency}">
                            <option value=${exchangeRate.codeCurrency}>${exchangeRate.codeCurrency}
                                (${exchangeRate.name})
                            </option>
                        </c:if>
                    </c:forEach>
                </select><br>
                <input type="submit" class="btn btn-success btn-lg" value="Save"/>
            </form>

        </div>
    </div>
    <%--Users settings--%>

</aside>
<%--Main content--%>

</body>
</html>
