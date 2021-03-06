<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List,Model.entity.TaskBean"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>タスク一覧表示画面</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="tableStyle.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="./bootstable.min.js"></script>
</head>
<body>
	<%
	if(session.getAttribute("USER_ID") == null){
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	List<TaskBean> tasks = (List) session.getAttribute("TASK_LIST");
	%>
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		<h2 style="padding: 1rem 2rem;border-left: 5px solid #000;nd: #F4F4F4;">タスク一覧</h2>
		<form action="redirect-servlet" method="POST">
		<div class="table-content sticky_table_wrapper">
			<table class="table table-borded border-white table-responsive table-striped sticky_table" id="table-list">
				<thead class="table-dark">
					<tr>
						<th></th>
						<th>タスク名</th>
						<th>カテゴリ情報</th>
						<th>期限</th>
						<th>担当者情報</th>
						<th>ステータス情報</th>
						<th>メモ</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<%
					for (TaskBean task : tasks) {
					%>
					<tr>
						<td style="width:15px;"><input class="form-check-input" type="checkbox" name="task_id"
							value="<%=task.getTaskId()%>"></td>
						<%="<td style=\"width:150px;\">" + task.getTaskName() + "</td>"%>
						<%="<td style=\"width:220px;\">" + task.getCategoryName() + "</td>"%>
						<%="<td style=\"width:100px;\">" + (task.getDeadLine()==null ? "" : task.getDeadLine()) + "</td>"%>
						<%="<td style=\"width:95px;\">" + task.getUserName() + "</td>"%>
						<%="<td style=\"width:105px;\">" + task.getStatus() + "</td>"%>
						<%="<td style=\"width:400px;\">" + task.getMemo() + "</td>"%>
						<td style="width:80px;">
							<button type="submit" name="<%=task.getTaskId()%>" class="btn btn-outline-secondary" style="width:70px;height:40px;">編集</button>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
		<br>
		<%if(request.getAttribute("errorMessage") != null){ %>
		<div style="color: red;"><%=request.getAttribute("errorMessage")%></div><br>
		<%} %>
		<button type="submit" name="delete" class="btn btn-secondary">削除</button>
		</form>
	</div>
</body>
</html>