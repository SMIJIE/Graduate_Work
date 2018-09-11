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
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href="<c:url value="/static/Logo_3.png"/>" rel="shortcut icon">
    <link href="<c:url value="/static/Style.css"/>" rel="stylesheet" type="text/css"/>
    <script src="<c:url value="/static/JavaScript.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/static/jquery.maskedinput.min.js"/>"></script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">

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

        td:hover {
            background: gold;
        }

        #cell {
            background: none;
        }
    </style>

    <script>
        <%--Script for Hidden form--%>
        $(function () {
            var dialog, form,

                date = $("#date"),
                time = $("#time"),
                event = $("#event"),
                allFields = $([]).add(date).add(time).add(event);

            function addEvent(b) {
                dialog.dialog("close");
                alert(document.getElementById("time").value)
                b.submit()
            }

            dialog = $("#dialog-form").dialog({
                autoOpen: false,
                height: 460,
                width: 350,
                modal: true,
                close: function () {
                    form[0].reset();
                    allFields.removeClass("ui-state-error");
                }
            });

            form = dialog.find("form").on("close", function (event) {
                event.preventDefault();
            });

            $("#create-event").on("click", function () {
                dialog.dialog("open");
                form[0].reset();
            });
        });
        <%--Script for Hidden form--%>

        <%--For date,time  validation--%>
        $(document).ready(function () {
            $('#date').blur(function () {
                if ($(this).val() != '') {
                    var pattern = /^([0-9]{4})+-([0-9]{2})+-([0-9]{2})$/i;
                    if (pattern.test($(this).val())) {
                        $(this).css({'border': '1px solid #569b44'});
                        $('#valid').text('Correctly');
                    } else {
                        $(this).css({'border': '1px solid #ff0000'});
                        $('#valid').text('Incorrectly');
                    }
                }
            });
            $('#time').blur(function () {
                if ($(this).val() != '') {
                    var pattern = /^([0-9]{2})+:([0-9]{2})$/i;
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
        <%--For date,time  validation--%>

        <!-- Setting the input mask for date,time fields -->
        $(function () {
            //элемент, к которому необходимо добавить маску
            $("#date").mask("9999-99-99", {placeholder: "*"});
            $("#time").mask("99:99", {placeholder: "*"});
        });
        <!-- Setting the input mask for date,time fields -->

    </script>
</head>

<body class="skin-black">

<%--Top line--%>
<header class="header">
    <%--Logo--%>
    <a href="/" class="logo">
        <img height="50px" width="45%" src="<c:url value="/static/Logo_2.png"/>"/>
    </a>
    <%--Logo--%>

    <div class="time"></div>

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
                        <!-- Menu Footer-->
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
        <h1>Scheduler:

            <%--Hidden form--%>
            &nbsp;&nbsp;&nbsp;<span id="create-event" style="color:green" class="glyphicon glyphicon-plus"
                                    aria-hidden="true"
                                    title="Add Event"></span>

            <div id="dialog-form" title="New Event ">
                <c:url value="/addEventSheduler" var="updateUrl"/>
                <form action="${updateUrl}" onSubmit="addEvent(this); return false">

                    <label>Date and Time</label>
                    <div class="input-group form-group has-success">
                        <div class="input-group-addon"><span class="glyphicon glyphicon-calendar"
                                                             aria-hidden="true"></span></div>
                        <input type="date" class="form-control" id="date" name="date" value="${currentDate}">
                        <input type="time" class="form-control" id="time" name="time" value="${currentTime}">
                    </div>

                    <label>Categoty and Amount</label>
                    <div class="input-group form-group has-success">
                        <div class="input-group-addon"><span class="glyphicon glyphicon-tasks"
                                                             aria-hidden="true"></span></div>
                        <input type="text" class="form-control" name="amount" placeholder="Input the amount"
                               maxlength="18">
                        <select class="form-control" name="category">
                            <option value="Nothing">Nothing</option>
                            <option value="Income">Income</option>
                            <option value="Expense">Expense</option>
                        </select>
                    </div>

                    <label>Event</label>
                    <div class="input-group form-group has-success">
                        <div class="input-group-addon"><span class="glyphicon glyphicon-book"
                                                             aria-hidden="true"></span></div>
                        <input type="text" class="form-control" name="event"
                               placeholder="For example, a business meeting!" maxlength="25">

                    </div>
                    <input type="submit" class="btn btn-success btn-lg" value="Add event"/>
                </form>
            </div>
            <%--Hidden form--%>

        </h1>

        <c:if test="${emptyFields ne null}">
            <br>
            <div class="alert alert-danger" role="alert" align="center">Empty or Invalid fields!</div>
        </c:if>
    </section>

    <%--Calendar--%>
    <div class="col-xs-12">

        <%--Page navigation--%>
        <nav aria-label="Page navigation">
            <ul class="pager">
                <li class="previous"><a href="/scheduler?month=<c:out value="${months - 1}"/>"><span
                        aria-hidden="true">&larr;</span> Previous Month</a></li>

                <span style="font-size: x-large">${currentMonth}</span>

                <li class="next"><a href="/scheduler?month=<c:out value="${months + 1}"/>">Next Month <span
                        aria-hidden="true">&rarr;</span></a></li>
            </ul>
        </nav>
        <%--Page navigation--%>

        <div class="table-responsive">
            <table class="table table-bordered" style="table-layout: fixed">
                <thead align="center">
                <tr bgcolor="#ff851b">
                    <td><b>Monday</b></td>
                    <td><b>Tuesday</b></td>
                    <td><b>Wednesday</b></td>
                    <td><b>Thursday</b></td>
                    <td><b>Friday</b></td>
                    <td><b>Saturday</b></td>
                    <td><b>Sunday</b></td>
                </tr>
                </thead>
                <tr height="150">
                    <c:forEach items="${dayOfMonthAndWeeks}" var="days">

                    <c:if test="${days.key eq '1' }">

                        <c:choose>

                            <c:when test="${days.value eq 'Monday'}">

                                <c:if test="${days.key eq currentDay && months eq '0'}">
                                    <td bgcolor="#eaeaec">
                                        <span style="color:#ff0000">${days.key}</span>

                                        <c:forEach items="${monthlyEventSheduler}" var="eventSheduler">
                                            <c:if test="${eventSheduler.key eq days.key}">
                                                <c:forEach items="${eventSheduler.value}" var="oneEventSheduler">
                                                    <br>
                                                    <a href="deleteEventSheduler?id=${oneEventSheduler.id}"><span
                                                            style="color:red" class="glyphicon glyphicon-minus"
                                                            aria-hidden="true" title="Delete event"></span></a>
                                                    <sup style="font-size: x-small; color: mediumblue">
                                                            ${oneEventSheduler.time}
                                                    </sup>
                                                    <c:if test="${oneEventSheduler.category eq 'Income'}">
                                                <span style="background: #00a65a">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Expense'}">
                                                <span style="background: #f56954">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Nothing'}">
                                                <span style="background: burlywood">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>

                                    </td>
                                </c:if>

                                <c:if test="${days.key ne currentDay || (days.key eq currentDay && months ne '0')}">
                                    <td bgcolor="#eaeaec">
                                            ${days.key}

                                        <c:forEach items="${monthlyEventSheduler}" var="eventSheduler">
                                            <c:if test="${eventSheduler.key eq days.key}">
                                                <c:forEach items="${eventSheduler.value}" var="oneEventSheduler">
                                                    <br>
                                                    <a href="deleteEventSheduler?id=${oneEventSheduler.id}"><span
                                                            style="color:red" class="glyphicon glyphicon-minus"
                                                            aria-hidden="true" title="Delete event"></span></a>
                                                    <sup style="font-size: x-small; color: mediumblue">
                                                            ${oneEventSheduler.time}
                                                    </sup>
                                                    <c:if test="${oneEventSheduler.category eq 'Income'}">
                                                <span style="background: #00a65a">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Expense'}">
                                                <span style="background: #f56954">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Nothing'}">
                                                <span style="background: burlywood">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>

                                    </td>
                                </c:if>
                            </c:when>

                            <c:when test="${days.value eq 'Tuesday'}">
                                <td id="cell"></td>
                                <c:if test="${days.key eq currentDay && months eq '0'}">
                                    <td bgcolor="#eaeaec">
                                        <span style="color:#ff0000">${days.key}</span>

                                        <c:forEach items="${monthlyEventSheduler}" var="eventSheduler">
                                            <c:if test="${eventSheduler.key eq days.key}">
                                                <c:forEach items="${eventSheduler.value}" var="oneEventSheduler">
                                                    <br>
                                                    <a href="deleteEventSheduler?id=${oneEventSheduler.id}"><span
                                                            style="color:red" class="glyphicon glyphicon-minus"
                                                            aria-hidden="true" title="Delete event"></span></a>
                                                    <sup style="font-size: x-small; color: mediumblue">
                                                            ${oneEventSheduler.time}
                                                    </sup>
                                                    <c:if test="${oneEventSheduler.category eq 'Income'}">
                                                <span style="background: #00a65a">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Expense'}">
                                                <span style="background: #f56954">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Nothing'}">
                                                <span style="background: burlywood">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>

                                    </td>
                                </c:if>

                                <c:if test="${days.key ne currentDay || (days.key eq currentDay && months ne '0')}">
                                    <td bgcolor="#eaeaec">
                                            ${days.key}

                                        <c:forEach items="${monthlyEventSheduler}" var="eventSheduler">
                                            <c:if test="${eventSheduler.key eq days.key}">
                                                <c:forEach items="${eventSheduler.value}" var="oneEventSheduler">
                                                    <br>
                                                    <a href="deleteEventSheduler?id=${oneEventSheduler.id}"><span
                                                            style="color:red" class="glyphicon glyphicon-minus"
                                                            aria-hidden="true" title="Delete event"></span></a>
                                                    <sup style="font-size: x-small; color: mediumblue">
                                                            ${oneEventSheduler.time}
                                                    </sup>
                                                    <c:if test="${oneEventSheduler.category eq 'Income'}">
                                                <span style="background: #00a65a">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Expense'}">
                                                <span style="background: #f56954">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Nothing'}">
                                                <span style="background: burlywood">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>

                                    </td>
                                </c:if>

                            </c:when>

                            <c:when test="${days.value eq 'Wednesday'}">
                                <td id="cell"></td>
                                <td id="cell"></td>
                                <c:if test="${days.key eq currentDay && months eq '0'}">
                                    <td bgcolor="#eaeaec">
                                        <span style="color:#ff0000">${days.key}</span>

                                        <c:forEach items="${monthlyEventSheduler}" var="eventSheduler">
                                            <c:if test="${eventSheduler.key eq days.key}">
                                                <c:forEach items="${eventSheduler.value}" var="oneEventSheduler">
                                                    <br>
                                                    <a href="deleteEventSheduler?id=${oneEventSheduler.id}"><span
                                                            style="color:red" class="glyphicon glyphicon-minus"
                                                            aria-hidden="true" title="Delete event"></span></a>
                                                    <sup style="font-size: x-small; color: mediumblue">
                                                            ${oneEventSheduler.time}
                                                    </sup>
                                                    <c:if test="${oneEventSheduler.category eq 'Income'}">
                                                <span style="background: #00a65a">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Expense'}">
                                                <span style="background: #f56954">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Nothing'}">
                                                <span style="background: burlywood">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>

                                    </td>
                                </c:if>

                                <c:if test="${days.key ne currentDay || (days.key eq currentDay && months ne '0')}">
                                    <td bgcolor="#eaeaec">
                                            ${days.key}

                                        <c:forEach items="${monthlyEventSheduler}" var="eventSheduler">
                                            <c:if test="${eventSheduler.key eq days.key}">
                                                <c:forEach items="${eventSheduler.value}" var="oneEventSheduler">
                                                    <br>
                                                    <a href="deleteEventSheduler?id=${oneEventSheduler.id}"><span
                                                            style="color:red" class="glyphicon glyphicon-minus"
                                                            aria-hidden="true" title="Delete event"></span></a>
                                                    <sup style="font-size: x-small; color: mediumblue">
                                                            ${oneEventSheduler.time}
                                                    </sup>
                                                    <c:if test="${oneEventSheduler.category eq 'Income'}">
                                                <span style="background: #00a65a">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Expense'}">
                                                <span style="background: #f56954">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Nothing'}">
                                                <span style="background: burlywood">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>

                                    </td>
                                </c:if>

                            </c:when>

                            <c:when test="${days.value eq 'Thursday'}">
                                <td id="cell"></td>
                                <td id="cell"></td>
                                <td id="cell"></td>
                                <c:if test="${days.key eq currentDay && months eq '0'}">
                                    <td bgcolor="#eaeaec">
                                        <span style="color:#ff0000">${days.key}</span>

                                        <c:forEach items="${monthlyEventSheduler}" var="eventSheduler">
                                            <c:if test="${eventSheduler.key eq days.key}">
                                                <c:forEach items="${eventSheduler.value}" var="oneEventSheduler">
                                                    <br>
                                                    <a href="deleteEventSheduler?id=${oneEventSheduler.id}"><span
                                                            style="color:red" class="glyphicon glyphicon-minus"
                                                            aria-hidden="true" title="Delete event"></span></a>
                                                    <sup style="font-size: x-small; color: mediumblue">
                                                            ${oneEventSheduler.time}
                                                    </sup>
                                                    <c:if test="${oneEventSheduler.category eq 'Income'}">
                                                <span style="background: #00a65a">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Expense'}">
                                                <span style="background: #f56954">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Nothing'}">
                                                <span style="background: burlywood">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>

                                    </td>
                                </c:if>

                                <c:if test="${days.key ne currentDay || (days.key eq currentDay && months ne '0')}">
                                    <td bgcolor="#eaeaec">
                                            ${days.key}

                                        <c:forEach items="${monthlyEventSheduler}" var="eventSheduler">
                                            <c:if test="${eventSheduler.key eq days.key}">
                                                <c:forEach items="${eventSheduler.value}" var="oneEventSheduler">
                                                    <br>
                                                    <a href="deleteEventSheduler?id=${oneEventSheduler.id}"><span
                                                            style="color:red" class="glyphicon glyphicon-minus"
                                                            aria-hidden="true" title="Delete event"></span></a>
                                                    <sup style="font-size: x-small; color: mediumblue">
                                                            ${oneEventSheduler.time}
                                                    </sup>
                                                    <c:if test="${oneEventSheduler.category eq 'Income'}">
                                                <span style="background: #00a65a">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Expense'}">
                                                <span style="background: #f56954">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Nothing'}">
                                                <span style="background: burlywood">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>

                                    </td>
                                </c:if>
                            </c:when>

                            <c:when test="${days.value eq 'Friday'}">
                                <td id="cell"></td>
                                <td id="cell"></td>
                                <td id="cell"></td>
                                <td id="cell"></td>
                                <c:if test="${days.key eq currentDay && months eq '0'}">
                                    <td bgcolor="#eaeaec">
                                        <span style="color:#ff0000">${days.key}</span>

                                        <c:forEach items="${monthlyEventSheduler}" var="eventSheduler">
                                            <c:if test="${eventSheduler.key eq days.key}">
                                                <c:forEach items="${eventSheduler.value}" var="oneEventSheduler">
                                                    <br>
                                                    <a href="deleteEventSheduler?id=${oneEventSheduler.id}"><span
                                                            style="color:red" class="glyphicon glyphicon-minus"
                                                            aria-hidden="true" title="Delete event"></span></a>
                                                    <sup style="font-size: x-small; color: mediumblue">
                                                            ${oneEventSheduler.time}
                                                    </sup>
                                                    <c:if test="${oneEventSheduler.category eq 'Income'}">
                                                <span style="background: #00a65a">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Expense'}">
                                                <span style="background: #f56954">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Nothing'}">
                                                <span style="background: burlywood">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>

                                    </td>
                                </c:if>

                                <c:if test="${days.key ne currentDay || (days.key eq currentDay && months ne '0')}">
                                    <td bgcolor="#eaeaec">
                                            ${days.key}

                                        <c:forEach items="${monthlyEventSheduler}" var="eventSheduler">
                                            <c:if test="${eventSheduler.key eq days.key}">
                                                <c:forEach items="${eventSheduler.value}" var="oneEventSheduler">
                                                    <br>
                                                    <a href="deleteEventSheduler?id=${oneEventSheduler.id}"><span
                                                            style="color:red" class="glyphicon glyphicon-minus"
                                                            aria-hidden="true" title="Delete event"></span></a>
                                                    <sup style="font-size: x-small; color: mediumblue">
                                                            ${oneEventSheduler.time}
                                                    </sup>
                                                    <c:if test="${oneEventSheduler.category eq 'Income'}">
                                                <span style="background: #00a65a">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Expense'}">
                                                <span style="background: #f56954">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Nothing'}">
                                                <span style="background: burlywood">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>

                                    </td>
                                </c:if>

                            </c:when>

                            <c:when test="${days.value eq 'Saturday'}">
                                <td id="cell"></td>
                                <td id="cell"></td>
                                <td id="cell"></td>
                                <td id="cell"></td>
                                <td id="cell"></td>
                                <c:if test="${days.key eq currentDay && months eq '0'}">
                                    <td bgcolor="#eaeaec">
                                        <span style="color:#ff0000">${days.key}</span>

                                        <c:forEach items="${monthlyEventSheduler}" var="eventSheduler">
                                            <c:if test="${eventSheduler.key eq days.key}">
                                                <c:forEach items="${eventSheduler.value}" var="oneEventSheduler">
                                                    <br>
                                                    <a href="deleteEventSheduler?id=${oneEventSheduler.id}"><span
                                                            style="color:red" class="glyphicon glyphicon-minus"
                                                            aria-hidden="true" title="Delete event"></span></a>
                                                    <sup style="font-size: x-small; color: mediumblue">
                                                            ${oneEventSheduler.time}
                                                    </sup>
                                                    <c:if test="${oneEventSheduler.category eq 'Income'}">
                                                <span style="background: #00a65a">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Expense'}">
                                                <span style="background: #f56954">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Nothing'}">
                                                <span style="background: burlywood">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>

                                    </td>
                                </c:if>

                                <c:if test="${days.key ne currentDay || (days.key eq currentDay && months ne '0')}">
                                    <td bgcolor="#eaeaec">
                                            ${days.key}

                                        <c:forEach items="${monthlyEventSheduler}" var="eventSheduler">
                                            <c:if test="${eventSheduler.key eq days.key}">
                                                <c:forEach items="${eventSheduler.value}" var="oneEventSheduler">
                                                    <br>
                                                    <a href="deleteEventSheduler?id=${oneEventSheduler.id}"><span
                                                            style="color:red" class="glyphicon glyphicon-minus"
                                                            aria-hidden="true" title="Delete event"></span></a>
                                                    <sup style="font-size: x-small; color: mediumblue">
                                                            ${oneEventSheduler.time}
                                                    </sup>
                                                    <c:if test="${oneEventSheduler.category eq 'Income'}">
                                                <span style="background: #00a65a">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Expense'}">
                                                <span style="background: #f56954">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Nothing'}">
                                                <span style="background: burlywood">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>

                                    </td>
                                </c:if>

                            </c:when>

                            <c:when test="${days.value eq 'Sunday'}">
                                <td id="cell"></td>
                                <td id="cell"></td>
                                <td id="cell"></td>
                                <td id="cell"></td>
                                <td id="cell"></td>
                                <td id="cell"></td>
                                <c:if test="${days.key eq currentDay && months eq '0'}">
                                    <td bgcolor="#eaeaec">
                                        <span style="color:#ff0000">${days.key}</span>

                                        <c:forEach items="${monthlyEventSheduler}" var="eventSheduler">
                                            <c:if test="${eventSheduler.key eq days.key}">
                                                <c:forEach items="${eventSheduler.value}" var="oneEventSheduler">
                                                    <br>
                                                    <a href="deleteEventSheduler?id=${oneEventSheduler.id}"><span
                                                            style="color:red" class="glyphicon glyphicon-minus"
                                                            aria-hidden="true" title="Delete event"></span></a>
                                                    <sup style="font-size: x-small; color: mediumblue">
                                                            ${oneEventSheduler.time}
                                                    </sup>
                                                    <c:if test="${oneEventSheduler.category eq 'Income'}">
                                                <span style="background: #00a65a">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Expense'}">
                                                <span style="background: #f56954">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Nothing'}">
                                                <span style="background: burlywood">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>

                                    </td>
                                </c:if>

                                <c:if test="${days.key ne currentDay || (days.key eq currentDay && months ne '0')}">
                                    <td bgcolor="#eaeaec">
                                            ${days.key}

                                        <c:forEach items="${monthlyEventSheduler}" var="eventSheduler">
                                            <c:if test="${eventSheduler.key eq days.key}">
                                                <c:forEach items="${eventSheduler.value}" var="oneEventSheduler">
                                                    <br>
                                                    <a href="deleteEventSheduler?id=${oneEventSheduler.id}"><span
                                                            style="color:red" class="glyphicon glyphicon-minus"
                                                            aria-hidden="true" title="Delete event"></span></a>
                                                    <sup style="font-size: x-small; color: mediumblue">
                                                            ${oneEventSheduler.time}
                                                    </sup>
                                                    <c:if test="${oneEventSheduler.category eq 'Income'}">
                                                <span style="background: #00a65a">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Expense'}">
                                                <span style="background: #f56954">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                    <c:if test="${oneEventSheduler.category eq 'Nothing'}">
                                                <span style="background: burlywood">
                                                        ${oneEventSheduler.event}
                                                </span>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>

                                    </td>
                                </c:if>

                            </c:when>

                        </c:choose>

                    </c:if>

                    <c:if test="${days.value eq 'Monday' && days.key ne '1'}">

                </tr>
                <tr height="150">
                    <c:if test="${days.key eq currentDay && months eq 0}">
                        <td bgcolor="#eaeaec">
                            <span style="color:#ff0000">${days.key}</span>

                            <c:forEach items="${monthlyEventSheduler}" var="eventSheduler">
                                <c:if test="${eventSheduler.key eq days.key}">
                                    <c:forEach items="${eventSheduler.value}" var="oneEventSheduler">
                                        <br>
                                        <a href="deleteEventSheduler?id=${oneEventSheduler.id}"><span style="color:red"
                                                                                                      class="glyphicon glyphicon-minus"
                                                                                                      aria-hidden="true"
                                                                                                      title="Delete event"></span></a>
                                        <sup style="font-size: x-small; color: mediumblue">
                                                ${oneEventSheduler.time}
                                        </sup>
                                        <c:if test="${oneEventSheduler.category eq 'Income'}">
                                                <span style="background: #00a65a">
                                                        ${oneEventSheduler.event}
                                                </span>
                                        </c:if>
                                        <c:if test="${oneEventSheduler.category eq 'Expense'}">
                                                <span style="background: #f56954">
                                                        ${oneEventSheduler.event}
                                                </span>
                                        </c:if>
                                        <c:if test="${oneEventSheduler.category eq 'Nothing'}">
                                                <span style="background: burlywood">
                                                        ${oneEventSheduler.event}
                                                </span>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>

                        </td>
                    </c:if>

                    <c:if test="${days.key ne currentDay || (days.key eq currentDay && months ne 0)}">
                        <td bgcolor="#eaeaec">
                                ${days.key}

                            <c:forEach items="${monthlyEventSheduler}" var="eventSheduler">
                                <c:if test="${eventSheduler.key eq days.key}">
                                    <c:forEach items="${eventSheduler.value}" var="oneEventSheduler">
                                        <br>
                                        <a href="deleteEventSheduler?id=${oneEventSheduler.id}"><span style="color:red"
                                                                                                      class="glyphicon glyphicon-minus"
                                                                                                      aria-hidden="true"
                                                                                                      title="Delete event"></span></a>
                                        <sup style="font-size: x-small; color: mediumblue">
                                                ${oneEventSheduler.time}
                                        </sup>
                                        <c:if test="${oneEventSheduler.category eq 'Income'}">
                                                <span style="background: #00a65a">
                                                        ${oneEventSheduler.event}
                                                </span>
                                        </c:if>
                                        <c:if test="${oneEventSheduler.category eq 'Expense'}">
                                                <span style="background: #f56954">
                                                        ${oneEventSheduler.event}
                                                </span>
                                        </c:if>
                                        <c:if test="${oneEventSheduler.category eq 'Nothing'}">
                                                <span style="background: burlywood">
                                                        ${oneEventSheduler.event}
                                                </span>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>

                        </td>
                    </c:if>

                    </c:if>

                    <c:if test="${days.value ne 'Monday' && days.key ne '1'}">
                        <c:if test="${days.key eq currentDay && months eq 0}">
                            <td bgcolor="#eaeaec">
                                <span style="color:#ff0000">${days.key}</span>

                                <c:forEach items="${monthlyEventSheduler}" var="eventSheduler">
                                    <c:if test="${eventSheduler.key eq days.key}">
                                        <c:forEach items="${eventSheduler.value}" var="oneEventSheduler">
                                            <br>
                                            <a href="deleteEventSheduler?id=${oneEventSheduler.id}"><span
                                                    style="color:red" class="glyphicon glyphicon-minus"
                                                    aria-hidden="true" title="Delete event"></span></a>
                                            <sup style="font-size: x-small; color: mediumblue">
                                                    ${oneEventSheduler.time}
                                            </sup>
                                            <c:if test="${oneEventSheduler.category eq 'Income'}">
                                                <span style="background: #00a65a">
                                                        ${oneEventSheduler.event}
                                                </span>
                                            </c:if>
                                            <c:if test="${oneEventSheduler.category eq 'Expense'}">
                                                <span style="background: #f56954">
                                                        ${oneEventSheduler.event}
                                                </span>
                                            </c:if>
                                            <c:if test="${oneEventSheduler.category eq 'Nothing'}">
                                                <span style="background: burlywood">
                                                        ${oneEventSheduler.event}
                                                </span>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                </c:forEach>

                            </td>
                        </c:if>

                        <c:if test="${days.key ne currentDay || (days.key eq currentDay && months ne 0)}">
                            <td bgcolor="#eaeaec">
                                    ${days.key}

                                <c:forEach items="${monthlyEventSheduler}" var="eventSheduler">
                                    <c:if test="${eventSheduler.key eq days.key}">
                                        <c:forEach items="${eventSheduler.value}" var="oneEventSheduler">
                                            <br>
                                            <a href="deleteEventSheduler?id=${oneEventSheduler.id}"><span
                                                    style="color:red" class="glyphicon glyphicon-minus"
                                                    aria-hidden="true" title="Delete event"></span></a>
                                            <sup style="font-size: x-small; color: mediumblue">
                                                    ${oneEventSheduler.time}
                                            </sup>
                                            <c:if test="${oneEventSheduler.category eq 'Income'}">
                                                <span style="background: #00a65a">
                                                        ${oneEventSheduler.event}
                                                </span>
                                            </c:if>
                                            <c:if test="${oneEventSheduler.category eq 'Expense'}">
                                                <span style="background: #f56954">
                                                        ${oneEventSheduler.event}
                                                </span>
                                            </c:if>
                                            <c:if test="${oneEventSheduler.category eq 'Nothing'}">
                                                <span style="background: burlywood">
                                                        ${oneEventSheduler.event}
                                                </span>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                </c:forEach>

                            </td>
                        </c:if>

                    </c:if>

                    </c:forEach>
                </tr>
            </table>
        </div>

    </div>
    <%--Calendar--%>

</aside>
<%--Main content--%>
<script>
    <%--Checking the date,time,amount field--%>
    document.getElementsByTagName('input')[0].onkeypress = function (e) {
        e = e || event;
        if (e.ctrlKey || e.altKey || e.metaKey) return;
        var chr = getChar(e);
        // с null надо осторожно в неравенствах, т.к. например null >= '0' => true!
        // на всякий случай лучше вынести проверку chr == null отдельно
        if (chr == null) return;
        if (chr < '0' || chr > '9') {
            return false;
        }
    }
    document.getElementsByTagName('input')[1].onkeypress = function (e) {
        e = e || event;
        if (e.ctrlKey || e.altKey || e.metaKey) return;
        var chr = getChar(e);
        // с null надо осторожно в неравенствах, т.к. например null >= '0' => true!
        // на всякий случай лучше вынести проверку chr == null отдельно
        if (chr == null) return;
        if (chr < '0' || chr > '9') {
            return false;
        }
    }
    document.getElementsByTagName('input')[2].onkeypress = function (e) {
        e = e || event;
        if (e.ctrlKey || e.altKey || e.metaKey) return;
        var chr = getChar(e);
        // с null надо осторожно в неравенствах, т.к. например null >= '0' => true!
        // на всякий случай лучше вынести проверку chr == null отдельно
        if (chr == null) return;
        if (chr < '0' || chr > '9') {
            return false;
        }
    }

    function getChar(event) {
        if (event.which == null) {
            if (event.keyCode < 32) return null;
            return String.fromCharCode(event.keyCode) // IE
        }
        if (event.which != 0 && event.charCode != 0) {
            if (event.which < 32) return null;
            return String.fromCharCode(event.which) // остальные
        }
        return null; // специальная клавиша
    }

    <%--Checking the date,time,amount field--%>
</script>
</body>
</html>