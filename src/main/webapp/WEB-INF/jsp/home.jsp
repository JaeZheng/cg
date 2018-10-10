<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>NAV</title>

    <!-- Bootstrap -->
    <link href="../static/css/lib/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../static/js/lib/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../static/js/lib/bootstrap.min.js"></script>

    <link href="../static/css/common.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <!--<script src="../static/js/lib//html5shiv.min.js"></script>-->
    <!--<script src="../static/js/lib/respond.min.js"></script>-->
    <!--[endif]-->
</head>
<body>
<header>
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Legend仓库管理系统</a>
            </div>
            <!--<div>-->
                <!--<ul class="nav navbar-nav nav-tabs">-->
                    <!--<li><a href="#home" role="tab" data-toggle="tab">首页</a></li>-->
                <!--</ul>-->
            <!--</div>-->
            <div>
                <ul class="nav navbar-nav navbar-right">
                    <li><a id="staff-num" href="#"><span class="glyphicon glyphicon-user"></span> staff-num</a></li>
                    <li><a id="logout" href="/cg/staff/logout"><span class="glyphicon glyphicon-log-out"></span> 退出</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<div class="container wrap">
    <div class="row">
        <div class="col-lg-2">
            <nav class="">
                <ul class="nav nav-tabs nav-stacked nav-pills" id="nav-tabs">
                    <li><a name="home" href="#home" role="tab" data-toggle="tab">首页</a></li>
                    <li><a name="materialPurchase" href="#meterial-purchase" role="tab" data-toggle="tab">原料采购</a></li>
                    <li><a name="blowOn" href="#blow-on" role="tab" data-toggle="tab">开炉登记</a></li>
                    <li><a name="div1" href="#blow-on" role="tab" data-toggle="tab">开炉登记</a></li>
                    <li><a name="div2" href="#blow-on" role="tab" data-toggle="tab">开炉登记</a></li>
                    <li><a name="div3" href="#blow-on" role="tab" data-toggle="tab">开炉登记</a></li>
                </ul>
            </nav>
        </div>
        <div class="col-lg-8 tab-content feature-display" id="feature-display">
            <div class="tab-pane active" id="home">
                首页
            </div>
            <div class="tab-pane" id="material-purchase">
                原料采购
            </div>
            <div class="tab-pane" id="blow-on">
                开炉登记
            </div>
        </div>
        <div class="col-lg-2">
            message通知
        </div>
    </div>
</div>

<script>
var path = "http://localhost:8080/cg/";
var featureDisplay = {};

$(document).ready(function () {
    $.getJSON(path + 'staff/userInfo', function (json) {
        $('#staff-num').html('<span class="glyphicon glyphicon-user"></span> ' + json.result);
    });
});


//language=JQuery-CSS
$('ul[id=nav-tabs] a').click(function () {
    console.log(this.name);
    console.log(typeof(this.name));
    if (this.name in featureDisplay) {
        $('#feature-display').append(featureDisplay[this.name]);
    } else {
        $.get(path + 'div',
            {
                "featureID": this.name
            }, function (result) {
            console.log(result);
            featureDisplay.set(this.name, result);
            console.log(featureDisplay);
            });
    }
});
</script>
</body>
</html>