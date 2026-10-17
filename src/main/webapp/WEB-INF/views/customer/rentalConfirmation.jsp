<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="uiRole" value="customer" scope="request"/>
<c:set var="pageTitle" value="Rental Confirmation" scope="request"/>
<c:set var="navKey" value="rentals" scope="request"/>
<!DOCTYPE html>
<html lang="en"><head><%@ include file="../common/head.jsp" %></head>
<body class="drivehub role-customer" data-role="customer" data-context="${pageContext.request.contextPath}" data-page="rentalConfirmation">
<a class="skip-link" href="#main-content">Skip to main content</a>
<%@ include file="../common/sidebar.jsp" %>
<%@ include file="../common/navbar.jsp" %>
<main class="app-main page-content" id="main-content">
<%-- FRONTEND MOCK DATA: replace with backend model/JSTL later --%>
<section class="content-card confirmation-card"><div class="success-mark"><i class="bi bi-check-lg" aria-hidden="true"></i></div><h1>Rental Request Submitted!</h1><p>Your rental request preview is complete<br>and is pending confirmation.</p><p class="preview-note">Demo preview only. No booking has been created.</p><dl class="info-list confirmation-details"><div><dt>Request ID</dt><dd>DRH-20261018-001</dd></div><div><dt>Vehicle</dt><dd><strong data-confirm-vehicle>Toyota Corolla</strong></dd></div><div><dt>Pick-up Date</dt><dd><span data-confirm-pickup>Oct 18, 2026, 10:00 AM</span></dd></div><div><dt>Return Date</dt><dd><span data-confirm-return>Oct 21, 2026, 10:00 AM</span></dd></div><div><dt>Total Amount</dt><dd><strong data-confirm-total>Rs. 26,000</strong></dd></div><div><dt>Status</dt><dd><span class="badge badge-warning" data-status-label>Pending</span></dd></div></dl><div class="form-actions"><a class="btn btn-primary" href="${pageContext.request.contextPath}/customer/rentals" >View My Rentals</a><a class="btn btn-secondary" href="${pageContext.request.contextPath}/customer/vehicles" >Continue Browsing</a></div></section>
</main>
<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/messages.jsp" %>
</body></html>
