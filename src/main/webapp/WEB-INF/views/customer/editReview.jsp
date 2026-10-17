<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="uiRole" value="customer" scope="request"/>
<c:set var="pageTitle" value="Edit Review" scope="request"/>
<c:set var="navKey" value="reviews" scope="request"/>
<!DOCTYPE html>
<html lang="en"><head><%@ include file="../common/head.jsp" %></head>
<body class="drivehub role-customer" data-role="customer" data-context="${pageContext.request.contextPath}" data-page="editReview">
<a class="skip-link" href="#main-content">Skip to main content</a>
<%@ include file="../common/sidebar.jsp" %>
<%@ include file="../common/navbar.jsp" %>
<main class="app-main page-content" id="main-content">
<%-- FRONTEND MOCK DATA: replace with backend model/JSTL later --%>
<header class="page-header"><div class="page-heading"><i class="bi bi-star" aria-hidden="true"></i><div><h1>Edit Review</h1><p>Tell us about your experience with DriveHub.</p></div></div></header><form onsubmit="return false;" class="content-card narrow-form" data-preview-form data-review-form data-edit="true"><div class="form-group"><div class="form-group"><label for="review-vehicle">Vehicle <span class="required">*</span></label><select class="form-select" id="review-vehicle" name="review-vehicle" required><option value="1">Toyota Corolla</option><option value="2">Toyota Hiace</option><option value="3">Yamaha FZ-S</option><option value="4">Toyota RAV4</option><option value="5">Honda Civic</option><option value="6">Nissan NV350</option><option value="7">Honda CB150R</option><option value="8">Toyota Fortuner</option></select></div></div><fieldset class="rating-field"><legend>Your Rating <span class="required">*</span></legend><div class="star-input"><label><input type="radio" name="rating" value="1"  required aria-label="1 star"><span><i class="bi bi-star-fill" aria-hidden="true"></i></span></label><label><input type="radio" name="rating" value="2"  required aria-label="2 stars"><span><i class="bi bi-star-fill" aria-hidden="true"></i></span></label><label><input type="radio" name="rating" value="3"  required aria-label="3 stars"><span><i class="bi bi-star-fill" aria-hidden="true"></i></span></label><label><input type="radio" name="rating" value="4"  required aria-label="4 stars"><span><i class="bi bi-star-fill" aria-hidden="true"></i></span></label><label><input type="radio" name="rating" value="5" checked required aria-label="5 stars"><span><i class="bi bi-star-fill" aria-hidden="true"></i></span></label></div><p class="small-text" data-rating-label>5 out of 5</p></fieldset><div class="form-group"><label for="review-comment">Your Review <span class="required">*</span></label><textarea class="form-control" id="review-comment" name="comment" rows="5" required minlength="10" maxlength="1000" placeholder="What did you enjoy about your vehicle?">Great car! Very comfortable and fuel efficient. Perfect for city travel.</textarea><small class="small-text">10–1,000 characters</small></div><div class="form-actions"><a class="btn btn-muted" href="${pageContext.request.contextPath}/customer/reviews" >Cancel</a><button type="submit" class="btn btn-primary">Update Review</button></div></form>
</main>
<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/messages.jsp" %>
</body></html>
