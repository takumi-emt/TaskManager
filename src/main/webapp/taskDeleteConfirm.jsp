<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List,Model.entity.TaskBean"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>タスク削除確認画面</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
	<%
	if(session.getAttribute("USER_ID") == null){
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	List<TaskBean> taskList = (List<TaskBean>) session.getAttribute("SELECTED_TASKS");
	%>
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		<h2 style="padding: 1rem 2rem;border-left: 5px solid #000;nd: #F4F4F4;">削除確認画面</h2>
		以下の情報を削除してもよろしいですか？
		<%for(TaskBean task : taskList){%>
		<table class="table table-striped table-bordered">
			<tr>
				<td style= "width:200px;background-color:LightGrey;">タスク名</td>
				<td><%=task.getTaskName()%></td>
			</tr>
			<tr>
				<td style= "width:200px;background-color:LightGrey;">カテゴリ情報</td>
				<td><%=task.getCategoryName()%></td>
			</tr>
			<tr>
				<td style= "width:200px;background-color:LightGrey;">期限</td>
				<td><%=task.getDeadLine()%></td>
			</tr>
			<tr>
				<td style= "width:200px;background-color:LightGrey;">担当者名</td>
				<td><%=task.getUserName()%></td>
			</tr>
			<tr>
				<td style= "width:200px;background-color:LightGrey;">ステータス情報</td>
				<td><%=task.getStatus()%></td>
			</tr>
			<tr>
				<td style= "width:200px;background-color:LightGrey;">メモ</td>
				<td><%=task.getMemo()%></td>
			</tr>
		</table>
		<%} %>
		<br>
		<form action="task-delete-request-servlet" method=post>
			<button type="submit" class="btn btn-secondary">削除する</button>
		</form>
		<br>
		<form action="task-list-servlet" method=post>
			<button type="submit" class="btn btn-secondary">キャンセル</button>
		</form>
	</div>
	
</body>
</html>