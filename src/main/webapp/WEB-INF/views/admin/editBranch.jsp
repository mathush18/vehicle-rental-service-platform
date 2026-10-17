<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="uiRole" value="admin" scope="request"/>
<c:set var="pageTitle" value="Edit Branch" scope="request"/>
<c:set var="navKey" value="branches" scope="request"/>
<!DOCTYPE html>
<html lang="en"><head><%@ include file="../common/head.jsp" %></head>
<body class="drivehub role-admin" data-role="admin" data-context="${pageContext.request.contextPath}" data-page="editBranch">
<a class="skip-link" href="#main-content">Skip to main content</a>
<%@ include file="../common/sidebar.jsp" %>
<%@ include file="../common/navbar.jsp" %>
<main class="app-main page-content" id="main-content">
<%-- FRONTEND MOCK DATA: replace with backend model/JSTL later --%>
<header class="page-header"><div class="page-heading"><i class="bi bi-buildings" aria-hidden="true"></i><div><h1>Edit Branch</h1><p>Enter the branch location and contact details.</p></div></div></header><form onsubmit="return false;" class="content-card narrow-form" data-preview-form data-branch-form data-edit="true"><div class="form-grid"><div class="form-group"><label for="branch-name">Branch Name <span class="required" aria-hidden="true">*</span></label><input class="form-control" id="branch-name" name="branch-name" type="text" value="Colombo Branch" required ></div><div class="form-group"><label for="branch-city">City <span class="required" aria-hidden="true">*</span></label><input class="form-control" id="branch-city" name="branch-city" type="text" value="Colombo" required ></div><div class="span-2"><div class="form-group"><label for="branch-address">Address <span class="required" aria-hidden="true">*</span></label><input class="form-control" id="branch-address" name="branch-address" type="text" value="123 Main Street, Colombo 03" required ></div></div><div class="form-group"><label for="branch-phone">Phone <span class="required" aria-hidden="true">*</span></label><input class="form-control" id="branch-phone" name="branch-phone" type="tel" value="+94 11 234 5678" required ></div><div class="form-group"><label for="branch-hours">Opening Hours <span class="required" aria-hidden="true">*</span></label><input class="form-control" id="branch-hours" name="branch-hours" type="text" value="Mon–Sat, 8:00 AM – 6:00 PM" required placeholder="e.g. Mon–Sat, 8:00 AM – 6:00 PM"></div><div class="form-group"><label for="branch-status">Status</label><select class="form-select" id="branch-status" name="branch-status" ><option>Active</option><option>Inactive</option></select></div></div><div class="form-actions"><a class="btn btn-muted" href="${pageContext.request.contextPath}/admin/branches" >Cancel</a><button class="btn btn-primary" type="submit"><i class="bi bi-save" aria-hidden="true"></i> Update Branch</button></div></form>
</main>
<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/messages.jsp" %>
</body></html>
