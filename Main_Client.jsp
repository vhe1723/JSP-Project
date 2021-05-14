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



.backRight {
  position: absolute;
  right: 0;
  width: 50%;
  height: 100%;
  background: #3498db url(https://download.unsplash.com/photo-1429041966141-44d228a42775);
  background-size: cover;
  background-position: 50% 50%;
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
  height: 100%;
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
  width: 250px;
  margin: 0 auto;
  top: 30%;
  position: absolute;
  left: 50%;
  margin-left: -125px;
}

.content h2 {
  color: #03A9F4;
  font-weight: 300;
  font-size: 35px;
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
  margin-top: 20px;
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
		function loginCheckForm(){
			var reg_id = window.document.FrmLogin.reg_id;
			if(reg_id.value == ""){			        //아이디가 입력되지 않았다면
			alert("아이디를 입력하시오.");
			
			return false;					//진행하지 말고 대기(submit이벤트 중지)
		}
			var reg_pass = window.document.FrmLogin.reg_pass;
			if(reg_pass.value == ""){			        //아이디가 입력되지 않았다면
			alert("비밀번호를 입력하시오.");
			
			return false;					//진행하지 말고 대기(submit이벤트 중지)
		}
		
	}

		function regist(){
			location.href="Regist.jsp";
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
			  <form method="post" onsubmit="return false;">
				<div class="form-group">
				  <input type="text" placeholder="username" />
				</div>
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
			  <form name="FrmLogin" method="post" onsubmit="return loginCheckForm();"  action="Main_Server.jsp">
					<p> ID : <input type="text" id="reg_id"  name="reg_id"/>
					<p> PW : <input type="password" name="reg_pass">
					<p><button  id="goRight"  class="off">login</button>
					<button type="button" id="goRight"  onclick="regist()">Sign up</button>
				</form>
			</div>
		  </div>
		</div>
	  </div>
	  

</body>
</html>
