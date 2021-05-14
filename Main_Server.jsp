<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file="P_DB.jsp" %>

<%
	String reg_id = request.getParameter("reg_id");
	String reg_pass = request.getParameter("reg_pass");

	ResultSet rs = null;
	Statement stmt = conn.createStatement();
	
	String sql = "SELECT reg_pass FROM register WHERE reg_id='";
	sql += reg_id + "'";
	rs =stmt.executeQuery(sql);
	
	String reg_pass2="";
	while(rs.next()) {
		reg_pass2 = rs.getString("reg_pass");		
	}	
	if (reg_pass.equals(reg_pass2)) {
		session.setAttribute("reg_id", reg_id);
		session.setAttribute("reg_pass", reg_pass);
		%>
		 <script>
         alert("로그인 성공!");
         window.location.href = 'Photo_C.jsp';

      </script>
      <%
	}
	else {
	      //out.println("로그인 실패");
	      %>
	      <script>
	      alert("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
	      history.go(-1); </script>
	      <%
	   }
	stmt.close();
	conn.close();			
%>

</body>
</html>