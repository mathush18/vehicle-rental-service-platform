<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="uiRole" value="customer" scope="request"/>
<c:set var="pageTitle" value="Rental Details" scope="request"/>
<c:set var="navKey" value="rentals" scope="request"/>
<!DOCTYPE html>
<html lang="en"><head><%@ include file="../common/head.jsp" %></head>
<body class="drivehub role-customer" data-role="customer" data-context="${pageContext.request.contextPath}" data-page="rentalDetails">
<a class="skip-link" href="#main-content">Skip to main content</a>
<%@ include file="../common/sidebar.jsp" %>
<%@ include file="../common/navbar.jsp" %>
<main class="app-main page-content" id="main-content">
<%-- FRONTEND MOCK DATA: replace with backend model/JSTL later --%>
<a class="back-link" href="${pageContext.request.contextPath}/customer/rentals"><i class="bi bi-arrow-left" aria-hidden="true"></i> Back to My Rentals</a><header class="page-header"><div class="page-heading"><i class="bi bi-calendar-check" aria-hidden="true"></i><div><h1>Rental Details</h1><p>View your booking information</p></div></div></header><section class="content-card" data-customer-rental-details><div class="selected-vehicle"><div data-rental-photo><div class="fleet-photo photo-1" role="img" aria-label="Toyota Corolla" ></div></div><div><h2 data-rental-vehicle>Toyota Corolla</h2><p data-rental-branch>Colombo Branch</p><div data-rental-status><span class="badge badge-warning" data-status-label>Pending</span></div></div></div><dl class="info-list spec-grid"><div><dt>Rental ID</dt><dd><span data-rental-id>DRH-20261018-001</span></dd></div><div><dt>Customer</dt><dd>Mathushalini.T</dd></div><div><dt>Pick-up Date</dt><dd><span data-rental-start>Oct 18, 2026</span></dd></div><div><dt>Return Date</dt><dd><span data-rental-end>Oct 21, 2026</span></dd></div><div><dt>Total Amount</dt><dd><strong data-rental-amount>Rs. 26,000</strong></dd></div><div><dt>Contact</dt><dd>+94 77 123 4567</dd></div></dl><div class="form-actions"><a class="btn btn-secondary" href="${pageContext.request.contextPath}/customer/vehicles" >Browse Vehicles</a><button type="button" class="btn btn-danger-soft" data-confirm="Cancel this rental request?" data-rental-cancel>Cancel Rental</button><a class="btn btn-primary" href="${pageContext.request.contextPath}/customer/rentals/create?id=1" data-rental-book-again hidden>Book Again</a></div></section>
</main>
<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/messages.jsp" %>
</body></html>
