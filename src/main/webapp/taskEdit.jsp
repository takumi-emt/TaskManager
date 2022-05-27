<%@page import="Model.entity.TaskBean"%>
<%@page import="Model.entity.CategoryBean"%>
<%@page import="Model.entity.StatusBean"%>
<%@page import="Model.entity.UserBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>タスク編集画面</title>
</head>
<body>
<jsp:useBean id="TASK" class="Model.entity.TaskBean" scope="session"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	List<CategoryBean> categoryList = (List<CategoryBean>)request.getAttribute("CATEGORY_LIST");
	List<StatusBean> statusList = (List<StatusBean>)request.getAttribute("STATUS_LIST");
	List<UserBean> userList = (List<UserBean>)request.getAttribute("USER_LIST");	
%>
	<h2>タスク編集</h2>
	<form action="task-edit-request-servlet" method="post">
		<table>
			<tr><th>タスク名</th><td><input type="text" name="task_name" maxlength="50"
			value="<jsp:getProperty property="taskName" name="TASK"/>"></td></tr>
			<tr><th>カテゴリ</th>
			<td><select name="task_category" >
			<%
			int categoryId = TASK.getCategoryId();
			for(CategoryBean category : categoryList){
				if(category.getCategoryId()== categoryId){
			%>
					<option value="<%=category.getCategoryId()%>" selected><%=category.getCategoryName()%></option>			
			<%
				}else{
			%>
					<option value="<%=category.getCategoryId()%>"><%=category.getCategoryName()%></option>
			<%
				}
			}
			%>
			</select></td></tr>
			<tr><th>期限</th>
			<td><input type="date" name="task_limit" 
			value="<jsp:getProperty property="deadLine" name="TASK"/>"></td></tr>
			<tr><th>担当者</th>
			<td><select name="task_user">
			<%
			String userId = TASK.getUserId();
			for(UserBean user : userList){
				if(userId.equals(user.getUserId())){
			%>
					<option value="<%=user.getUserId()%>" selected><%=user.getUserName()%></option>
				<%
				}else{
				%>
					<option value="<%=user.getUserId()%>"><%=user.getUserName()%></option>
				<%
				}
			}
			%>
			</select></td></tr>
			<tr><th>ステータス</th><td>
			<select name="task_status">
			<%
			String statusCode = TASK.getStatusId();
			for(StatusBean status : statusList){
				if(statusCode.equals(status.getStatusCode())){
			%>
				<option value="<%=status.getStatusCode()%>" selected><%=status.getStatusName()%></option>
			<%
				}else{
			%>
				<option value="<%=status.getStatusCode()%>"><%=status.getStatusName()%></option>
			<%
				}
			}
			%>
			</select>
			</td></tr>
			<tr><th>メモ</th><td>
			<textarea name="task_memo" rows="3" cols="50" maxlength="100"><jsp:getProperty property="memo" name="TASK"/>
			</textarea></td></tr>
		</table>
		<input type="submit" value="更新" style="text-align: right;">
	</form>
</body>
</html>