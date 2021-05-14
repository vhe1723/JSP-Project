<%@ page contentType="application;" %>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.text.*"%>
<%
	//링크를 누르면 다운로드 되게하는 코드.
	// 사용법 : http://localhost:8080/íë¡ì í¸ëª/download.jsp?file=파일명

	String strFilename=java.net.URLDecoder.decode(request.getParameter("file"));
	String strFilenameOutput=new String(strFilename.getBytes("euc-kr"),"8859_1");
	File file=new File("c:/out/"+strFilename); // ì¶ë ¥ ê²°ê³¼ë¥¼ C:/Out í´ëì ê³ ì í¨.
	byte b[]=new byte[(int)file.length()];
	response.setHeader("Content-Disposition","attachment;filename="+strFilenameOutput);
	response.setHeader("Content-Length",String.valueOf(file.length()));
	if(file.isFile()){
		out.clear();
		out=pageContext.pushBody();
		BufferedInputStream fin=new BufferedInputStream(new FileInputStream(file));
		BufferedOutputStream outs=new BufferedOutputStream(response.getOutputStream());
		int read=0;
		while((read=fin.read(b))!=-1){
			outs.write(b,0,read);
		}
		outs.close();
		fin.close();

		
	}
%>