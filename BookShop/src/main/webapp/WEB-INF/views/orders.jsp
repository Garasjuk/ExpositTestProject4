<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Orders</title>

<link href="style.css" rel="stylesheet" type="text/css">

</head>
<body>
	<header> <jsp:include page="header.jsp" /> </header>

	<c:url var="orders" value="orders" />
	<form:form method="GET" action="${orders}" modelAttribute="listOrders">
		<center>

			<div id="main_content">
				<center>

					<div class="center_content_orders">

						<div class="center_title_bar_orders"><spring:message code="main.form.orders"/></div>
						<div class="center_title_bar_orders">
							<input type="radio" name="radioFilter" value="all" onchange="this.form.submit();"><spring:message code="main.form.all"/>
							<input type="radio" name="radioFilter" value="done" onchange="this.form.submit();"> <spring:message code="main.form.done"/>
							<input type="radio" name="radioFilter" value="notDone" onchange="this.form.submit();"><spring:message code="main.form.notdone"/>
							
						</div>
						<table border="0" width="100%" style="font-size: 14px;">
								<tr>
									<th>1</th>
									<th>2</th>
									<th>3</th>
									<th>4</th>
									<th>5</th>
									<th>6</th>
									<th>7</th>
									<th>8</th>
									<th>9</th>
									<th>10</th>
									
								</tr>
							<c:forEach items="${listOrders}" var="listOrders">								
								<tr bgcolor="#dcd9d9">
									<td width="3%" style="font-weight: bold;">
										<c:out value="${listOrders[0]}" />
									</td>
									<td width="10%" style="text-align: right;">
										<c:out value="${listOrders[1]}" />
									</td>
									<td width="13%" style="text-align: left;">
										<c:out value="${listOrders[2]}" />
									</td>
									<td width="13%">
										<c:out value="${listOrders[3]}" />
									</td>
									<td width="10%">
										<c:out value="${listOrders[4]}" />
									</td>
									<td width="3%">
										<c:out value="${listOrders[7]}" />
									</td>
									<td width="20%" style="text-align: left;">
										<c:out	value="${listOrders[8]}" />
									</td>
									<td width="10%" style="text-align: left;">
										<c:out	value="${listOrders[9]}" />
									</td>
										<td width="9%" style="text-align: left;">
										<c:out	value="${listOrders[11]}" />
									</td>
									
									<td width="9%" style="text-align: left;">
										
										<select name="selectStatus" required onchange="location.href = '<c:url value="orders"><c:param name="selectIdOrder" value="${listOrders[0]}"/><c:param name="selectStatus" value=""/></c:url>' + this.options[this.selectedIndex].value" >
											<option value="${listOrders[10]}">${listOrders[10]}</option>
											<option value="adopted" >adopted</option>
											<option value="ordered" >ordered</option>
											<option value="delivered" >delivered</option>
										</select>
									</td>
								</tr>
							</c:forEach>							
						</table>
					</div>
				</center>
			</div>

			<c:if test="${not empty madeOrder}">
				<div class="center_content">
					<div class="prod_box_big">
						<div class="top_prod_box_big"></div>
						<div class="center_prod_box_big">
							<c:forEach items="${madeOrder}" var="madeOrder">
								<table border="0" width="100%">
									<tr>
										<td width="30%" align="right">
											<div class="product_title"><spring:message code="main.form.name"/> :</div>
										</td>
										<td width="70%" align="left"><c:out
												value="${madeOrder.name_book}" /></td>
									</tr>
									<tr>
										<td width="30%" align="right">
											<div class="product_title"><spring:message code="main.form.count"/> :</div>
										</td>
										<td width="70%" align="left"><input type="text"
											name="order_count_cart" required
											value="${madeOrder.count_cart}" size="1px"></td>
									</tr>




									<tr>
										<td align="right">
											<div class="product_title"><spring:message code="main.form.adres"/> :</div>
										</td>
										<td align="left"><textarea name="order_adres_user"
												required>${adresUser}</textarea></td>
									</tr>
									<tr>
										<td align="right">
											<div class="product_title"><spring:message code="main.form.other"/> :</div>
										</td>
										<td align="left"><textarea name="order_other" required></textarea>
										</td>
									</tr>
									<tr>
										<td></td>
										<td align="left"><input type="submit" name="addOrder"
											value="Add Order"></td>
									</tr>
								</table>
							</c:forEach>
						</div>
					</div>
				</div>
			</c:if>
	</form:form>

</body>
</html>