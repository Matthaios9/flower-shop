<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Transaction</title>
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/resources/assets/images/icon.ico' />">
    <%@include file="/resources/admin/common/loadcss.jsp"%>
    <!-- Linear Icons CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/css/vendor/linearicons.min.css' />">
    <!-- Swiper CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/css/plugins/swiper-bundle.min.css' />">

    <!-- Animation CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/css/plugins/animate.min.css' />">
    <!-- Jquery ui CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/css/plugins/jquery-ui.min.css' />">
    <!-- Nice Select CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/css/plugins/nice-select.min.css' />">
    <!-- Magnific Popup -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/css/plugins/magnific-popup.css' />">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/css/style.css' />">

    <%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
    <style type="text/css">
        *[id$=errors] {
            color: red;
            font-style: italic;
        }
    </style>
</head>
<body>
<%@include file="/resources/admin/common/header.jsp"%>
<%@include file="/resources/admin/common/left-side-bar.jsp"%>
<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            <div class="page-header">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="title">
                            <h4>Sale report by transaction</h4>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:useBean id="pagedListHolder" scope="request"
                         type="org.springframework.beans.support.PagedListHolder" />
            <c:url value="admin/report/product.htm?fromDate=${fromDate}&toDate=${toDate}" var="pagedLink">
                <c:param name="p" value="~" />
            </c:url>
            <!-- Simple Datatable start -->
            <div class="card-box">
                <div class="mr-4">
                    <form class="d-inline-flex mb-5" style="float:right">
                        <div class="row">
                            <div class="col-sm-5 col-md-5">
                                <div class="row">
                                    <label class="col-sm-4 col-md-4 col-form-label">Từ ngày</label>
                                    <div class="col-sm-8 col-md-8 form-group">
                                        <input name="fromDate" id="fromDate" class="form-control me-2" type="date" value="${fromDate}"
                                               aria-label="Search">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-5 col-md-5">
                                <div class="row">
                                    <label class="col-sm-5 col-md-5 col-form-label">Đến ngày</label>
                                    <div class="col-sm-7 col-md-7 input-group mb-0">
                                        <input name="toDate" id="toDate" class="form-control me-2" type="date" value="${toDate}"
                                               aria-label="Search">
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <button name="btnsearch" id="searchProduct"
                                        class="btn btn-outline-info" type="submit">Search</button>
                            </div>
                        </div>
                    </form>
                </div>
                <hr>
                <%--                    <div class="mb-3" style=" color: blue">Thông Báo: ${message}</div>--%>
                <div class="pb-20">
                    <table class="data-table table stripe hover nowrap" id="myTable">
                        <thead class="bg-dark color-white">
                        <tr>
                            <th class="table-plus datatable-nosort">Product ID</th>
                            <th>Product Name</th>
                            <th>Sale quantity</th>
                            <th>Total</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${pagedListHolder.pageList}" varStatus="row">
                            <tr>
                                <td class="table-plus">${item.idFlower}</td>
                                <td>${item.name}</td>
                                <td>${item.totalQuantity}</td>
                                <td><fmt:formatNumber pattern="###,### VND"  value="${item.totalAmount}" type="currency" /></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="mr-4 mb-4" style="float: right;">
                        <span>Tổng tiền: <fmt:formatNumber pattern="###,### VND"  value="${totalAmount}" type="currency" /></span>
                    </div>
                    <div class="mr-4 mb-4">
                        <tg:paging pagedListHolder="${pagedListHolder}"
                                   pagedLink="${pagedLink}" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
