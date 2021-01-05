<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ontact, 서로 연결되는 온라인 공간</title>
    <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <style>
    *{
        margin : 0;
    }
    body{
        width : 100%;
        height: 100%;
        position: relative;
    }
    .header{
        position: relative;
        width: 100%;
        height: 60px;
    }
    .header div{
        width: 1200px;
        height: 60px;
        margin: 0 auto;
    }
    /* 본문 */
    .main{
        position: relative;
        width: 1200px;
        height: 100%;
        margin: 0 auto;
    }
    /* 사이드메뉴 */
    .sidenav{
        position: relative;
        width: 210px;
        height: 100%;
        float: left;
    }
    .sidenav ul,
    .sidenav ul li a {
        display: block;
        color: black;
    }
    .sidenav ul li{
        display: block;
        font-size: 16px;
    }
    .sidenav ul ul {
    display: none;
    }
    .sidenav > ul > li > a {
    padding: 19px 20px;
    z-index: 2;  
    cursor: pointer;
    font-weight: 700;
    text-decoration: none;
    }
    .sidenav ul ul li{
        background-color: #e7e7e7;
    }
    .sidenav ul ul li a {
    cursor: pointer;
    padding: 10px 0;
    padding-left: 30px;
    z-index: 1;
    text-decoration: none;
    font-size: 13px;
    }
    /* 콘텐츠 */
    .contents{
        position: absolute;
        width: 970px;
        height: 1000px;
        left: 210px;
        padding : 40px 0 40px 40px;
        border-left: 1px solid #e7e7e7;
        box-sizing: border-box;
    }
    .conTitle{
        width: 930px;
        height: 40px;
        line-height: 40px;
        padding-bottom: 20px;
        font-size: 32px;
        border-bottom: 1px solid #e7e7e7;
    }
    .application{
        width: 930px;
        height: 210px;
        padding : 20px 0;
        margin-bottom: 80px;
    }
    .application table{
        width: 930px;
        height: 210px;
        font-size: 14px;
    }
    .application table tr{
        height: 30px;
        line-height: 30px;
    }
    .application table tr:nth-child(3){
        height: 70px;
        line-height: 70px;
    }
    .application table tr:nth-child(4){
        height: 70px;
        line-height: 70px;
        text-align: center;
        border-top: 1px solid #e7e7e7;
    }
    .title{
        width: 100px;
        font-weight: 700;
    }
    .application select{
        border: 1px solid #c0c0c0;
        box-sizing: border-box;
    }
    .application input{
        border: 1px solid #c0c0c0;
        box-sizing: border-box;
    }
    .application table button{
        width: 100px;
        height: 32px;
        background-color: #5A3673;
        color:#F2F2F2;
        border : none;
        border-radius: 3px;
    }
    .option{
        width: 930px;
        height: 50px;
        padding: 20px 0;
        border-top: 1px solid #e7e7e7;
        border-bottom: 1px solid #e7e7e7;
    }
    .option table{
        width: 700px;
        height: 50px;
    }
    .option table td{
        height: 50px;
        line-height: 50px;
    }
    .option table td:nth-child(1){
        width: 100px;
    }
    .option table td:nth-child(2){
        width: 400px;
    }
    .searchgraph{
        width: 930px;
        height: 200px;
        padding: 30px 0;
    }
    .option table #insertDf{
        width: 100px;
        height: 32px;
        background-color: #5A3673;
        color:#F2F2F2;
        border : none;
        border-radius: 3px;
    }
    .lista{
        padding-top: 30px;
        width: 930px;
        height: 360px;
    }
    .lista table{
        width: 930px;
        height: 360px;
        font-size: 14px;
        text-align: center;
    }
    .lista table tr{
        height: 30px;
        line-height: 30px;
        border-bottom: 1px solid #e7e7e7;
    }
    .lista table thead{
        font-weight: 700;
    }
    </style>
     <script>
     	/* var result='${message}';
		console.log(result);
		if(result == "success") {
	        alert("신청이 완료되었습니다");
	    } */
		
	    $('#insertDf').on('click', function(){
            console.log("들어왔다!!")
            $("#frm").action = "${pageContext.request.contextPath}/dayoff/dayoffins";
        	$("#frm").method = "post";
        	$("#frm").submit();
        });
		
        // html dom 이 다 로딩된 후 실행된다.
   $(document).ready(function() {
        $('.sidenav li.menu>a').on('click', function(){
		$(this).removeAttr('href');
		var element = $(this).parent('li');
		if (element.hasClass('open')) {
			element.removeClass('open');
			element.find('li').removeClass('open');
            element.find('ul').slideUp();
		}
		else {
			element.addClass('open');
			element.children('ul').slideDown();
			element.siblings('li').children('ul').slideUp();
			element.siblings('li').removeClass('open');
			element.siblings('li').find('li').removeClass('open');
            element.siblings('li').find('ul').slideUp();
		}
        });
        
        
       	/* var responseMessage = "<c:out value="${message}" />"; */
       		/* $("#insertDf").on("click", function(){
       			
       		}); */
       		
    //    $('#insertDf').on('click', function(){
    //    		if(fnMemberValidation() == false) {
    //                return;
    //                console.log("false로 들어옴");
    //          }else if(nMemberValidation() == true){
    //             console.log("true로 들어옴");
    //    			confirm("제출하시겠습니까?");
    //    			alert("제출 완료");
    //     	   var frm = document.frm;
    //     	   frm.action = "<c:url value='/dayoff/dayoffins'/>";
    //     	   frm.method = "post";
    //     	   frm.submit();
    //     	}else{
    //     	   return;
    //     	}
    //    	});
       		
        	 
    //     function fnMemberValidation(){
    //     	 if($('#dname option:selected').val() == '' || $('#dname option:selected').val() == 0){
    //     	   alert("부서를 선택해주세요");
    //     	   $('#name').focus();
    //     	   return false;
    //     	 }
    //     	 if($.trim($('#uname').val()) == ''){
    //     	   alert("이름을 입력해주세요");
    //     	   $('#uname').focus();
    //     	   return false;
    //     	  }
    //     	 if($.trim($('#dayoffStart').val()) == ''){
    //        	   alert("휴가 시작일을 선택해주세요.");
    //        	   $('#dayoffStart').focus();
    //        	   return false;
    //        	  }
    //     	 if($.trim($('#dayoffEnd').val()) == ''){
    //           	alert("휴가 종료일을 선택해주세요.");
    //           	$('#dayoffEnd').focus();
    //           	return false;
    //           }
    //     	 if($.trim($('#offdays').val()) == ''){
    //             alert("일수를 입력해주세요.");
    //             $('#offdays').focus();
    //             return false;
    //            }
    //     	 if($.trim($('#offreason').val()) == ''){
    //        	   alert("휴가사유를 입력해주세요");
    //        	   $('#offreason').focus();
    //        	   return false;
    //        	  }
        	  
    //     	  return true;
    //     	 };
   }); 
    	
    </script>
</head>
<body>
    <div class="header">
        <div>헤더 들어갈 자리</div>
    </div>
    <div class="main">
        <div class="sidenav">
            <ul>
                <li class="menu"><a href="">근태 관리</a>
					<ul class="hide">
						<li><a href="${pageContext.request.contextPath}/commute/dailylist">출퇴근 관리</a></li>
						<li><a href="">월 근무내역</a></li>
						<li><a href="${pageContext.request.contextPath}/overwork/owlist">시간외 근무신청</a></li>
					</ul></li>
				<li class="menu"><a href="">휴가 관리</a>
					<ul class="hide">
						<li><a href="${pageContext.request.contextPath}/dayoff/dflist">휴가 신청</a></li>
						<li><a href="">휴가 현황</a></li>
					</ul></li>
				<li><a href="">조직도</a></li>
            </ul>
        </div>
    <div class="contents">
        <div class="article">
            <div class="conTitle">휴가 신청 및 조회</div>
            <div class="application">
            <form name="frm" id ="frm" >
           <%--  action = "${pageContext.request.contextPath}/dayoff/dayoffins" method = "post"> --%>
           
                <table>
                    <tr>
                        <td class="title">부서명</td>
                        <td style="width: 230px;">
                            <select style="width: 200px; height: 25px;" id="dname" name="dname">
                                <option value="0">선택하세요</option>
                                <option value="경영팀">경영팀</option>
                                <option value="인사팀">인사팀</option>
                                <option value="개발팀">개발팀</option>
                                <option value="영업팀">영업팀</option>
                                <option value="디자인팀">디자인팀</option>
                                <option value="마케팅팀">마케팅팀</option>
                            </select>
                        </td>
                        <td class="title">성명</td>
                        <td style="width: 230px;"><input type="text" style="width: 200px; height: 25px;" id="uname" name="uname"></td>
                        <td></td>
                        <td></td>
                    </tr> 
                    <tr>
                        <td class="title">휴가 시작 일자</td>
                        <td style="width: 230px;"><input type="text" style="width: 200px; height: 25px;" id="dayoffStart" name="offstart" placeholder="시작일을 선택해주세요"></td>
                        <td class="title">휴가 종료 일자</td>
                        <td style="width: 230px;"><input type="text" style="width: 200px; height: 25px;" id="dayoffEnd" name="offend" placeholder="종료일을 선택해주세요"></td>
                        <td class="title" style="width: 50px;">일수</td>
                        <td><input type="text" style="width: 50px; height: 25px;" id="offdays" name="offdays"></td>
                   
                    </tr>
                    <tr>
                        <td class="title">휴가사유</td>
                        <td colspan="6" style="padding-bottom: 20px;"><input type="text" style="width: 830px; height: 65px;" id="offreason" name="offreason"></td>
             
                    </tr>
                    <tr>
                        <td colspan="6"><button onclick="go()" id="insertDf" name="insertDf" >신청하기</button></td>
                    <!-- type="submit" -->
                    </tr>
                    </table>
                    </form>
            </div>
            <div class="option">
            <form name="frm">
                <table>
                    <tr>
                        <td>기간 선택</td>
                        <td><input type="text" id="startDate" name="startdate"> &nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp; <input type="text" id="endDate" name="enddate"></td>
                        <td><button type="submit" value="">조회</button></td>
                    </tr>
                </table>
            </form>
            </div>
            <div class="lista">
                <table>
                    <thead>
                    <tr>
                        <td colspan="8" style="text-align: left;">조회결과 00건</td>
                    </tr>
                    <tr>
                        <th>부서명</th>
                        <th>성명</th>
                        <th>휴가시작일자</th>
                        <th>휴가종료일자</th>
                        <th>휴가일수</th>
                        <th>사유</th>
                        <th>신청일</th>
                        <th>상태</th>
                    </tr>
                    </thead>
                    <c:if test="${listCount eq 0}">
						<tr>
							<td colspan="7" align="center"><br>
							<br> 신청내역이 없습니다.<br>
							<br></td>
						</tr>
					</c:if>
					<c:if test="${listCount ne 0}">
						<c:forEach var="df" items="${list}" varStatus="status">
                    <tr>
                        <td>${df.dname}</td>
                        <td>${df.uname}</td>
                        <td>${df.offstart}</td>
                        <td>${df.offend}</td>
                        <td>${df.offdays}</td>
                        <td>${df.offreason}</td>
                        <td>${df.offtime}</td>
                        <td>${df.offapproval}</td>
                    </tr>
                    </c:forEach>
                    </c:if>
                   <!-- 앞 페이지 번호 처리 -->
					<tr>
						<td colspan="8">
						<c:if test="${currentPage <= 1}">
						&lt; &nbsp;
						</c:if>
						 	<c:if test="${currentPage > 1}">
								<c:url var="dflistprev" value="/dayoff/dflist">
									<c:param name="page" value="${currentPage-1}" />
								</c:url>
								<a href="${dflistprev}">&lt; &nbsp; &nbsp; &nbsp; </a>
							</c:if> 
							<!-- 끝 페이지 번호 처리 -->
							 <c:set var="endPage" value="${maxPage}" /> 
							 <c:forEach
								var="p" begin="${startPage+1}" end="${endPage}">
								<!-- eq : == / ne : != -->
								<c:if test="${p eq currentPage}">
									<font color="red" size="4"><b>${p} &nbsp; &nbsp; &nbsp;</b></font>
								</c:if>
								<c:if test="${p ne currentPage}">
									<c:url var="dflistchk" value="/dayoff/dflist">
										<c:param name="page" value="${p}" />
									</c:url>
									<a href="${dflistchk}">${p} &nbsp; &nbsp; &nbsp;</a>
								</c:if>
							</c:forEach> 
							<c:if test="${currentPage >= maxPage}"> &nbsp; &gt;
							</c:if>
							<c:if test="${currentPage < maxPage}">
								<c:url var="dflistnext" value="/dayoff/dflist">
									<c:param name="page" value="${currentPage+1}" />
								</c:url>
								<a href="${dflistnext}">&nbsp; &gt;</a>
							</c:if>
							</td>
					</tr>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    $(function() {
            //input을 datepicker로 선언
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                // ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                // ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                // ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                // ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "-48M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+12M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
            });
            $('#dayoffStart').datepicker();  
            $('#dayoffEnd').datepicker();                     
            $('#startDate').datepicker(); 
            $('#endDate').datepicker(); 
            /* //초기값을 오늘 날짜로 설정
            $('#dayoffStart').datepicker();
            $('#dayoffEnd').datepicker();
            $('#startDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)  
            $('#endDate').datepicker('setDate', 'today');           */
        });  
    	
     
</script>
</body>
</html>