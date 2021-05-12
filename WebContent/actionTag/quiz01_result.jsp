<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	앞에서 넘어온 값을 받아서 평균을 구합니다.
	평균이 60점이상 이라면 quiz01_ok.jsp로 이동해서
		~~님 평균xx점 합격입니다.
	
	평균이 60점이하인 경우는 quiz01_no.jsp로 이동해서
		~~님 평균xx점 불합격
	
	조건:세션 사용하지 않습니다.		
	*/
	
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String math = request.getParameter("math");
	//형변환
	int k = Integer.parseInt(kor);
	int e = Integer.parseInt(eng);
	int m = Integer.parseInt(math);
	
	double avg = (k + e + m) / 3.0;
	
	//request객체에 강제저장
	request.setAttribute("name", name);
	request.setAttribute("avg", avg);
	
	//값을 담아서 다음화면으로 전달하기위해서 forward사용
	if(avg > 60) {
		request.getRequestDispatcher("quiz01_ok.jsp").forward(request, response);
	} else {
		request.getRequestDispatcher("quiz02_no.jsp").forward(request, response);
	}
	
	
	
%>