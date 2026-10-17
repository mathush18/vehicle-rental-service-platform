<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="uiRole" value="owner" scope="request"/>
<c:set var="pageTitle" value="Vehicle Details" scope="request"/>
<c:set var="navKey" value="vehicles" scope="request"/>
<!DOCTYPE html>
<html lang="en"><head><%@ include file="../common/head.jsp" %></head>
<body class="drivehub role-owner" data-role="owner" data-context="${pageContext.request.contextPath}" data-page="vehicleDetails">
<a class="skip-link" href="#main-content">Skip to main content</a>
<%@ include file="../common/sidebar.jsp" %>
<%@ include file="../common/navbar.jsp" %>
<main class="app-main page-content" id="main-content">
<%-- FRONTEND MOCK DATA: replace with backend model/JSTL later --%>
<a class="back-link" href="${pageContext.request.contextPath}/owner/vehicles"><i class="bi bi-arrow-left" aria-hidden="true"></i> Back to Vehicles</a><section class="content-card vehicle-detail" data-vehicle-details><div class="vehicle-detail-top"><div class="gallery"><div data-main-photo><div class="fleet-photo photo-1" role="img" aria-label="Toyota Corolla" ></div></div><div class="thumbnails"><button type="button" class="btn thumbnail selected" data-thumbnail="1" aria-label="Full vehicle view" aria-pressed="true"><div class="fleet-photo photo-1" role="img" aria-label="Toyota Corolla" data-gallery-photo="1"></div></button><button type="button" class="btn thumbnail " data-thumbnail="2" aria-label="Closer vehicle view" aria-pressed="false"><div class="fleet-photo photo-1" role="img" aria-label="Toyota Corolla" data-gallery-photo="2"></div></button><button type="button" class="btn thumbnail " data-thumbnail="3" aria-label="Front detail" aria-pressed="false"><div class="fleet-photo photo-1" role="img" aria-label="Toyota Corolla" data-gallery-photo="3"></div></button><button type="button" class="btn thumbnail " data-thumbnail="4" aria-label="Wheel detail" aria-pressed="false"><div class="fleet-photo photo-1" role="img" aria-label="Toyota Corolla" data-gallery-photo="4"></div></button></div></div><div class="vehicle-summary"><div class="section-header"><h1 data-vehicle-name>Toyota Corolla</h1><span class="badge badge-success" data-status-label>Available</span></div><p data-vehicle-type>Car</p><p class="price-large"><strong>Rs. <span data-vehicle-price>8,000</span></strong> / day</p><p class="small-text"><i class="bi bi-geo-alt" aria-hidden="true"></i> <span data-vehicle-branch>Colombo Branch</span></p><dl class="info-list shaded"><div><dt>Brand</dt><dd><span data-vehicle-brand>Toyota</span></dd></div><div><dt>Model</dt><dd><span data-vehicle-model>Corolla</span></dd></div><div><dt>Type</dt><dd><span data-vehicle-type>Car</span></dd></div><div><dt>Availability</dt><dd><span data-vehicle-status>Available</span></dd></div><div><dt>Branch</dt><dd><span data-vehicle-branch>Colombo Branch</span></dd></div></dl><h3>Description</h3><p data-vehicle-description>The Toyota Corolla offers a comfortable and smooth driving experience. Perfect for city travel and long trips with excellent fuel efficiency.</p><div class="form-actions"><a class="btn btn-primary" href="${pageContext.request.contextPath}/owner/vehicles/edit?id=1" data-edit-vehicle-link><i class="bi bi-pencil" aria-hidden="true"></i> Edit Vehicle</a><button type="button" class="btn btn-danger" data-confirm="Delete this vehicle?">Delete Vehicle</button></div></div></div></section>
</main>
<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/messages.jsp" %>
</body></html>
