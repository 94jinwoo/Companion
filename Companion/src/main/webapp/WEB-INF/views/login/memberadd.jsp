<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form method="post">
		<label for="mbId">ID</label>
		<input type="text" name="mbId" id="mbId" placeholder="ID">
		
		<label for="mbPw">PW</label>
		<input type="password" name="mbPw" id="mbPw" placeholder="PW">
		
		<label for="mbName">NAME</label>	
		<input type="text" name="mbName" id="mbName" placeholder="name">
		
		<label for="mbTel">TEL</label>
		<input type="text" name="mbTel" id="mbTel" placeholder="��ĭ����">
		
		<label for="mbPhone">PHONE</label>
		<input type="text" name="mbPhone" id="mbPhone" placeholder="phone number without -">
		
		<label for="mbEmail">E-MAIL</label>
		<input type="text" name="mbEmail" id="mbEmail" placeholder="E-mail contains @">
		
		<label for="mbAddr1">�����ȣ</label>
		<input type="text" name="mbAddr1" id="mbAddr1" placeholder="5�ڸ� ����">
		
		<label for="mbAddr2">�⺻�ּ�</label>		
		<input type="text" name="mbAddr2" id="mbAddr2" placeholder="XX�� XX�� XX��">
		
		<label for="mbAddr3">���ּ�</label>
		<input type="text" name="mbAddr3" id="mbAddr3" placeholder="XXX���� XX XXX����Ʈ XXX�� XXXȣ">
		
		<input type="hidden" name="mbCode" id="mbCode" value="2">
		
		<button type="submit">����</button>
		<button type="button" onclick="history.back();">�ڷ�</button>
	</form>
</body>
</html>