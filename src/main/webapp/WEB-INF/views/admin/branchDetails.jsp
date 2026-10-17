<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="uiRole" value="admin" scope="request"/>
<c:set var="pageTitle" value="Branch Details" scope="request"/>
<c:set var="navKey" value="branches" scope="request"/>
<!DOCTYPE html>
<html lang="en"><head><%@ include file="../common/head.jsp" %></head>
<body class="drivehub role-admin" data-role="admin" data-context="${pageContext.request.contextPath}" data-page="branchDetails">
<a class="skip-link" href="#main-content">Skip to main content</a>
<%@ include file="../common/sidebar.jsp" %>
<%@ include file="../common/navbar.jsp" %>
<main class="app-main page-content" id="main-content">
<%-- FRONTEND MOCK DATA: replace with backend model/JSTL later --%>
<a class="back-link" href="${pageContext.request.contextPath}/admin/branches"><i class="bi bi-arrow-left" aria-hidden="true"></i> Back to Branches</a><header class="page-header"><div class="page-heading"><i class="bi bi-buildings" aria-hidden="true"></i><div><h1>Branch Details</h1><p>Location and contact information</p></div></div></header><section class="content-card narrow-form" data-branch-details><div class="section-header"><h2 data-branch-name>Colombo Branch</h2><div data-branch-status><span class="badge badge-success" data-status-label>Active</span></div></div><dl class="info-list "><div><dt>City</dt><dd><span data-branch-city>Colombo</span></dd></div><div><dt>Address</dt><dd><span data-branch-address>123 Main Street, Colombo 03</span></dd></div><div><dt>Phone</dt><dd><span data-branch-phone>+94 11 234 5678</span></dd></div><div><dt>Opening Hours</dt><dd>Mon–Sat, 8:00 AM – 6:00 PM</dd></div><div><dt>Vehicle Count</dt><dd><span data-branch-count>16</span></dd></div></dl><div class="form-actions"><a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/vehicles?branch=Colombo%20Branch" data-branch-vehicles>View Vehicles</a><a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/branches/edit?id=1" data-branch-edit>Edit Branch</a><button type="button" class="btn btn-danger-soft" data-confirm="Delete this branch?">Delete Branch</button></div></section>
</main>
<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/messages.jsp" %>
</body></html>
