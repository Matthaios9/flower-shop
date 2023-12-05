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
                        <div class="col-md-6 col-sm-6">
                            <div class="title">
                                <h4>Detail order</h4>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 text-right">
                            <a id="insert_btn"
                               onclick="history.back()"
                               class="btn btn-info "
                               type="button">Back </a>
                        </div>
                    </div>
                </div>

                <!-- cart main wrapper start -->
                <div class="cart-main-wrapper mt-no-text">
                    <div class="container custom-area">
                        <div class="row">
                            <div class="col-lg-12 col-custom">
                                <!-- Cart Table Area -->
                                <div class="cart-table table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th class="pro-thumbnail">Image</th>
                                            <th class="pro-title">Product</th>
                                            <th class="pro-price">Price</th>
                                            <th class="pro-quantity">Quantity</th>
                                            <th class="pro-subtotal">Total</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="order" items="${orders}">
                                            <tr>
                                                <td class="pro-thumbnail"><a href="#"><img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/flower/${order.flower.image}" alt="Product" /></a></td>
                                                <td class="pro-title"><a href="#">${order.flower.name}</a></td>
                                                <td class="pro-price"><span><fmt:formatNumber pattern="###,### VND"  value="${order.amount}" type="currency" /></span></td>
                                                <td class="pro-quantity">
                                                    <div class="quantity">
                                                        <span>${order.quantity}</span>
                                                    </div>
                                                </td>
                                                <td class="pro-subtotal"><span><fmt:formatNumber pattern="###,### VND"  value="${order.amount*order.quantity}" type="currency" /></span></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-5 ml-auto col-custom">
                                <!-- Cart Calculation Area -->
                                <div class="cart-calculator-wrapper">
                                    <div class="cart-calculate-items">
                                        <h3>Customer Information</h3>
                                        <div class="table-responsive">
                                            <table class="table">
                                                <tr>
                                                    <td>Name</td>
                                                    <td><span class="amount">${trans.customerName}</span></td>
                                                </tr>
                                                <tr>
                                                    <td>Phone</td>
                                                    <td><span class="amount">${trans.customerPhone}</span></td>
                                                </tr>
                                                <tr class="total">
                                                    <td>Address</td>
                                                    <td><span class="amount">${trans.customerAddress}</span></td>
                                                </tr>
                                                <tr>
                                                    <td>Ghi chú</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <textarea class="form-control text-center w-100" readonly>
                                                            ${orders[0].note}
                                                        </textarea>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- chia ra một cái giữ chi tiết -->
                            <div class="col-lg-5 ml-auto col-custom">
                                <!-- Cart Calculation Area -->
                                <div class="cart-calculator-wrapper">
                                    <div class="cart-calculate-items">
                                        <h3>Orders Totals</h3>
                                        <div class="table-responsive">
                                            <table class="table">
                                                <tr>
                                                    <td>Sub Total</td>
                                                    <td><span class="amount"><fmt:formatNumber pattern="###,### VND"  value="${subTotal1}" type="currency" /></span></td>
                                                </tr>
                                                <tr>
                                                    <td>Shipping</td>
                                                    <td><span class="amount"><fmt:formatNumber pattern="###,### VND"  value="${ship1}" type="currency" /></span></td>
                                                </tr>
                                                <tr class="total">
                                                    <td>Total</td>
                                                    <td class="total-amount"><span class="amount"><fmt:formatNumber pattern="###,### VND"  value="${trans.amount}" type="currency" /></span></td>
                                                </tr>
                                                <tr>
                                                    <td>Payment</td>
                                                    <td>
                                                        <c:if test="${trans.idPayment == 1}">
                                                            <span>Pay Online</span>
                                                        </c:if>
                                                        <c:if test="${trans.idPayment == 2}">
                                                            <span>Pay when receiving</span>
                                                        </c:if>
                                                        <c:if test="${trans.idPayment == 3}">
                                                            <span>Pay in shop</span>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- cart main wrapper end -->
            </div>
        </div>
    </div>
    
    
     <!-- JS
============================================ -->


    <!-- Modernizer JS -->
    <script src="<c:url value='/resources/assets/js/vendor/modernizr-3.7.1.min.js' />"></script>
    <!-- jQuery JS -->
    <script src="<c:url value='/resources/assets/js/vendor/jquery-3.5.1.min.js' />"></script>
    <!-- Bootstrap JS -->
    <script src="<c:url value='/resources/assets/js/vendor/bootstrap.bundle.min.js' />"></script>

    <!-- Swiper Slider JS -->
    <script src="<c:url value='/resources/assets/js/plugins/swiper-bundle.min.js' />"></script>
    <!-- nice select JS -->
    <script src="<c:url value='/resources/assets/js/plugins/nice-select.min.js' />"></script>
    <!-- Ajaxchimpt js -->
    <script src="<c:url value='/resources/assets/js/plugins/jquery.ajaxchimp.min.js' />"></script>
    <!-- Jquery Ui js -->
    <script src="<c:url value='/resources/assets/js/plugins/jquery-ui.min.js' />"></script>
    <!-- Jquery Countdown js -->
    <script src="<c:url value='/resources/assets/js/plugins/jquery.countdown.min.js' />"></script>
    <!-- jquery magnific popup js -->
    <script src="<c:url value='/resources/assets/js/plugins/jquery.magnific-popup.min.js' />"></script>

    <!-- Main JS -->
    <script src="<c:url value='/resources/assets/js/main.js' />"></script>
<%--	<script>--%>
<%--		    // Get all <li>--%>
<%--		  var lis = document.getElementById('navbar_main').querySelectorAll('li a');--%>
<%--		   /*  lis.forEach((item, index) => {--%>
<%--		    	--%>
<%--		    	item.className += " active";--%>
<%--		        console.log({ index, item })--%>
<%--		      }); */--%>
<%--	      var item=lis[1];--%>
<%--	      item.className += " active";--%>
<%--		   --%>
<%--	</script>--%>
    
    
</body>
</html>