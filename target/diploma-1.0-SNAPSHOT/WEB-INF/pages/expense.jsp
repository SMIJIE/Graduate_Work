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
    <script src="<c:url value="/static/jquery.maskedinput.min.js"/>"></script>

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
            table-layout: fixed;
            width: 100%
        }

        tr:hover {
            background: #00a65a;
        }

        td {
            word-wrap: break-word;
            border: none;
            border-bottom: 1px solid #f56954;
        }
    </style>

    <script>

        <%-- Setting the input mask for date fields --%>
        $(function () {
            //элемент, к которому необходимо добавить маску
            $("#date").mask("9999-99-99", {placeholder: "*"});
        });
        <%-- Setting the input mask for date fields --%>

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
                =
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
        <h1>Expense:</h1>
    </section>

    <div class="row">
        <%--Form for expense--%>
        <div class="col-lg-4 form-group has-error">
            <c:url value="/addExpense" var="updateUrl"/>
            <form action="${updateUrl}" method="POST">
                <h4>Date:</h4>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="glyphicon glyphicon-calendar"
                                                             aria-hidden="true"></span></div>
                        <input type="date" class="form-control" id="date" name="date" value="${currentDate}">
                    </div>
                </div>
                <h4>Amount (${user.currencyCode}):</h4>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="glyphicon glyphicon-piggy-bank"
                                                             aria-hidden="true"></span></div>
                        <input type="text" class="form-control" name="amount"
                               placeholder="Input the amount of income" maxlength="18">
                        <div class="input-group-addon">.00</div>
                    </div>
                </div>
                <h4>Category:</h4>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="glyphicon glyphicon-tasks"
                                                             aria-hidden="true"></span></div>
                        <select class="form-control" name="category">
                            <optgroup label="Mandatory Costs">
                                <option value="Credit">Credit</option>
                                <option value="Rent">Rent</option>
                                <option value="Internet">Internet</option>
                                <option value="Connectivity">Connectivity</option>
                            </optgroup>
                            <optgroup label="Food & Beverage">
                                <option value="Food">Food</option>
                                <option value="Beverage">Beverage</option>
                            </optgroup>
                            <optgroup label="Caring for yourself">
                                <option value="Beauty saloon">Beauty saloon</option>
                                <option value="Clothes / shoes">Clothes / Shoes</option>
                                <option value="Medicine">Medicine</option>
                                <option value="Cosmetics">Cosmetics</option>
                            </optgroup>
                            <optgroup label="Entertainment">
                                <option value="Restaurant / Coffee Shop">Restaurant / Coffee Shop</option>
                                <option value="Cinema / Theater">Cinema / Theater</option>
                                <option value="Journey">Journey</option>
                                <option value="Entertainment / Hobbies">Entertainment / Hobbies</option>
                            </optgroup>
                            <optgroup label="Other Expenses">
                                <option value="Hygiene / Household Products">Hygiene / Household Products</option>
                                <option value="Gifts">Gifts</option>
                                <option value="Technology / Gadgets">Technology / Gadgets</option>
                                <option value="Transport">Transport</option>
                                <option value="Other Expenses">Other Expenses</option>
                            </optgroup>
                        </select>
                    </div>
                </div>
                <h4>Comment:</h4>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="glyphicon glyphicon-pencil"
                                                             aria-hidden="true"></span></div>
                        <textarea class="form-control" name="comments" rows="3" cols="34"
                                  placeholder="Enter a description"></textarea>
                    </div>
                </div>

                <input type="submit" class="btn btn-danger btn-lg" value="Add"/>
            </form>
            <c:if test="${emptyFields ne null}">
                <div class="alert alert-success" role="alert">Empty or Invalid fields!</div>
            </c:if>
        </div>
        <%--Form for expense--%>

        <%--Table of expense--%>
        <div class="col-lg-8 form-group has-warnings">

            <%--Page navigation--%>
            <nav aria-label="Page navigation">
                <ul class="pager">
                    <li class="previous"><a href="/expense?month=<c:out value="${months - 1}"/>"><span
                            aria-hidden="true">&larr;</span>
                        Previous Month</a></li>

                    <span style="font-size: x-large">${currentMonth}</span>

                    <li class="next"><a href="/expense?month=<c:out value="${months + 1}"/>">Next Month <span
                            aria-hidden="true">&rarr;</span></a></li>
                </ul>
            </nav>
            <%--Page navigation--%>

            <table class="table table-condensed">
                <thead>
                <tr bgcolor="#f56954">
                    <td width="5%"></td>
                    <td width="15%"><b>Date</b></td>
                    <td><b>Amount</b></td>
                    <td width="10%"><b>Code</b></td>
                    <td width="20%"><b>Category</b></td>
                    <td><b>Comment</b></td>
                </tr>
                </thead>
                <c:forEach items="${expenses}" var="expenseOne">
                    <tr>
                        <td align="center"><a href="deleteExpense?id=${expenseOne.id}" title="Delete note"><span
                                class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></td>
                        <td>${expenseOne.date}</td>
                        <td>${expenseOne.amount}</td>
                        <td>${expenseOne.currencyCode}</td>
                        <td>${expenseOne.category}</td>
                        <td>${expenseOne.comment}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <%--Table of expense--%>

    </div>
</aside>
<%--Main content--%>

<script>
    <%--Checking the date,amount field--%>
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
    <%--Checking the date,amount field--%>
</script>

</body>
</html>