<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>仓库</title>

    <!-- Bootstrap -->
    <link href="../static/css/lib/bootstrap.min.css" rel="stylesheet">
    <!--jQuery UI-->
    <link href="../static/css/lib/jquery-ui.min.css" rel="stylesheet" type="text/css">


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
    <nav class="navbar navbar-default fixed" id="header-nav" role="navigation" style="width:100%">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Legend仓库管理系统</a>
            </div>
            <div class="fl">
                <ul class="nav navbar-nav">
                    <!--<li class="role-navbar-nav" id="manager-navbar-nav"><a href="#">经理</a></li>-->
                    <!--<li class="role-navbar-nav" id="factory-navbar-nav"><a href="#">工厂</a></li>-->
                    <li class="role-navbar-nav active" id="warehouse-navbar-nav"><a href="#">仓库</a></li>
                </ul>
            </div>
            <div class="fr">
                <ul class="nav navbar-nav navbar-right">
                    <li><a id="notification" href="#"><span class="glyphicon glyphicon-envelope"></span> 通知</a></li>
                    <li><a id="staff-name" href="#"><span class="glyphicon glyphicon-user"></span> staff-name</a></li>
                    <li><a id="logout" href="/cg/staff/logout"><span class="glyphicon glyphicon-log-out"></span> 退出</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<!--<div class="container wrap" >-->
<div class="wrap">
    <!--<div class="row">-->
    <div class="col-md-1">
        <nav class="block-display block-shadow" id="feature-nav">
            <ul class="nav nav-tabs nav-stacked nav-pills nav-click" id="nav-tabs">
                <li class="warehouse-navtabs active"><a name="inStorageRecord" href="#in-storage-record"
                                                                        role="tab" data-toggle="tab">入库登记</a></li>
                <li class="warehouse-navtabs"><a id="delivery-record-atag" name="deliveryRecord"
                                                                        href="#delivery-record"
                                                                        role="tab" data-toggle="tab">配送记录</a></li>
                <li class="warehouse-navtabs"><a name="warehouseInventory"
                                                                        href="#warehouse-inventory" role="tab"
                                                                        data-toggle="tab">仓库库存</a></li>
                <li class="warehouse-navtabs"><a name="warehouseStatistics"
                                                                        href="#warehouse-statistics" role="tab"
                                                                        data-toggle="tab">仓库统计</a></li>
            </ul>
        </nav>
    </div>
    <div class="col-md-11">
        <div class="" id="feature-display">
            <div class="tab-content">
                <div class="tab-pane active" id="in-storage-record">
                    <!--仓库入库登记-->
                    <div class="panel panel-default block-shadow add-form" id="add-in-storage-record"
                         data-url="WarehouseInStorageRecord">
                        <div class="panel-heading">
                            <div class="panel-title">入库登记</div>
                        </div>
                        <div class="panel-body panel-body-border add-header">
                            <button type="button" class="btn btn-info btn-submit-in-add-form"
                                    id="btn-submit-in-storage">提交
                            </button>
                            <button type="button" class="btn btn-danger btn-cancel-in-add-form"
                                    id="btn-cancel-in-storage">取消
                            </button>
                            <span class="hiddenMsg"></span>
                        </div>
                        <div class="panel-body add-table">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>入库日期</th>
                                    <th>型号</th>
                                    <th>规格（厚*长*宽 单位：mm）</th>
                                    <th>形态</th>
                                    <th>入库总量（kg）</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <!-- 时间戳 -->
                                    <td><input class="add-form-item" type="text" id="in-storage-end-date"></td>
                                    <td class="hidden"><input class="add-form-item" type="text" id="in-storage-end-time"
                                                              name="inStorageDate">
                                    </td>
                                    <td><select class="add-form-item" id="in-storage-product-model"
                                                name="product.productModelInfo.productModel"></select></td>
                                    <td><input class="add-form-item size-input-editor" type="text"
                                               id="in-storage-product-size" name="product.productSize"
                                               placeholder="厚*长*宽"></td>
                                    <td><select class="add-form-item" id="in-storage-product-shape"
                                                name="product.productShape">
                                        <option value="直" selected>直</option>
                                        <option value="弯">弯</option>
                                    </select>
                                    </td>
                                    <td><input class="add-form-item number-judge" type="text" id="in-storage-quantity"
                                               placeholder="保留三位小数"
                                               name="inStorageQuantity"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div id="modal-in-storage" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true"
                             data-show="false">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">请确认添加的信息是否正确？</h4>
                                    </div>
                                    <div class="modal-body">
                                        <label>入库日期：</label><span id="modal-in-storage-end-date"></span><br>
                                        <!-- 时间戳 -->
                                        <label class="hidden">时间戳：</label><span class="hidden"
                                                                                id="modal-in-storage-end-time"></span>
                                        <label>型号：</label><span id="modal-in-storage-product-model"></span><br>
                                        <label>规格(mm)：</label><span id="modal-in-storage-product-size"></span><br>
                                        <label>形态：</label><span id="modal-in-storage-product-shape"></span><br>
                                        <label>入库总量：</label><span id="modal-in-storage-quantity"></span> kg<br>
                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn-confirm-in-modal" type="button"
                                                id="modal-btn-submit-in-storage">是
                                        </button>
                                        <button type="button" data-dismiss="modal">否</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--仓库入库记录-->
                    <div class="panel panel-default block-shadow warehouse-in-storage-record-table table-data"
                         data-url="WarehouseInStorageRecords"
                         data-div=".warehouse-in-storage-record-table" data-abbreviation="wisr" data-function="common">
                        <div class="panel-heading">
                            <div class="panel-title">入库记录</div>
                        </div>
                        <div class="panel-body panel-body-border">
                            <label for="wisr-start-date">起始时间 </label><input type="text" name="start-time"
                                                                             id="wisr-start-date" value="">
                            <label for="wisr-end-date">终止时间 </label><input type="text" name="end-time"
                                                                           id="wisr-end-date" value="">
                            <button id="wisr-select" type="button" class="btn btn-primary">筛选</button>
                            <button id="wisr-threeDays" type="button" class="btn btn-primary">近三天</button>
                            <button id="wisr-aWeek" type="button" class="btn btn-primary">近一周</button>
                            <button id="wisr-twoWeeks" type="button" class="btn btn-primary">近两周</button>
                            <button id="wisr-aMonth" type="button" class="btn btn-primary">近一个月</button>
                        </div>
                        <div class="panel-body table-content">
                            <table class="table table-bordered" data-modal-id="modal-in-storage-modify">
                                <thead>
                                <tr>
                                    <th name="id" data-key="id">ID</th>
                                    <th name="inStorageNum" data-key="inStorageNum">入库编号</th>
                                    <th name="inStorageDate" data-key="inStorageDate">入库日期</th>
                                    <th name="productModel" data-key="product.productModelInfo.productModel">产品型号</th>
                                    <th name="productSize" data-key="product.productSize">产品规格</th>
                                    <th name="productShape" data-key="product.productShape">产品形态</th>
                                    <th name="inStorageQuantity" data-key="inStorageQuantity">入库重量(kg)</th>
                                    <th name="staffName" data-key="staffName">登记人</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <!--修改模态框-->
                        <div id="modal-in-storage-modify" class="modal fade modal-modify" role="dialog"
                             aria-hidden="true" data-show="false">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">修改仓库入库记录</h4>
                                    </div>
                                    <div class="modal-body" data-url="WarehouseInStorageRecord/">
                                        <div>
                                            <label for="in-storage-id-modify">ID:</label>
                                            <input class="data-modify input-num" type="text"
                                                   id="in-storage-id-modify"
                                                   data-key="id"
                                                   data-type="int" disabled>
                                        </div>
                                        <div>
                                            <label for="in-storage-num-modify">入库编号：</label>
                                            <input class="data-modify" type="text"
                                                   id="in-storage-num-modify"
                                                   data-key="inStorageNum" data-type="string" disabled>
                                        </div>
                                        <div>
                                            <label for="in-storage-date-modify">入库日期：</label>
                                            <input class="data-modify" type="text" id="in-storage-date-modify"
                                                   data-key="inStorageDate"
                                                   data-type="time" disabled>
                                        </div>
                                        <div>
                                            <label for="in-storage-product-model-modify">产品型号：</label>
                                            <select class="data-modify" id="in-storage-product-model-modify"
                                                    data-key="product.productModelInfo.productModel" data-type="string">
                                            </select>
                                        </div>
                                        <div>
                                            <label for="in-storage-product-size-modify">产品规格（厚*长*宽）：</label>
                                            <input class="data-modify size-input-editor" type="text"
                                                   id="in-storage-product-size-modify"
                                                   data-key="product.productSize" data-type="string">
                                        </div>
                                        <div>
                                            <label for="in-storage-product-shape-modify">产品形态：</label>
                                            <select class="data-modify" id="in-storage-product-shape-modify"
                                                    data-key="product.productShape" data-type="string">
                                                <option value="直">直</option>
                                                <option value="弯">弯</option>
                                            </select>
                                        </div>
                                        <div>
                                            <label for="in-storage-quantity-modify">入库重量(kg)：</label>
                                            <input class="number-judge data-modify" type="number"
                                                   id="in-storage-quantity-modify"
                                                   data-key="inStorageQuantity" data-type="float">
                                        </div>
                                        <div>
                                            <label for="in-storage-registrant-modify">登记人：</label>
                                            <input class="data-modify" type="text"
                                                   id="in-storage-registrant-modify"
                                                   data-key="staffName" data-type="string" disabled>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" id="btn-commit-in-storage"
                                                class="btn-commit-in-modal">提交
                                        </button>
                                        <button type="button" data-dismiss="modal">取消</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="delivery-record">
                    <!--配送登记-->
                    <div class="panel panel-default block-shadow add-form" id="add-delivery-record" data-url="">
                        <div class="panel-heading">
                            <div class="panel-title">配送登记</div>
                        </div>
                        <div class="panel-body panel-body-border add-header">
                            <button type="button" class="btn btn-info btn-submit-in-add-form"
                                    id="btn-submit-add-delivery">提交
                            </button>
                            <button type="button" class="btn btn-danger btn-cancel-in-add-form"
                                    id="btn-cancel-add-delivery">取消
                            </button>
                            <span class="hiddenMsg"></span>
                        </div>
                        <div class="panel-body add-table">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>配送日期</th>
                                    <th>订单编号</th>
                                    <th>型号</th>
                                    <th>规格（厚*长*宽 单位：mm）</th>
                                    <th>形态</th>
                                    <th>配送量（kg）</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><input class="add-form-item" type="text" id="add-delivery-end-date"></td>
                                    <!-- 时间戳 -->
                                    <td class="hidden"><input class="add-form-item" type="text"
                                                              id="add-delivery-end-time" name="deliveryDate"></td>
                                    <td><select class="add-form-item" id="add-delivery-order-num"></select></td>
                                    <!-- 产品信息及收货人信息根据订单编号自动生成 -->
                                    <td><input class="add-form-item" type="text" id="add-delivery-product-model"></td>
                                    <td><input class="add-form-item" type="text" id="add-delivery-product-size"></td>
                                    <td><input class="add-form-item" type="text" id="add-delivery-product-shape"></td>
                                    <td class="hidden"><input class="add-form-item" type="text"
                                                              id="add-delivery-customer-name"></td>

                                    <td><input class="add-form-item number-judge" type="text" id="add-delivery-quantity"
                                               placeholder="保留三位小数" name="deliveryQuantity"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div id="modal-add-delivery" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true"
                             data-show="false">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">请确认添加的信息是否正确？</h4>
                                    </div>
                                    <div class="modal-body">
                                        <label>配送日期：</label><span id="modal-add-delivery-end-date"></span><br>
                                        <!-- 时间戳 -->
                                        <label class="hidden">时间戳：</label><span class="hidden"
                                                                                id="modal-add-delivery-end-time"></span>
                                        <label>订单编号：</label><span id="modal-add-delivery-order-num"></span><br>
                                        <label>型号：</label><span id="modal-add-delivery-product-model"></span><br>
                                        <label>规格（mm）：</label><span id="modal-add-delivery-product-size"></span><br>
                                        <label>形态：</label><span id="modal-add-delivery-product-shape"></span><br>
                                        <label>收货人：</label><span id="modal-add-delivery-customer-name"></span><br>
                                        <label>配送量：</label><span id="modal-add-delivery-quantity"></span> kg<br>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" id="modal-btn-submit-add-delivery">确认</button>
                                        <button type="button" data-dismiss="modal">取消</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 仓库配送记录 -->
                    <div class="panel panel-default block-shadow warehouse-delivery-record-table table-data"
                         data-url="warehouseDeliveryRecord" data-div=".warehouse-delivery-record-table"
                         data-abbreviation="wdr" data-function="common">
                        <div class="panel-heading">
                            <div class="panel-title">仓库配送记录</div>
                        </div>
                        <div class="panel-body panel-body-border">
                            <label for="wdr-start-date">起始时间 </label><input type="text" name="start-time"
                                                                            id="wdr-start-date" value="">
                            <label for="wdr-end-date">终止时间 </label><input type="text" name="end-time" id="wdr-end-date"
                                                                          value="">
                            <button id="wdr-select" type="button" class="btn btn-primary">筛选</button>
                            <button id="wdr-threeDays" type="button" class="btn btn-primary">近三天</button>
                            <button id="wdr-aWeek" type="button" class="btn btn-primary">近一周</button>
                            <button id="wdr-twoWeeks" type="button" class="btn btn-primary">近两周</button>
                            <button id="wdr-aMonth" type="button" class="btn btn-primary">近一个月</button>
                        </div>
                        <div class="panel-body table-content">
                            <table class="table table-bordered" data-modal-id="modal-warehouse-delivery-modify">
                                <thead>
                                <tr>
                                    <th name="id" data-key="id">配送ID</th>
                                    <th name="orderNum" data-key="warehouseOrder.orderNum">订单编号</th>
                                    <th name="deliveryNum" data-key="deliveryNum">配送编号</th>
                                    <th name="deliveryDate" data-key="deliveryDate">配送日期</th>
                                    <th name="customerName" data-key="customer.customerName">收货人</th>
                                    <th name="productModel"
                                        data-key="warehouseOrder.product.productModelInfo.productModel">产品型号
                                    </th>
                                    <th name="productSize" data-key="warehouseOrder.product.productSize">产品规格</th>
                                    <th name="productShape" data-key="warehouseOrder.product.productShape">产品形态</th>
                                    <th name="deliveryQuantity" data-key="deliveryQuantity">配送数量</th>
                                    <th name="staffName" data-key="staffName">登记人</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <!-- warehouse_delivery_racord_table仓库配送记录，table对应的th缺少data-key属性-->
                        <div id="modal-warehouse-delivery-modify" class="modal fade modal-modify" tabindex="-1"
                             role="dialog" aria-hidden="true" data-show="false">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">修改仓库配送记录</h4>
                                    </div>
                                    <div class="modal-body" data-url="warehouseDeliveryRecord/">
                                        <div>
                                            <label for="warehouse-delivery-id-modify">配送ID:</label>
                                            <input class="data-modify input-num" type="text"
                                                   id="warehouse-delivery-id-modify" data-key="id"
                                                   data-type="int" disabled>
                                        </div>
                                        <div>
                                            <label for="warehouse-order-num-modify">订单编号：</label>
                                            <input class="data-modify" type="text"
                                                   id="warehouse-order-num-modify"
                                                   data-key="warehouseOrder.orderNum" data-type="string" disabled>
                                        </div>
                                        <div>
                                            <label for="warehouse-delivery-num-modify">配送编号：</label>
                                            <input class="data-modify" type="text"
                                                   id="warehouse-delivery-num-modify"
                                                   data-key="deliveryNum" data-type="string" disabled>
                                        </div>
                                        <div>
                                            <label for="warehouse-delivery-date-modify">配送日期：</label>
                                            <input class="data-modify" type="text"
                                                   id="warehouse-delivery-date-modify" data-key="deliveryDate"
                                                   data-type="time" disabled>
                                        </div>
                                        <div>
                                            <label for="warehouse-customer-modify">收货人</label>
                                            <input class="data-modify" type="text"
                                                   id="warehouse-customer-modify" data-key="customer.customerName"
                                                   data-type="string" disabled>
                                        </div>
                                        <div>
                                            <label for="warehouse-delivery-product-model-modify">产品型号：</label>
                                            <input class="data-modify"
                                                   id="warehouse-delivery-product-model-modify"
                                                   data-key="warehouseOrder.product.productModelInfo.productModel"
                                                   data-type="string" disabled>
                                        </div>
                                        <div>
                                            <label for="warehouse-delivery-product-size-modify">产品规格（厚*长*宽）：</label>
                                            <input class="data-modify"
                                                   id="warehouse-delivery-product-size-modify"
                                                   data-key="warehouseOrder.product.productSize" data-type="string"
                                                   disabled>
                                        </div>
                                        <div>
                                            <label for="warehouse-delivery-product-shape-modify">产品形态：</label>
                                            <input class="data-modify"
                                                   id="warehouse-delivery-product-shape-modify"
                                                   data-key="warehouseOrder.product.productShape" data-type="string"
                                                   disabled>
                                        </div>
                                        <div>
                                            <label for="warehouse-deliveryQuantity-modify">配送数量(kg)：</label>
                                            <input class="data-modify number-judge" type="text"
                                                   id="warehouse-deliveryQuantity-modify"
                                                   data-key="deliveryQuantity" data-type="string">
                                        </div>
                                        <div>
                                            <label for="warehouse-registrant-modify">登记人：</label>
                                            <input class="data-modify" type="text"
                                                   id="warehouse-registrant-modify"
                                                   data-key="staffName" data-type="string" disabled>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn-commit-in-modal">提交</button>
                                        <button type="button" data-dismiss="modal">取消</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="warehouse-inventory">
                    <!-- 仓库产品库存 -->
                    <div class="panel panel-default block-shadow warehouse-product-inventory-table table-data"
                         data-url="WarehouseProductInventory" data-div=".warehouse-product-inventory-table"
                         data-abbreviation="wpi" data-function="productInventory">
                        <div class="panel-heading">
                            <div class="panel-title">仓库产品库存</div>
                        </div>
                        <div class="panel-body panel-body-border">
                            <label for="wpi-product-model">产品型号 </label>
                            <select type="text" name="product-model"
                                    id="wpi-product-model" value="">
                            </select>
                            <label for="wpi-product-size">产品规格（厚*长*宽）： </label>
                            <input class="size-input-editor"
                                   type="text" name="product-size"
                                   id="wpi-product-size" value="">
                            <label for="wpi-product-shape">产品形态 </label>
                            <select name="product-shape" id="wpi-product-shape">
                                <option value="none"></option>
                                <option value="直">直</option>
                                <option value="弯">弯</option>
                            </select>
                            <button id="wpi-select" type="button" class="btn btn-primary">筛选</button>
                        </div>
                        <div class="panel-body table-content">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th name="productModel" data-key="product.productModelInfo.productModel">产品型号</th>
                                    <th name="productSize" data-key="product.productSize">产品规格</th>
                                    <th name="productShape" data-key="product.productSize">产品形态</th>
                                    <th name="productInventory" data-key="productInventory">库存总量(kg)</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="warehouse-statistics">
                    <!-- 仓库产品库存统计 -->
                    <div class="panel panel-default block-shadow warehouse-product-inventory-statistics-table table-data"
                         data-url="warehouseStatistics" data-div=".warehouse-product-inventory-statistics-table"
                         data-abbreviation="wpis" data-function="common">
                        <div class="panel-heading">
                            <div class="panel-title">仓库库存统计</div>
                        </div>
                        <div class="panel-body panel-body-border">
                            <label for="wpis-start-date">起始时间 </label><input type="text" name="start-time"
                                                                             id="wpis-start-date" value="">
                            <label for="wpis-end-date">终止时间 </label><input type="text" name="end-time"
                                                                           id="wpis-end-date" value="">
                            <button id="wpis-select" type="button" class="btn btn-primary">查看</button>
                            <button id="wpis-threeDays" type="button" class="btn btn-primary">近三天</button>
                            <button id="wpis-aWeek" type="button" class="btn btn-primary">近一周</button>
                            <button id="wpis-twoWeeks" type="button" class="btn btn-primary">近两周</button>
                            <button id="wpis-aMonth" type="button" class="btn btn-primary">近一个月</button>
                        </div>
                        <div class="panel-body table-content">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th name="productModel" data-key="product.productModelInfo.productModel">产品型号</th>
                                    <th name="productSize" data-key="product.productSize">产品规格</th>
                                    <th name="productShape" data-key="product.productShape">产品形态</th>
                                    <th name="allInStorageQuantity" data-key="allInStorageQuantity">总入库量</th>
                                    <th name="allDeliveryQuantity" data-key="allDeliveryQuantity">总出库量</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="return-message-modal">
            <!-- 各种提交确认框的模版,一定要放在触发按钮所处的div之后 -->
            <div id="modal-confirm" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" data-show="false">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <span class="modal-title">请确认添加的信息是否正确？</span>
                            <!-- 以下两个按钮都需要定义事件 -->
                            <button type="button" id="btn-confirm" data-dismiss="modal">确认</button>
                            <button type="button" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 提交确认框结束 -->

            <!-- 提交成功信息提示框 -->
            <div id="modal-success" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" data-show="false">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <span class="modal-title">添加成功！</span>
                            <button type="button" data-dismiss="modal">返回</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 提交失败信息提示框 -->
            <div id="modal-fail" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" data-show="false">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <span class="modal-title">提交失败，请检查输入的内容是否为空或错误。</span>
                            <button type="button" data-dismiss="modal">返回</button>
                        </div>
                    </div>
                </div>
            </div>

            <!--操作提示状态框-->
            <!--<div id="modal-status" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" data-show="false">-->
            <!--<div class="modal-dialog">-->
            <!--<div class="modal-content">-->
            <!--<div class="modal-body">-->
            <!--<span class="modal-title"></span>-->
            <!--<button type="button" data-dismiss="modal">返回</button>-->
            <!--</div>-->
            <!--</div>-->
            <!--</div>-->
            <!--</div>-->
            <!--操作提示状态框结束-->


        </div>
    </div>
    <div class="" style="display: none">
        <div class="block-display" id="notification-center">
            <h3>message通知</h3>
        </div>
    </div>
</div>
</div>
<!--动画提示框-->
<div class="block-display" id="server-status">
    <span class="server-title"></span>
</div>

<!--产品规格添加框-->
<div class="block-display hide" id="product-size-editor">
    <div>
        <label for="thickness-editor">厚度(mm):</label>
        <input id="thickness-editor" type="number" min="0.1" step="0.1">
    </div>
    <div>
        <label for="length-editor">长度(mm):</label>
        <input id="length-editor" type="number" min="0.1" step="0.1">
    </div>
    <div>
        <label for="width-editor">宽度(mm):</label>
        <input id="width-editor" type="number" min="0.1" step="0.1">
    </div>
    <div>
        <button id="btn-confirm-editor" type="button">确认</button>
        <button id="btn-cancel-editor" type="button">取消</button>
        <button id="btn-reset-editor" type="button">重置</button>
    </div>
</div>

<!--<footer style="position:fixed;bottom:0">-->
<!--<div style="width:100%;margin:0 auto;text-align:center" >-->
<!--<p>你的公司</p>-->
<!--</div>-->
<!--</footer>-->

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../static/js/lib/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../static/js/lib/bootstrap.min.js"></script>
<script src="../static/js/lib/jquery-ui.min.js"></script>
<script src="../static/js/common.js"></script>
</body>
</html>