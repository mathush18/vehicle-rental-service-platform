<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="uiRole" value="customer" scope="request"/>
<c:set var="pageTitle" value="My Reviews" scope="request"/>
<c:set var="navKey" value="reviews" scope="request"/>
<!DOCTYPE html>
<html lang="en"><head><%@ include file="../common/head.jsp" %></head>
<body class="drivehub role-customer" data-role="customer" data-context="${pageContext.request.contextPath}" data-page="reviews">
<a class="skip-link" href="#main-content">Skip to main content</a>
<%@ include file="../common/sidebar.jsp" %>
<%@ include file="../common/navbar.jsp" %>
<main class="app-main page-content" id="main-content">
<%-- FRONTEND MOCK DATA: replace with backend model/JSTL later --%>
<header class="page-header"><div class="page-heading"><i class="bi bi-chat-square-text-fill" aria-hidden="true"></i><div><h1>My Reviews</h1><p>Manage your vehicle reviews</p></div></div><a class="btn btn-primary" href="${pageContext.request.contextPath}/customer/reviews/add" ><i class="bi bi-plus-lg" aria-hidden="true"></i> Add Review</a></header><section class="review-list"><article class="content-card review-item"><div class="fleet-photo photo-1" role="img" aria-label="Toyota Corolla" ></div><div><h3>Toyota Corolla</h3><p class="small-text">Oct 10, 2026</p><span class="stars" aria-label="5 out of 5 stars"><i class="bi bi-star-fill" aria-hidden="true"></i><i class="bi bi-star-fill" aria-hidden="true"></i><i class="bi bi-star-fill" aria-hidden="true"></i><i class="bi bi-star-fill" aria-hidden="true"></i><i class="bi bi-star-fill" aria-hidden="true"></i></span><p>Great car! Very comfortable and fuel efficient. Perfect for city travel.</p></div><div class="card-actions"><a class="btn btn-secondary" href="${pageContext.request.contextPath}/customer/reviews/edit?id=1" >Edit</a><button type="button" class="btn btn-danger-soft" data-confirm="Delete your review for Toyota Corolla?">Delete</button></div></article><article class="content-card review-item"><div class="fleet-photo photo-3" role="img" aria-label="Yamaha FZ-S" ></div><div><h3>Yamaha FZ-S</h3><p class="small-text">Oct 5, 2026</p><span class="stars" aria-label="4 out of 5 stars"><i class="bi bi-star-fill" aria-hidden="true"></i><i class="bi bi-star-fill" aria-hidden="true"></i><i class="bi bi-star-fill" aria-hidden="true"></i><i class="bi bi-star-fill" aria-hidden="true"></i><i class="bi bi-star" aria-hidden="true"></i></span><p>Good bike for short trips. Smooth ride and well maintained.</p></div><div class="card-actions"><a class="btn btn-secondary" href="${pageContext.request.contextPath}/customer/reviews/edit?id=2" >Edit</a><button type="button" class="btn btn-danger-soft" data-confirm="Delete your review for Yamaha FZ-S?">Delete</button></div></article></section>
</main>
<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/messages.jsp" %>
</body></html>
