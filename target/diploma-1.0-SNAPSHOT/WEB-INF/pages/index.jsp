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
    </style>
    <%--Google Charts_1--%>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages': ['corechart']});
        google.charts.setOnLoadCallback(drawVisualization);

        function drawVisualization() {
            // Some raw data (not necessarily accurate)
            var data = google.visualization.arrayToDataTable([
                    ['Month', 'Income', {role: 'style'}, 'Expense', {role: 'style'}],
                    <c:forEach items="${annualAmountOfExpense}" var="expense">
                    <c:forEach items="${annualAmountOfIncome}" var="income">
                    <c:if test="${income.key eq expense.key }">
                    ['${income.key}', ${income.value}, 'stroke-color: #66CD00; stroke-opacity: 0.6; stroke-width: 2; fill-color: #66CD00; fill-opacity: 1', ${expense.value}, 'stroke-color: #FF0000; stroke-opacity: 0.6; stroke-width: 2; fill-color: #FF0000; fill-opacity: 0,8'],
                    </c:if>
                    </c:forEach>
                    </c:forEach>

                ])
            ;
            var options = {
                title: 'Annual Income and Expense (${user.currencyCode})',
                seriesType: 'bars',
                series: {5: {type: 'line'}},
                colors: ['#66CD00', '#FF0000'],
                backgroundColor: "transparent"
            };

            var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>
    <%--Google Charts_1--%>

    <%--Google Charts_2--%>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages': ['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Month', 'Income', {role: 'style'}, 'Expense', {role: 'style'}],
                <c:forEach items="${annualAmountOfExpense}" var="expense">
                <c:forEach items="${annualAmountOfIncome}" var="income">
                <c:if test="${income.key eq expense.key }">
                ['${income.key}', ${income.value}, 'stroke-color: #66CD00; stroke-opacity: 1; stroke-width: 2; fill-color: #66CD00; fill-opacity: 0.5', ${expense.value}, 'stroke-color: #FF0000; stroke-opacity: 1; stroke-width: 2; fill-color: #FF0000; fill-opacity: 0.5'],
                </c:if>
                </c:forEach>
                </c:forEach>
            ]);

            var options = {
                title: 'Annual Income and Expense (${user.currencyCode})',
                vAxis: {minValue: 0},
                colors: ['#66CD00', '#FF0000'],
                backgroundColor: "transparent",
            };

            var chart = new google.visualization.AreaChart(document.getElementById('chart_div_2'));
            chart.draw(data, options);
        }
    </script>
    <%--Google Charts_2--%>

    <%--Google Charts_3--%>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load("current", {packages: ["corechart"]});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Month', 'Income'],
                <c:forEach items="${annualAmountOfIncome}" var="income">
                ['${income.key}', ${income.value}],

                </c:forEach>
            ]);

            var options = {
                title: 'Annual Income (${user.currencyCode})',
                is3D: true,
                backgroundColor: "transparent"

            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
            chart.draw(data, options);
        }
    </script>
    <%--Google Charts_3--%>

    <%--Google Charts_4--%>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load("current", {packages: ["corechart"]});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Month', 'Expense'],
                <c:forEach items="${annualAmountOfExpense}" var="expense">
                ['${expense.key}', ${expense.value}],
                </c:forEach>
            ]);

            var options = {
                title: 'Annual Expense (${user.currencyCode})',
                is3D: true,
                backgroundColor: "transparent"

            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart_3d_2'));
            chart.draw(data, options);
        }
    </script>
    <%--Google Charts_4--%>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load("current", {packages: ["corechart"]});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Task', 'Hours per Day'],
                ['Work', 11],
                ['Eat', 2],
                ['Commute', 2],
                ['Watch TV', 2],
                ['Sleep', 7]
            ]);

            var options = {
                title: 'My Daily Activities',
                pieHole: 0.4,
                backgroundColor: "transparent"

            };

            var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
            chart.draw(data, options);
        }
    </script>
</head>
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
        <h1>Home:</h1>
    </section>

    <div class="row">

        <%--Currency Converter--%>
        <div class="col-lg-6 col-lg-9">
            <div id='gcw_mainFrP7YNeCA' class='gcw_mainFrP7YNeCA'></div>
            <script>function reloadFrP7YNeCA() {
                var sc = document.getElementById('scFrP7YNeCA');
                if (sc) sc.parentNode.removeChild(sc);
                sc = document.createElement('script');
                sc.type = 'text/javascript';
                sc.charset = 'UTF-8';
                sc.async = true;
                sc.id = 'scFrP7YNeCA';
                sc.src = 'http://freecurrencyrates.com/en/widget-horizontal-editable?iso=USDEURGBPPLNRUBUAH&df=2&p=FrP7YNeCA&v=fis&source=yahoo&width=900&width_title=225&firstrowvalue=1&thm=8E846B,FEEEBD,494437,817865,FFFFFF,D19405,FECE2F,383838,000000&title=Currency%20Converter&tzo=-180';
                var div = document.getElementById('gcw_mainFrP7YNeCA');
                div.parentNode.insertBefore(sc, div);
            }

            reloadFrP7YNeCA(); </script>
        </div>
        <br>
        <%--Currency Converter--%>

        <%--Income this month--%>
        <div class="col-lg-3 col-xs-6">
            <div class="small-box bg-green">
                <h3>&nbsp; ${amountIncome}
                    <em>${user.currencyCode}</em>
                </h3>
                <p>&nbsp; Income this month</p>
                <a href="/income" class="small-box-footer">Write income <span class="glyphicon glyphicon-export"
                                                                              aria-hidden="true"></span></a>
            </div>
        </div>
        <%--Income this month--%>

        <%--Expenditure this month--%>
        <div class="col-lg-3 col-xs-6">
            <div class="small-box bg-red">
                <h3>&nbsp; ${amountExpense}
                    <em>${user.currencyCode}</em>
                </h3>
                <p>&nbsp; Expenditure this month</p>
                <a href="/expense" class="small-box-footer">Write expense <span class="glyphicon glyphicon-import"
                                                                                aria-hidden="true"></span></a>
            </div>
        </div>
        <br>
        <%--Expenditure this month--%>
    </div>

    <div class="row">
        <%--Exchange rates--%>
        <div class="col-lg-3 col-xs-6">
            <div class="small-box bg-teal">
                <h3>&nbsp; ${USD}
                    <em>UAH</em>
                </h3>
                <p>&nbsp; Dollar rate for today</p>
                <a href="/exchangeRate" class="small-box-footer">
                    All exchange rates <span class="glyphicon glyphicon-usd" aria-hidden="true"></span>
                </a>
            </div>
        </div>

        <div class="col-lg-3 col-xs-6">
            <div class="small-box bg-teal">
                <h3>&nbsp; ${EUR}
                    <em>UAH</em>
                </h3>
                <p>&nbsp; Euro rate for today</p>
                <a href="/exchangeRate" class="small-box-footer">
                    All exchange rates <span class="glyphicon glyphicon-euro" aria-hidden="true"></span>
                </a>
            </div>
        </div>


        <%--Scheduler--%>
        <div class="col-lg-6 col-xs-9">
            <div id="carousel-example-generic" class="carousel slide bg-orange" data-ride="carousel">
                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="active item" align="center">
                        <H5>Date: ${currentDate}</H5>
                        <h3>Here is the list of your events for today!</h3>
                        <a href="/scheduler" class="small-box-footer">Scheduler <span
                                class="glyphicon glyphicon-calendar"
                                aria-hidden="true"></span></a>
                    </div>
                    <c:forEach items="${eventSheduler}" var="event">
                        <div class="item" align="center">
                            <H5>Time: ${event.time}</H5>
                            <h3>${event.event}</h3>
                            <a href="/scheduler" class="small-box-footer">Scheduler <span
                                    class="glyphicon glyphicon-calendar"
                                    aria-hidden="true"></span></a>
                        </div>
                    </c:forEach>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                </a>
            </div>
        </div>
        <%--Scheduler--%>
    </div>
    <%--Exchange rates--%>

    <%--Google Charts--%>
    <div class="row">
        <div class="col-lg-12">
            <div id="chart_div" style="width: 100%; height: 500px;"></div>
        </div>

    </div>
    <div class="row">
        <div class="col-lg-12">
            <div id="chart_div_2" style="width: 100%; height: 500px;"></div>
        </div>

    </div>
    <div class="row">
        <div class="col-lg-6">
            <div id="piechart_3d" style="width: 700px; height: 500px;"></div>
        </div>
        <div class="col-lg-6">
            <div id="piechart_3d_2" style="width: 700px; height: 500px;"></div>
        </div>
    </div>
    <%--Google Charts--%>

</aside>
<%--Main content--%>

</body>
</html>