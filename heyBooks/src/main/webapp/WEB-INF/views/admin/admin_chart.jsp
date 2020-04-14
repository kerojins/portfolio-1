<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container admin_chart">
	<div class="chart_box">
		<div class="chart_val" style="display: none">
			<ul>
				<c:forEach var="list" items="${month_sale_list}">
					<li>${list.sale}</li> 
				</c:forEach>
			</ul>
		</div>
		<div class="left">
			<div id="grafico">
				<div class="riga" style="top: 25%">
					<div>7500,000원</div>
				</div>
				<div class="riga" style="top: 50%">
					<div>5000,000원</div>
				</div> 
				<div class="riga" style="top: 75%">
					<div>2500,000원</div> 
				</div>
				<c:forEach var="list" items="${month_sale_list}" varStatus="status">
					<div id="col${status.index}" style="left:${100-(status.index+1)*25}%; background-color: #336699;" class="column">
						<div class="sale_val">${list.sale}원</div>
						<span>${list.month}월</span>
					</div> 
				</c:forEach>
				
			</div>
		</div>
	</div>
</div> 
<script type="text/javascript">
	$(document).ready(function(){
		viewGraph();
	});
</script>