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
   String reg_name = request.getParameter("reg_name");
   String reg_id = request.getParameter("reg_id");
   String reg_pass = request.getParameter("reg_pass");
   String reg_pass1 = request.getParameter("reg_pass1");
   String reg_address = request.getParameter("reg_address");
   String reg_phone = request.getParameter("reg_phone");
   String reg_mail = request.getParameter("reg_mail");
   
   ResultSet rs = null;
   Statement stmt = conn.createStatement();  // ���� ��ɹ�
   
     String sql = "SELECT reg_id FROM register ";
      sql += "WHERE reg_id = '" + reg_id + "';";
    //  out.print(sql);
      rs = stmt.executeQuery(sql);
	if(reg_name == "") {
		 %>
	      <script>
	         alert("�̸��� �Է��ϼ���!");
	         history.go(-1);
	      </script>
	   <%
	}
	else if(reg_id == "") {
		 %>
	      <script>
	         alert("ID�� �Է��ϼ���!");
	         history.go(-1);
	      </script>
	   <%
	}
	else if(reg_pass == "") {
		 %>
	      <script>
	         alert("PW�� �Է��ϼ���!");
	         history.go(-1);
	      </script>
	   <%
	}
	else if(!reg_pass1.equals(reg_pass)) {
		 %>
	      <script>
	         alert("PW�� �����ʽ��ϴ�!");
	         history.go(-1);
	      </script>
	   <%
	}
	else if(reg_address == "") {
		 %>
	      <script>
	         alert("�ּҸ� �Է��ϼ���!");
	         history.go(-1);
	      </script>
	   <%
	}
	else if(reg_phone == "") {
		 %>
	      <script>
	         alert("��ȭ��ȣ�� �Է��ϼ���!");
	         history.go(-1);
	      </script>
	   <%
	}
	else if(reg_mail == "") {
		 %>
	      <script>
	         alert("������ �Է��ϼ���!");
	         history.go(-1);
	      </script>
	   <%
	}
	
	else if (rs.next()) {
      %>
      <script>
         alert("�ߺ�Ȯ���� ���ּ���!");
         history.go(-1);
      </script>
   <%
      } 
         
      else {
         sql = "INSERT INTO register ";
         sql += "VALUES ('" + reg_name + "', '"; 
         sql += reg_id + "', '";
         sql += reg_pass + "', '";
         sql += reg_address + "', '";
         sql += reg_phone + "', '";
         sql += reg_mail + "' );";
         stmt.executeUpdate(sql);

         //stmt.executeUpdate(sql);
   %>
      <script>
         alert("���ԵǾ����ϴ�.");
         window.location.href = 'Main_Client.jsp';

      </script>
   <%
      }

      stmt.close();
      conn.close();
   %>

   
   


</body>
</html>