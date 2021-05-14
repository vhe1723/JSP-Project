<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
		body {
  height: 100%;
  overflow: hidden;
  width: 100% !important;
  box-sizing: border-box;
  font-family: 'Roboto', sans-serif;
}




.backLeft {
  position: absolute;
  left: 0;
  width: 50%;
  height: 100%;
  background: #e74c3c url(https://download.unsplash.com/photo-1428279148693-1cf2163ed67d);
  background-size: cover;
  background-position: 50% 50%;
}

#back {
  width: 100%;
  height: 100%;
  position: absolute;
  z-index: -999;
}

#slideBox {
  width: 50%;
  max-height: 100%;
  height: 100%;
  overflow: hidden;
  margin-left: 50%;
  position: absolute;
  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
}
.topLayer {
  width: 200%;
  height: 0%;
  position: relative;
  left: 0;
  left: -100%;
}

.left {
  width: 50%;
  height: 100%;
  background: #2C3034;
  left: 0;
  position: absolute;
}

.right {
  width: 50%;
  height: 100%;
  background: #f9f9f9;
  right: 0;
  position: absolute;
}

.content {
  width: 300px;
  margin: 0 auto;
  top: 30%;
  position: absolute;
  left: 50%;
  margin-left: -125px;
}

.content h2 {
  color: #03A9F4;
  font-weight: 300;
  font-size: 20px;
}

button {
  background: #03A9F4;
  padding: 10px 16px;
  width: auto;
  font-weight: 600;
  text-transform:  uppercase;
  font-size: 14px;
  color: #fff;
  line-height: 16px;
  letter-spacing: 0.5px;
  border-radius: 2px;
  box-shadow: 0 2px 6px rgba(0,0,0,0.1), 0 3px 6px rgba(0,0,0,0.1);
  border: 0;
  outline: 0;
  margin: 15px 15px 15px 0;
  transition: all 0.25s;
}

button:hover {
  background: #0288D1;
  box-shadow: 0 4px 7px rgba(0,0,0,0.1), 0 3px 6px rgba(0,0,0,0.1);
}
.off {
  background: none;
  color: #03A9F4;
  box-shadow: none;
}

.right .off:hover {
  background: #eee;
  color: #03A9F4;
  box-shadow: none;
}
.left .off:hover {
  box-shadow: none;
  color: #03A9F4;
  background: #363A3D;
}
input {
  background: transparent;
  border: 0;
  outline: 0;
  border-bottom: 1px solid #45494C;
  font-size: 14px;
  color: #959595;
  padding: 8px 0;
  margin-top: 15px;
}
	</style>
	<script>
		$(document).ready(function(){
  $('#goRight').on('click', function(){
    $('#slideBox').animate({
      'marginLeft' : '0'
    });
    $('.topLayer').animate({
      'marginLeft' : '100%'
    });
  });
  $('#goLeft').on('click', function(){
    $('#slideBox').animate({
      'marginLeft' : '50%'
    });
    $('.topLayer').animate({
      'marginLeft': '0'
    });
  });
});
		function RegistCheckForm(){
			   var reg_name = window.document.Frm1Login.reg_name;
			   var reg_id = window.document.Frm1Login.reg_id;
			   var reg_pass = window.document.Frm1Login.reg_pass;
			   var reg_pass1 = window.document.Frm1Login.reg_pass1;
			   var reg_address = window.document.Frm1Login.reg_address;
			   var reg_phone = window.document.Frm1Login.reg_phone;
			   var reg_mail = window.document.Frm1Login.reg_mail;
			 

			}

		 function gomain() {
		      window.location.href = 'Main_Client.jsp';
		   }

	</script>
</head>
<body>

<div id="back">
		<div class="backRight"></div>
		<div class="backLeft"></div>
	  </div>
	  
	  <div id="slideBox">
		<div class="topLayer">
		  <div class="left">
			<div class="content">
			  <h2>Sign Up</h2>
				<div class="form-group"></div>
				<div class="form-group"></div>
				<div class="form-group"></div>
			  </form>
			  <button id="goLeft" class="off">Login</button>
			  <button>Sign up</button>
			</div>
		  </div>
		  <div class="right">
			<div class="content">
			  <h2>JSP Project</h2>
		 <form name="Frm1Login" method="post" onsubmit="return RegistCheckForm();"  action="Regist_process.jsp">
   <p>NAME : <input type="text" id="reg_name" name="reg_name" placeholder="이름을 입력하세요" >
   <p>ID : <input type="text" name="reg_id"  placeholder="ID를 입력하세요">
 	<input type="submit" value="중복확인" onclick="javascript_:document.Frm1Login.action='Regist_process2.jsp';">
   <p>PW : <input type="password" name="reg_pass"  placeholder="PW를 입력하세요">
   <p>PW CHECK : <input type="password" name="reg_pass1"  placeholder="PW를 확인해주세요">
   <p>ADDRESS : <input type="text" name="reg_address"  placeholder="주소를 입력하세요">
   <p>PHONE NUMBER : <input type="text" name="reg_phone"  placeholder="전화번호를 입력하세요">
   <p>E-MAIL : <input type="text" name="reg_mail"  placeholder="이메일주소를 입력하세요">
   
   <button>가입 완료</button>
   <input  type='button' value='CANCEL' onclick='gomain()'>
	</form>
			</div>
		  </div>
		</div>
	  </div>
	  

</body>
</html>


