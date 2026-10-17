<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="uiRole" value="owner" scope="request"/>
<c:set var="pageTitle" value="Dashboard" scope="request"/>
<c:set var="navKey" value="dashboard" scope="request"/>
<!DOCTYPE html>
<html lang="en"><head><%@ include file="../common/head.jsp" %></head>
<body class="drivehub role-owner" data-role="owner" data-context="${pageContext.request.contextPath}" data-page="dashboard">
<a class="skip-link" href="#main-content">Skip to main content</a>
<%@ include file="../common/sidebar.jsp" %>
<%@ include file="../common/navbar.jsp" %>
<main class="app-main page-content" id="main-content">
<%-- FRONTEND MOCK DATA: replace with backend model/JSTL later --%>
<section class="dashboard-hero"><div><h1>Welcome Back, Mathushalini.T!</h1><p>Manage your vehicles, track rentals, and grow your business with DriveHub.</p></div><div class="hero-vehicle" aria-hidden="true"></div></section><section class="stats-grid" aria-label="Summary statistics"><article class="stat-card"><span class="stat-icon blue"><i class="bi bi-bag-check" aria-hidden="true"></i></span><div><h3>My Vehicles</h3><strong>8</strong><p>Total vehicles</p></div></article><article class="stat-card"><span class="stat-icon green"><i class="bi bi-bag-check" aria-hidden="true"></i></span><div><h3>Active Rentals</h3><strong>5</strong><p>Currently rented</p></div></article><article class="stat-card"><span class="stat-icon yellow"><i class="bi bi-bag-check" aria-hidden="true"></i></span><div><h3>Total Earnings</h3><strong>Rs. 245,000</strong><p>This month</p></div></article><article class="stat-card"><span class="stat-icon red"><i class="bi bi-bag-check" aria-hidden="true"></i></span><div><h3>Rental Requests</h3><strong>3</strong><p>Pending requests</p></div></article></section><section class="page-content"><div class="section-header"><h2>Recent Rental Requests</h2><a class="text-link" href="${pageContext.request.contextPath}/owner/rental-requests">View All <i class="bi bi-arrow-right" aria-hidden="true"></i></a></div><div class="table-wrapper"><table class="data-table" ><thead><tr><th scope="col">#</th><th scope="col">Vehicle</th><th scope="col">Customer</th><th scope="col">Start Date</th><th scope="col">End Date</th><th scope="col">Status</th><th scope="col">Action</th></tr></thead><tbody data-filter-items><tr data-filter-item data-status="Pending" data-month="October"><td>1</td><td>Toyota Corolla</td><td>Nimal Perera</td><td>Oct 15, 2026</td><td>Oct 18, 2026</td><td><span class="badge badge-warning" data-status-label>Pending</span></td><td><button type="button" class="btn btn-secondary" data-rental-details="1">View</button></td></tr>
<tr data-filter-item data-status="Approved" data-month="October"><td>2</td><td>Yamaha FZ-S</td><td>Sahan Wijesinghe</td><td>Oct 14, 2026</td><td>Oct 16, 2026</td><td><span class="badge badge-success" data-status-label>Approved</span></td><td><button type="button" class="btn btn-secondary" data-rental-details="2">View</button></td></tr>
<tr data-filter-item data-status="Completed" data-month="October"><td>3</td><td>Toyota Hiace</td><td>Dinuka Silva</td><td>Oct 12, 2026</td><td>Oct 15, 2026</td><td><span class="badge badge-info" data-status-label>Completed</span></td><td><button type="button" class="btn btn-secondary" data-rental-details="3">View</button></td></tr>
<tr data-filter-item data-status="Cancelled" data-month="October"><td>4</td><td>Toyota RAV4</td><td>Kavindu Perera</td><td>Oct 10, 2026</td><td>Oct 12, 2026</td><td><span class="badge badge-danger" data-status-label>Cancelled</span></td><td><button type="button" class="btn btn-secondary" data-rental-details="4">View</button></td></tr></tbody></table></div></section>
</main>
<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/messages.jsp" %>
</body></html>
