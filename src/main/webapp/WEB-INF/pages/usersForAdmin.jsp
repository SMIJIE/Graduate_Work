<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>HomeFinance</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
    <!-- jQuery 2.0.2 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
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

        table {
            border: none;
        }

        tr:hover {
            background: #0073b7;
        }

        table tr td {
            border: none;
            border-bottom: 1px solid #00ff7f;
        }
    </style>
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
        <h1>List of users:</h1>
    </section>

    <div class="row">
        <div class="col-xs-11">
            <%--Navbar--%>
            <div class="container">
                <ul id="groupList" class="nav navbar-nav">
                    <li>
                        <button type="button" id="delete_user" class="btn btn-primary navbar-btn"><span
                                class="glyphicon glyphicon-trash" aria-hidden="true"></span> Delete Users
                        </button>
                    </li>
                </ul>

                <form class="navbar-form navbar-left" role="search" action="/search" method="post">
                    <input type="text" class="form-control" name="pattern" placeholder="Search by login">
                    <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"
                                                                        aria-hidden="true"></span> Search
                    </button>
                </form>
            </div>
            <%--Navbar--%>

            <%--Table of users--%>
            <table class="table table-condensed">
                <thead>
                <tr bgcolor="#00ff7f">
                    <td></td>
                    <td><b>Login</b></td>
                    <td><b>E-mail</b></td>
                    <td><b>Phone</b></td>
                    <td><b>Role</b></td>
                    <td></td>
                </tr>
                </thead>
                <c:forEach items="${allUsers}" var="userOne">
                    <tr>
                        <td><input type="checkbox" name="toDelete[]" value="${userOne.id}" id="checkbox_${userOne.id}"/>
                        </td>
                        <form action="/update/${userOne.login}" id="${userOne.login}" method="POST">
                            <td><input type="text" class="form-control" name="newLogin" value="${userOne.login}"/></td>
                            <td><input type="text" class="form-control" name="email" value="${userOne.email}"/></td>
                            <td><input type="text" class="form-control" name="phone" value="${userOne.phone}"/></td>
                            <td>
                                <select id="${userOne.login}" name="role" class="form-control">
                                    <option value="${userOne.role}">${userOne.role}</option>
                                    <c:if test="${userOne.role eq 'ADMIN'}">
                                        <option value="USER">USER</option>
                                    </c:if>
                                    <c:if test="${userOne.role eq 'USER'}">
                                        <option value="ADMIN">ADMIN</option>
                                    </c:if>
                                </select>
                            </td>
                            <td><input type="submit" class="btn btn-success navbar-btn-sm" value=" Update"/></td>
                        </form>
                    </tr>
                </c:forEach>
            </table>
            <%--Table of users--%>

            <%--Page navigation--%>
            <div class="col-lg-3">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <c:if test="${allPages ne null}">
                            <c:forEach var="i" begin="1" end="${allPages}">
                                <li><a href="/usersForAdmin?page=<c:out value="${i - 1}"/>"><c:out value="${i}"/></a>
                                </li>
                            </c:forEach>
                        </c:if>
                    </ul>
                </nav>
            </div>
            <%--Page navigation--%>

        </div>
    </div>
</aside>
<%--Main content--%>

<%--Script for delete users--%>
<script>
    $('#delete_user').click(function () {
        var data = {'toDelete[]': []};
        $(":checked").each(function () {
            if ($(this).val() == 'ADMIN' || $(this).val() == 'USER') {
//                alert($(this).val());
            } else {
                data['toDelete[]'].push($(this).val());
            }
        });
        $.post("/users/delete", data, function (data, status) {
            window.location.href = '/usersForAdmin';
        });
    });
</script>
<%--Script for delete users--%>
</body>
</html>
