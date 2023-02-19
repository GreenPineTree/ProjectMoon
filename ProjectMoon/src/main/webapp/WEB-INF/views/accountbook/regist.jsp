<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript">
<!-- 등록 함수 -->
	function login() {
		var frm = document.getElementById("loginfrm");

		frm.action = "<c:url value='/main/main.action'/>";
		frm.submit();

	}
</script>


<title>가계부 등록</title>
</head>
<body>
	<div>
		<form id="registfrm" name="registfrm" method="post">
			<!-- 구분및 은행 선택 -->
			<div id="division">
				<!-- 수익 비용 이체 구분 -->
				<span>거래</span>
				<select id="ab" name="ab">
					<option value="">선택
					<c:forEach var="list" items="${ab }">
						<option value="${list.mainCategory }">${list.properties }
					</c:forEach>
					<!-- 
					<option value="accountRevenue">수익
					<option value="accountCost">비용
					<option value="accountTransfer">이체
					 -->
				</select>

				<!-- 첫번째 선택 값에 따라 -->
				<c:choose>
					<c:when test="${ab == accountRevenue }">
					<!-- 구분의 값이 수익이라면 -->
						<p>수익</p>
						<select id="revenue">
							<option value="">선택
							<option value="revenueRoutine">정기수익
							<option value="revenueIrregular">비정기수익
						</select>
					</c:when>
					<c:when test="${ab == accountCost}">
					<!-- 구분의 값이 비용이라면 -->
						<p>비용</p>
						<select id="cost">
							<option value="">선택
							<option value="costRoutine">정기비용
							<option value="costIrregular">비정기비용
						</select>
					</c:when>
					<c:when test="${ab == accountTransfer}">
					<!-- 구분의 값이 이체라면 -->
						<p>이체 From</p>
						<select id="transfer">
							<option value="">선택
							<option value="01">농협증권
							<option value="02">국민은행
							<option value="03">우리은행
							<option value="04">카카오뱅크
						</select>
					</c:when>
					<c:otherwise>

					</c:otherwise>
				</c:choose>

				<!-- 두 번째 선택 값에 따라 -->
				<c:choose>
					<c:when test="${accountRevenue == revenueRoutine}">
					<!-- 정기수익이라면 -->
						<p>정기수익</p>
						<select id="routine">
							<option value="">선택
							<option value="01">이자
							<option value="02">배당
							<option value="03">사업
							<option value="04">근로
							<option value="05">연금
							<option value="06">기타
						</select>
					</c:when>
					<c:when test="${accountRevenue == revenueIrregular}">
					<!-- 비정기수익이라면 -->
						<p>비정기수익</p>
						<select id="irregular">
							<option value="">선택
							<option value="01">부모님
							<option value="02">세금
							<option value="03">주식처분
							<option value="04">기타
						</select>
					</c:when>
					<c:when test="${accountCost == costRoutine}">
					<!-- 정기비용이라면 -->
						<p>정기비용</p>
						<select id="routine">
							<option value="">선택
							<option value="01">보험
							<option value="02">주거
							<option value="03">교통
							<option value="04">통신
							<option value="05">이자
							<option value="06">식비
							<option value="07">데이트
							<option value="08">세금
							<option value="09">기타
						</select>
					</c:when>
					<c:when test="${accountCost == costIrregular}">
					<!-- 비정기비용이라면 -->
						<p>비정기비용</p>
						<select id="irregular">
							<option value="">선택
							<option value="01">유흥
							<option value="02">자기계발
							<option value="03">의료
							<option value="04">세금
							<option value="05">기타
						</select>
					</c:when>
					<c:when test="${transfer == transfer}">
					<!-- 구분의 값이 이체라면 -->
						<p>이체 To</p>
						<select id="transfer">
							<option value="">선택
							<option value="01">농협증권
							<option value="02">국민은행
							<option value="03">우리은행
							<option value="04">카카오뱅크
						</select>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
				
				<!-- 구분의 값이 수익 및 비용이라면 -->
				<c:choose>
					<c:when test="${accountRevenue == revenueRoutine}">
					<!-- 정기수익이라면 -->
						<p>거래된 은행</p>
						<select id="">
							<option value="">선택
							<option value="01">농협증권
							<option value="02">국민은행
							<option value="03">우리은행
							<option value="04">카카오뱅크
						</select>
					</c:when>
					<c:when test="${accountRevenue == revenueIrregular}">
					<!-- 비정기수익이라면 -->
						<p>거래된 은행</p>
						<select id="irregular">
							<option value="">선택
							<option value="01">농협증권
							<option value="02">국민은행
							<option value="03">우리은행
							<option value="04">카카오뱅크
						</select>
					</c:when>
					<c:when test="${accountCost == costRoutine}">
					<!-- 정기비용이라면 -->
						<p>거래된 은행</p>
						<select id="routine">
							<option value="">선택
							<option value="01">농협증권
							<option value="02">국민은행
							<option value="03">우리은행
							<option value="04">카카오뱅크
						</select>
					</c:when>
					<c:when test="${accountCost == costIrregular}">
					<!-- 비정기비용이라면 -->
						<p>거래된 은행</p>
						<select id="irregular">
							<option value="">선택
							<option value="01">농협증권
							<option value="02">국민은행
							<option value="03">우리은행
							<option value="04">카카오뱅크
						</select>
					</c:when>
				</c:choose>
			</div>
			<div id="datepicker">
				<p>날짜</p>
				<p>20230203</p>
			</div>
			<div id="account">
				<p>금액</p>
				<p>2,300,000</p>
			</div>
			<div id="division">
				<p>사용처</p>
				<p>점심식대</p>
			</div>
			<button id="add" name="add" onclick="regist();">추가</button>
			<button id="regist" name="regist" onclick="regist();">등록</button>
		</form>
	</div>

</body>
</html>