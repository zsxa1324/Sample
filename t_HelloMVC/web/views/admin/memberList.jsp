<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
    
<%@ include file="/views/common/header.jsp" %>
<%
	List<Member> list=(List)request.getAttribute("list");
%>    
<style>
	section#memberList-container{text-align:center;}
	section#memberList-container table#tbl-member{
		width:100%;
		border:1px solid gray;
		border-collapse:collapse;
	}
	section#memberList-container table#tbl-member th, 
	table#tbl-member td{
		border:1px solid gray; padding:10px;
	}
	td a{
		text-decoration:none;
		color:black;
	}
	div#search-container{margin:0 0 10px 0; 
		padding:3px; 
		background-color:rgba(0,188,212,0.3);
	}
	div#search-userName{display:none;}
	div#search-gender{display:none;}
	div#search-userId{display:inline-block;}
	
	
</style>
<script>
	$(function(){
		var sid=$('#search-userId');
		var sname=$('#search-userName');
		var sgender=$('#search-gender');
		
		var searchType=$('#searchType');
		searchType.on('change',function(){
			sid.css("display","none");
			sname.css("display","none");
			sgender.css("display","none");
			
			$('#search-'+$(this).val()).css("display",'inline-block');
		});		
	});


</script>

<section id="memberList-container">
	<h2>회원관리</h2>
	<div id="search-container">
			검색타입 : 
			<select id="searchType">
				<option value="userId">아이디</option>
				<option value="userName">회원명</option>
				<option value="gender">성별</option>	
			</select>	
		<div id="search-userId">
			<form action="<%=request.getContextPath()%>/admin/memberFinder">
				<input type="hidden" name="searchType" value="userId"/>
				<input type="text" name="searchKeyword" size='25' 
				placeholder="검색할 아이디를 입력하세요"/>
				<button type='submit'>검색</button>
			</form>
		</div>
		<div id="search-userName">
			<form action="<%=request.getContextPath()%>/admin/memberFinder">
				<input type="hidden" name="searchType" value="userName"/>
				<input type="text" name="searchKeyword" size='25' 
				placeholder="검색할 회원명를 입력하세요"/>
				<button type='submit'>검색</button>
			</form>
		</div>
		<div id="search-gender">
			<form action="<%=request.getContextPath()%>/admin/memberFinder">
				<input type="hidden" name="searchType" value="gender"/>
				<input type="radio" name="searchKeyword" value="M" checked>남
				<input type="radio" name="searchKeyword" value="F">여
				<button type='submit'>검색</button>
			</form>
		</div>	
	</div>
	
	<table id="tbl-member">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>나이</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>취미</th>
			<th>가입일</th>
		</tr>
		<%if(!list.isEmpty()) {
			for(Member m : list)
			{ %>
			<tr>
				<td><a href="<%=request.getContextPath()%>
				/updateMember?userId=<%=m.getUserId() %>">
				<%=m.getUserId() %></a></td>
				<td><%=m.getUserName() %></td>
				<td><%="M".equals(m.getGender())?"남":"여" %>
				<td><%=m.getAge() %></td>
				<td><%=m.getEmail() %></td>
				<td><%=m.getPhone() %></td>
				<td><%=m.getAddress() %></td>
				<td><%=m.getHobby() %></td>
				<td><%=m.getEnrollDate() %></td>
			</tr>
		<%	}
		} else 
		  {%>
			 <tr>
			 	<td colspan='9' align='center'>검색결과가 없습니다.</td>
			 </tr>
		 <%} %>		
	</table>
</section>





<%@include file="/views/common/footer.jsp" %>