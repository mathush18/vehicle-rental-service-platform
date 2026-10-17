<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="uiRole" value="customer" scope="request"/>
<c:set var="pageTitle" value="Profile Settings" scope="request"/>
<c:set var="navKey" value="profile" scope="request"/>
<!DOCTYPE html>
<html lang="en"><head><%@ include file="../common/head.jsp" %></head>
<body class="drivehub role-customer" data-role="customer" data-context="${pageContext.request.contextPath}" data-page="profile">
<a class="skip-link" href="#main-content">Skip to main content</a>
<%@ include file="../common/sidebar.jsp" %>
<%@ include file="../common/navbar.jsp" %>
<main class="app-main page-content" id="main-content">
<%-- FRONTEND MOCK DATA: replace with backend model/JSTL later --%>
<header class="page-header"><div class="page-heading"><i class="bi bi-person-badge" aria-hidden="true"></i><div><h1>Profile Settings</h1><p>Manage your account information</p></div></div></header><form onsubmit="return false;" class="profile-layout" data-preview-form><section class="content-card profile-form"><h2>Profile Information</h2><div class="form-group"><label for="profile-name">Full Name <span class="required" aria-hidden="true">*</span></label><input class="form-control" id="profile-name" name="profile-name" type="text" value="Mathushalini.T" required autocomplete="name"></div><div class="form-group"><label for="profile-email">Email <span class="required" aria-hidden="true">*</span></label><input class="form-control" id="profile-email" name="profile-email" type="email" value="mathushalini@example.com" required autocomplete="email"></div><div class="form-group"><label for="profile-phone">Phone Number <span class="required" aria-hidden="true">*</span></label><input class="form-control" id="profile-phone" name="profile-phone" type="tel" value="+94 77 123 4567" required autocomplete="tel"></div><div class="form-group"><label for="profile-address">Address <span class="required" aria-hidden="true">*</span></label><input class="form-control" id="profile-address" name="profile-address" type="text" value="Colombo, Sri Lanka" required autocomplete="street-address"></div><div class="form-actions"><button type="submit" class="btn btn-primary"><i class="bi bi-save" aria-hidden="true"></i> Update Profile</button></div></section><aside><section class="profile-photo"><div class="avatar avatar-large" data-profile-photo><i class="bi bi-person-fill" aria-hidden="true"></i></div><div><label class="btn btn-secondary" for="profile-photo"><i class="bi bi-camera" aria-hidden="true"></i> Change Photo</label><input class="sr-only" type="file" id="profile-photo" accept="image/jpeg,image/png" data-profile-input><p class="small-text">JPG, PNG up to 2MB</p></div></section><section class="content-card account-card"><h2>Account Information</h2><dl class="info-list "><div><dt>Name</dt><dd>Mathushalini.T</dd></div><div><dt>Role</dt><dd>Customer</dd></div><div><dt>Member Since</dt><dd>Jan 10, 2026</dd></div><div><dt>Total Rentals</dt><dd>3</dd></div><div><dt>Total Spent</dt><dd>Rs. 48,500</dd></div></dl></section></aside></form>
</main>
<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/messages.jsp" %>
</body></html>
