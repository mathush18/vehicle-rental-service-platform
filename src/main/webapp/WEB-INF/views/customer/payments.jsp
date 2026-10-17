<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="uiRole" value="customer" scope="request"/>
<c:set var="pageTitle" value="Payments" scope="request"/>
<c:set var="navKey" value="payments" scope="request"/>
<!DOCTYPE html>
<html lang="en"><head><%@ include file="../common/head.jsp" %></head>
<body class="drivehub role-customer" data-role="customer" data-context="${pageContext.request.contextPath}" data-page="payments">
<a class="skip-link" href="#main-content">Skip to main content</a>
<%@ include file="../common/sidebar.jsp" %>
<%@ include file="../common/navbar.jsp" %>
<main class="app-main page-content" id="main-content">
<%-- FRONTEND MOCK DATA: replace with backend model/JSTL later --%>
<header class="page-header"><div class="page-heading"><i class="bi bi-credit-card-fill" aria-hidden="true"></i><div><h1>Payments</h1><p>View your payment history and details</p></div></div></header><section class="content-card" data-filter-scope data-page-size="5"><div class="table-wrapper"><table class="data-table" ><thead><tr><th scope="col">#</th><th scope="col">Date</th><th scope="col">Rental ID</th><th scope="col">Vehicle</th><th scope="col">Amount</th><th scope="col">Status</th><th scope="col">Actions</th></tr></thead><tbody data-filter-items><tr data-filter-item data-status="Paid" data-method="Card" data-month="October"><td>1</td><td>Oct 10, 2026</td><td>DRH-20261010-001</td><td>Toyota Corolla</td><td>Rs. 24,000</td><td><span class="badge badge-success" data-status-label>Paid</span></td><td><button type="button" class="btn btn-secondary" data-payment-details="1">View</button></td></tr>
<tr data-filter-item data-status="Paid" data-method="Bank Transfer" data-month="October"><td>2</td><td>Oct 8, 2026</td><td>DRH-20261010-002</td><td>Yamaha FZ-S</td><td>Rs. 7,000</td><td><span class="badge badge-success" data-status-label>Paid</span></td><td><button type="button" class="btn btn-secondary" data-payment-details="2">View</button></td></tr>
<tr data-filter-item data-status="Refunded" data-method="eWallet" data-month="October"><td>3</td><td>Oct 5, 2026</td><td>DRH-20261010-003</td><td>Toyota Hiace</td><td>Rs. 36,000</td><td><span class="badge badge-info" data-status-label>Refunded</span></td><td><button type="button" class="btn btn-secondary" data-payment-details="3">View</button></td></tr>
<tr data-filter-item data-status="Pending" data-method="Card" data-month="September"><td>4</td><td>Sep 20, 2026</td><td>DRH-20261010-004</td><td>Toyota RAV4</td><td>Rs. 30,000</td><td><span class="badge badge-warning" data-status-label>Pending</span></td><td><button type="button" class="btn btn-secondary" data-payment-details="4">View</button></td></tr>
<tr data-filter-item data-status="Failed" data-method="eWallet" data-month="September"><td>5</td><td>Sep 10, 2026</td><td>DRH-20261010-005</td><td>Honda Civic</td><td>Rs. 18,000</td><td><span class="badge badge-danger" data-status-label>Failed</span></td><td><button type="button" class="btn btn-secondary" data-payment-details="5">View</button></td></tr></tbody></table></div><div class="empty-state" data-filter-empty hidden><i class="bi bi-search" aria-hidden="true"></i><h3>No results found</h3><p>Try a different search or reset your filters.</p><button type="button" class="btn btn-secondary" data-reset-filters>Reset Filters</button></div></section>
</main>
<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/messages.jsp" %>
</body></html>
