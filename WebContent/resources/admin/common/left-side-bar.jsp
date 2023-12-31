<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="loadcss.jsp"%>
 <base href="${pageContext.servletContext.contextPath}/" />  
<div class="left-side-bar">
	<div class="brand-logo">
			<a class="" href="admin/flower.htm">
				<img class="" src="resources/admin/vendors/images/logo.png" alt="lgogo"> 
			</a>
		</div>
	<div class="menu-block customscroll">
		<div class="sidebar-menu">
			<ul id="accordion-menu">
				<li>
					<div class="dropdown-divider"></div>
				</li>
				<li class="dropdown" id="qlh" style="display: block"><a
					href="admin/flower.htm" class="dropdown-toggle no-arrow"
					data-toggle="tooltip" data-placement="right" title=""
					data-original-title="QUẢN LÍ PHIẾU MUA"> <span
						class="micon dw dw-file"></span> <span class="text-yellow">QUẢN
							LÝ HOA</span>
				</a></li>
				<li class="dropdown" id="qluser" style="display: block"><a
					href="admin/user.htm" class="dropdown-toggle no-arrow"
					data-toggle="tooltip" data-placement="right" title=""
					data-original-title="QUẢN LÝ TÀI KHOẢN"> <span
						class="micon dw dw-ruler"></span> <span class="text-yellow">QUẢN
							LÝ USER</span>
				</a></li>
				<li class="dropdown" id="qldh" style="display: block"><a
					href="admin/transaction.htm" class="dropdown-toggle no-arrow"
					data-toggle="tooltip" data-placement="right" title=""
					data-original-title="QUẢN LÍ ĐƠN HÀNG"> <span
						class="micon dw dw-invoice"></span> <span class="text-yellow">QUẢN
							LÍ ĐƠN HÀNG</span>
				</a></li>
				<li class="dropdown" id="baoCaoGD" style="display: block"><a
						href="admin/report/transaction.htm" class="dropdown-toggle no-arrow"
						data-toggle="tooltip" data-placement="right" title=""
						data-original-title="BÁO CÁO"> <span
						class="micon dw dw-analytics-3"></span> <span class="text-yellow text-break">BÁO CÁO DOANH THU GD</span>
				</a></li>

				<li class="dropdown" id="baoCaoSP" style="display: block"><a
						href="admin/report/product.htm" class="dropdown-toggle no-arrow"
						data-toggle="tooltip" data-placement="right" title=""
						data-original-title="BÁO CÁO"> <span
						class="micon dw dw-analytics-3"></span> <span class="text-yellow text-break">BÁO CÁO DOANH THU SP</span>
				</a></li>

				<!-- 				<li> -->
				<!-- 					<div class="dropdown-divider"></div> -->
				<!-- 				</li> -->
				<li>
					<div class="dropdown-divider"></div>
				</li>
				<!-- 				<li> -->
				<!-- 					<div class="sidebar-small-cap">MỞ RỘNG</div> -->
				<!-- 				</li> -->
				<li class="dropdown" id="dangxuat" style=""><a
					href="${pageContext.request.contextPath}/admin/logout.htm" class="dropdown-toggle no-arrow"
					data-toggle="tooltip" data-placement="right" title=""
					data-original-title="Đăng xuất"> 
					<span
						class="micon dw dw-logout1"></span> 
						<span class="text-yellow">Đăng xuất</span>
				</a></li>
			</ul>
		</div>
	</div>
</div>
<!-- <script>
	window.addEventListener('load', function() {
		if ("${role}" != "admin") {
			document.getElementById("qlpm").style.display = "";
			document.getElementById("qltb").style.display = "";
			document.getElementById("dangxuat").style.display = "";
		}
		if ("${role}" == "admin") {
			document.getElementById("qlpm").style.display = "";
			document.getElementById("qltb").style.display = "";
			document.getElementById("qlnv").style.display = "";
			document.getElementById("dangxuat").style.display = "";
		}
	})
</script> -->