<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Don hang</title>
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
                                <h4>Order list</h4>
                            </div>
                        </div>
                    </div>
                </div>

                <jsp:useBean id="pagedListHolder" scope="request"
                             type="org.springframework.beans.support.PagedListHolder" />
                <c:url value="admin/transaction.htm" var="pagedLink">
                    <c:param name="p" value="~" />
                </c:url>
                <!-- Simple Datatable start -->
                <div class="card-box mb-30">
                    <div class="mr-4">
                        <form class="d-inline-flex mb-5" style="float:right">
                            <input name="searchInput" id="searchInput" class="form-control me-2" type="search"
                                   placeholder="Nhập tên khách hàng" aria-label="Search">

                            <button name="btnsearch" id="searchProduct"
                                    class="btn btn-outline-info" type="submit">Search</button>
                        </form>
                    </div>
                    <hr>
<%--                    <div class="mb-3" style=" color: blue">Thông Báo: ${message}</div>--%>
                    <div class="pb-20">
                        <table class="data-table table stripe hover nowrap" id="myTable">
                            <thead class="bg-dark color-white">
                            <tr>
                                <th class="table-plus datatable-nosort">Transaction No</th>
                                <th>Customer name</th>
                                <th>Mobile No</th>
                                <th>Address</th>
                                <th>Date</th>
                                <th class="datatable-nosort">Status</th>
                                <th class="datatable-nosort">Total</th>
                                <th class="datatable-nosort">Detail</th>
                                <th class="datatable-nosort">Approval/Cancel</th>
                                <th class="datatable-nosort">Confirm</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${pagedListHolder.pageList}" varStatus="row">
                                <tr>
                                    <td class="table-plus">${item.id}</td>
                                    <td>${item.customerName}</td>
                                    <td>${item.customerPhone}</td>
                                    <td>${item.customerAddress}</td>
                                    <td><fmt:formatDate value="${item.created}" pattern="dd-MM-yyyy HH:mm:ss" /></td>
                                    <td>
                                        <c:if test="${item.status == 3}"><c:out value = "Hoàn thành"/></c:if>
                                        <c:if test="${item.status == 1 || item.status == 4}" >
                                            <c:out value = "Chưa duyệt"/>
                                        </c:if>
                                        <c:if test="${item.status == 2 || item.status == 5}" >
                                            <c:out value = "Đã duyệt"/>
                                        </c:if>
                                        <c:if test="${item.status == 6}" >
                                            <c:out value = "Đã hủy"/>
                                        </c:if>
                                    </td>
                                    <td><fmt:formatNumber pattern="###,### VND"  value="${item.amount}" type="currency" /></td>
                                    <td><a href="${pageContext.request.contextPath}/admin/transaction/view/${item.id}.htm" class="btn flosun-button secondary-btn theme-color  rounded-0">View</a></td>
                                    <td class="pro-remove">
                                        <c:if test="${item.status == 3}">
                                            <a href=""><i class="lnr lnr-cloud-check"></i></a>
                                        </c:if>
                                        <c:if test="${item.status == 1 || item.status == 4}" >
                                            <a href="${pageContext.request.contextPath}/admin/transaction/approval.htm?transId=${item.id}&p=${currentPage}"><i class="lnr lnr-sync"></i></a>
                                            <span style="font-size: large;"> / </span>
                                            <a href="${pageContext.request.contextPath}/admin/transaction/cancel.htm?transId=${item.id}&p=${currentPage}"><i class="lnr lnr-trash"></i></a>
                                        </c:if>
                                        <c:if test="${item.status == 2 || item.status == 5}" >
                                            <a href="${pageContext.request.contextPath}/admin/transaction/cancel.htm?transId=${item.id}&p=${currentPage}"><i class="lnr lnr-trash"></i></a>
                                        </c:if>
                                        <c:if test="${item.status == 6}" >
                                            <a href=""><i class="lnr lnr-cloud-check"></i></a>
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:if test="${item.status == 2 || item.status == 5}">
                                            <a href="${pageContext.request.contextPath}/admin/transaction/confirm.htm?transId=${item.id}&p=${currentPage}" class="btn flosun-button secondary-btn theme-color  rounded-0">Confirm</a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="mr-4">
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
