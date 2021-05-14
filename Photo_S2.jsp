<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.imageio.*"%>
<%@ page import="java.awt.image.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
   MultipartRequest multi = new MultipartRequest(request, "c:\\upload", 
         5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
   
   String tmp;
   Enumeration params = multi.getParameterNames();
   tmp = (String) params.nextElement();
   String algo = multi.getParameter(tmp);
   tmp = (String) params.nextElement();
   String parameter = multi.getParameter(tmp);

   Enumeration files = multi.getFileNames();
   tmp = (String) files.nextElement();
   String filename = multi.getFilesystemName(tmp);
   
         
   int inW, inH,outW=0, outH=0;
   
   File inFp;
   FileInputStream inFs;
   inFp = new File("C:/Upload/" + filename);
   
   // Į�� �̹��� ó��
   BufferedImage cImage = ImageIO.read(inFp);
   inW = cImage.getHeight();
   inH = cImage.getWidth();
   // (2) JSP���� �迭 ó��
   int[][][]  inImage = new int[3][inH][inW]; // �޸� �Ҵ�
   // ���� --> �޸�
   for (int i=0; i<inH; i++) {
      for (int k=0; k<inW; k++) {
         int rgb = cImage.getRGB(i,k);
         inImage[0][i][k] = (rgb >> 16) & 0xFF; // Red
         inImage[1][i][k] = (rgb >> 8) & 0xFF; // Green
         inImage[2][i][k] = (rgb ) & 0xFF; // Blue
      }
   }

   
   
   int[][][] outImage = null;
   int R, G, B;
   int RGB;
   switch (algo) {
   case "1" :   // �����ϱ�
      // ���� �˰��� :  out = 255 - in
      // (�߿�!) ��¿����� ũ�� ���� --> �˰��� ����
      outH = inH;
      outW = inW;
      // �޸� �Ҵ�
      outImage = new int[3][outH][outW];
      // ��¥ ����ó�� �˰���
      for (int rgb=0; rgb<3; rgb++)
         for(int i=0; i<inH; i++)
            for (int k=0; k<inW; k++) {
               outImage[rgb][i][k] = 255 - inImage[rgb][i][k];
            }
      break;
   case "2" :   // ����ϱ�
      // ���ϱ� �˰��� :  out = in + ��  (����!�����÷�)
      // (�߿�!) ��¿����� ũ�� ���� --> �˰��� ����
      outH = inH;
      outW = inW;
      // �޸� �Ҵ�
      outImage = new int[3][outH][outW];
      // ��¥ ����ó�� �˰���
      for (int rgb=0; rgb<3; rgb++)
         for(int i=0; i<inH; i++)
            for (int k=0; k<inW; k++) {
               int value = inImage[rgb][i][k] + Integer.parseInt(parameter);
               if (value > 255)
                   value = 255;
               if (value < 0)
                  value = 0;
               outImage[rgb][i][k] = value;            
            }
      break;
   case "3" : //�׷��̽�����
      // ���ϱ� �˰��� :  out = in + ��  (����!�����÷�)
      // (�߿�!) ��¿����� ũ�� ���� --> �˰��� ����
      outH = inH;
      outW = inW;
      // �޸� �Ҵ�
      outImage = new int[3][outH][outW];
      // ��¥ ����ó�� �˰���
      //RGB�� �ʱ�ȭ
      R=0;
      G=0;
      B=0;
      RGB=0;
      for (int i=0; i<inH; i++){
         for (int k=0; k<inW; k++){
            R = inImage[0][i][k];
            G = inImage[1][i][k];
            B = inImage[2][i][k];
            
            RGB = (R+G+B)/3;
            
            outImage[0][i][k] = RGB;
            outImage[1][i][k] = RGB;
            outImage[2][i][k] = RGB;            
         }
      }
      break;
   case "4" : //���
      // ���ϱ� �˰��� :  out = in + ��  (����!�����÷�)
      // (�߿�!) ��¿����� ũ�� ���� --> �˰��� ����
      outH = inH;
      outW = inW;
      // �޸� �Ҵ�
      outImage = new int[3][outH][outW];
      // ��¥ ����ó�� �˰���
      //RGB�� �ʱ�ȭ
      R=0;
      G=0;
      B=0;
      RGB=0;
      int value=Integer.parseInt(parameter);
      for (int i=0; i<inH; i++){
         for (int k=0; k<inW; k++){
            R = inImage[0][i][k];
            G = inImage[1][i][k];
            B = inImage[2][i][k];
            
            RGB = (R+G+B)/3;
            if (RGB > value)
               RGB = 255;
            else
               RGB = 0;
            
            outImage[0][i][k] = RGB;
            outImage[1][i][k] = RGB;
            outImage[2][i][k] = RGB;            
         }
      }
      break;
   case "5" : //�����Ͷ���¡
      // ���ϱ� �˰��� :  out = in + ��  (����!�����÷�)
      // (�߿�!) ��¿����� ũ�� ���� --> �˰��� ����
      outH = inH;
      outW = inW;
      // �޸� �Ҵ�
      outImage = new int[3][outH][outW];
      // ��¥ ����ó�� �˰���
      //RGB�� �ʱ�ȭ
      R=0;
      G=0;
      B=0;
      RGB=0;
      for (int i=0; i<inH; i++){
         for (int k=0; k<inW; k++){
            R = inImage[0][i][k];
            G = inImage[1][i][k];
            B = inImage[2][i][k];
                if (R >= 231) {
                    R = 255;
                    }
                else if (R >= 206){
                   R = 230;
                    } 
                else if (R >= 181){
                   R = 205;
                    }
                else if (R >= 156){
                    R = 180;
                    }
                else if (R >= 131){
                   R = 155;
                    } 
                else if (R >= 106){
                   R = 130;
                    }
                else if (R >= 81){
                   R = 105;
                    }
                else if (R >= 56){
                   R = 80;
                    }
                else if (R >= 31){
                   R = 55;
                    }
                else R = 0;
                if (G >= 231) {
                   G = 255;
                    }
                else if (G >= 206){
                   G = 230;
                    }
                else if (G >= 181){
                   G = 205;
                    }
                else if (G >= 156){
                   G = 180;
                    }
                else if (G >= 131){
                   G = 155;
                    }
                else if (G >= 106){
                   R = 130;
                    }
                else if (G >= 81){
                   G = 105;
                    }
                else if (G >= 56){
                   G = 80;
                    }
                else if (G >= 31){
                   G = 55;
                    }
                else G = 0;
                if (B >= 231) {
                   B = 255;
                   }
                else if (B >= 206){
                       B = 230;
                   }
                else if (B >= 181){
                       B = 205;
                   }
                else if (B >= 156){
                       B = 180;
                   }
                else if (B >= 131){
                       B = 155;
                   }
                else if (B >= 106){
                       B = 130;
                   }
                else if (B >= 81){
                       B = 105;
                   }
                else if (B >= 56){
                       B = 80;
                   }
                else if (B >= 31){
                       B = 55;
                   }
                else B = 0;
            outImage[0][i][k] = R;
            outImage[1][i][k] = G;
            outImage[2][i][k] = B;            
         }
      }
      break;

   
      
   }
   
   // (4) ����� ���Ϸ� ����
   File outFp;
   FileOutputStream outFs;
   String outFname = "out_" + filename ;
   outFp = new File("C:/Out/"+outFname);
   
   // Į�� �̹��� ����
   BufferedImage outCImage = new BufferedImage(outH, outW,
         BufferedImage.TYPE_INT_RGB);
   
   outFs = new FileOutputStream(outFp.getPath());
   // �޸� --> �����̹���
   for (int i=0; i<outH; i++) {
      for (int k=0; k<outW; k++) {
         int r = outImage[0][i][k];
         int g = outImage[1][i][k];
         int b = outImage[2][i][k];
         int px = 0;
         px = px | (r << 16);
         px = px | (g << 8);
         px = px | (b);      
         outCImage.setRGB(i,k,px);
      }
   }
   ImageIO.write(outCImage,"jpg", outFp);
   // out.println("c:/Out/out_" + filename + " ó����~");
   out.println("<h1><a  href='http://localhost:8080/Project/download.jsp?file="
          +outFname+ "'>�ٿ�ε�</a></h1>");
   
   
   
%>


</body>
</html>