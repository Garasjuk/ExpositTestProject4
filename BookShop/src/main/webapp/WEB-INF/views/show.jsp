<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show details</title>


<link href="style.css" rel="stylesheet" type="text/css">

</head>
<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>
	<center>
	
	</center>
	<c:url var="showDetail" value="showDetail" />
	<form:form method="GET" action="${showDetail}" modelAttribute="showDetail">
		<center>
			
			<div class="center_content">
				
				<div class="prod_box_big">
					<div class="top_prod_box_big"></div>
					<div class="center_prod_box_big">
						<div class="product_img_big">
							<a href="javascript:popImage('images/big_book.gif','Some Title')"
								title="header=[Zoom] body=[&nbsp;] fade=[on]"><img
								src="images/book.png" alt="" border="0" /></a>
							
						</div>
						<div class="details_big_box">
						
						<c:forEach items="${showDetailBook}" var="showDetailBook">
						
							<c:if test="${roleUser == 1}">	
								<table>	
									<tr>
										<td>	
											<div class="product_title_big"><spring:message code="main.form.name"/>: </div>
										</td>
										<td>										
											<input type="text" name="edit_name_book" value="${showDetailBook[1]}" required  onkeyup="return  validatorUserName(this)" >																				
											<input type="hidden" name="selectDetail" value="${showDetailBook[0]}">				
										</td>
									</tr>
									
									<div class="specifications">
									<tr>
										<td>			
											<spring:message code="main.form.price"/>: 
										</td>
										<td>	
											<input type="text" name="edit_price_book" value="${showDetailBook[3]}" required  >
										</td>
									</tr>
									<tr>
										<td>	
											<spring:message code="main.form.count"/>: 
										</td>
										<td>
											<input type="text" name="edit_count_book" value="${showDetailBook[2]}" required  >
										</td>
									</tr>	
									<tr>
										<td>
											<spring:message code="main.form.author"/>: 
										</td>
										<td>	
											<select name="edit_author_book" required>
												<option value="${showDetailBook[11]}">${showDetailBook[8]}</option>
													<c:forEach items="${author}" var="author">												
													   	<option value ="${author.id_author}">${author.name_author}</option>
												</c:forEach>
											</select> 	
										</td>
									</tr>		
									<tr>			
										<td>		
											<spring:message code="main.form.genre"/>:
										</td>
										<td>	 
											<select name="edit_genre_book" required>
												<option value="${showDetailBook[13]}">${showDetailBook[10]}</option>
													<c:forEach items="${genre}" var="genre">												
													   	<option value ="${genre.id_genre}">${genre.name_genre}</option>
													</c:forEach>
											</select> 
										</td>
									</tr>			
									<tr>	
										<td>
											<spring:message code="main.form.publishing"/>: 
										</td>
										<td>	
											<select name="edit_publishing_book" required>
												<option value="${showDetailBook[12]}">${showDetailBook[9]}</option>
													<c:forEach items="${publishing}" var="publishing">												
													   	<option value ="${publishing.id_publishing}">${publishing.name_publishing}</option>
												</c:forEach>
											</select>
										</td>
									</tr>		 
									<tr>
										<td colspan="2">
											<input type="submit" name="editBook" value="Edit Book">
										</td>
									</tr>										
									</div>
											
								</table>
							</c:if>
							
							<c:if test="${roleUser != 1}">	
								
								<div class="product_title_big">
									<c:out value="${showDetailBook[1]}" />
									<input type="hidden" name="selectDetail" value="${showDetailBook[0]}">				
								</div>
								
								<div class="specifications">
									<spring:message code="main.form.price"/>: <span class="blue"><c:out value="${showDetailBook[3]}"/></span><br />
									<spring:message code="main.form.count"/>: <span class="blue"><c:out value="${showDetailBook[2]}" /></span><br /> 
									<spring:message code="main.form.author"/>: <span class="blue"><c:out value="${showDetailBook[8]}"/></span><br />
									<spring:message code="main.form.genre"/>: <span class="blue"><c:out value="${showDetailBook[10]}"/></span><br />
									<spring:message code="main.form.publishing"/>: <span class="blue"><c:out value="${showDetailBook[9]}"/></span><br /> 
									
									<c:if test="${not empty nameUser}">
										<a href=" <c:url value="addLike"><c:param name="selectDetail" value="${showDetailBook[0]}"/></c:url>"> <img src="images/like.gif" alt=""
												border="0" /><spring:message code="main.form.like"/>:  </a><c:out value="${countLike}"/>
									</c:if>
									<c:if test="${empty nameUser}">
										<spring:message code="main.form.like"/>: <span class="blue"><c:out value="${countLike}"/></span>
									</c:if>								
									<br />
								</div>
								<a href="<c:url value="addToCart"><c:param name="selectDetail" value="${showDetailBook[0]}"/></c:url> " class="addtocart"><spring:message code="main.form.addcart"/></a> 
								 
								
							</c:if>					
						</c:forEach>
						</div>
						
					</div>
					<div class="bottom_prod_box_big"></div>
				</div>
			</div>
				<div id="main_content">

					<div class="center_content">
						<div class="center_title_bar"><spring:message code="main.form.comments"/></div>
						<div class="prod_box_big">
							<div class="top_prod_box_big"></div>
							<div class="center_prod_box_big">
								<div class="details_big_box_comment">
									
									<c:forEach items="${coments}" var="coments">
										<div class="product_title_big_comment">
											<c:out value="${coments[5]}" />
										</div>
										
										<div class="specifications_comment">
											<span class="comment_blue"><c:out value="${coments[3]}"/></span><br />
											<span class="comment_black"><c:out value="${coments[4]}" /></span><br /> 

										</div>
									</c:forEach>									
									<c:if test="${not empty nameUser}">
										<c:if test="${roleUser != 1}">	
											<div class="product_title"><spring:message code="main.form.comment"/> :
												<textarea name="add_coment_book" required ></textarea>
											</div>
											
											<input type="submit" name="addComent" value="Add comment">
										</c:if>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
		</center>
		</div>
	</form:form>

</body>
</html>