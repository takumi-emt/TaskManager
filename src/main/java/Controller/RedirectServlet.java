package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.entity.TaskBean;

/**
 * Servlet implementation class RedirectServlet
 */
@WebServlet("/redirect-servlet")
public class RedirectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RedirectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String user_id = (String)session.getAttribute("USER_ID");
		String url = "";
		@SuppressWarnings("unchecked")
		List<TaskBean> tasks = (List<TaskBean>) session.getAttribute("TASK_LIST");
		
		if(user_id != null) {
			if(request.getParameter("delete") != null) {
				url = "task-delete-servlet";
				List<TaskBean> list = new ArrayList<TaskBean>();
				String[] selected = request.getParameterValues("task_id");
				session.setAttribute("TASK_IDs", selected);
				int i = 0;
				for(String id : selected) {
					for(TaskBean task : tasks) {
						if(String.valueOf(task.getTaskId()).equals(id)) {
							list.add(tasks.get(i));
						}
					}
					i++;
				}
				session.setAttribute("SELECTED_TASKS", list);
			}
			else {
				url = "task-edit-servlet";
				int i = 0;
				for(TaskBean task : tasks) {
					if(request.getParameter(String.valueOf(task.getTaskId())) != null) {
						session.setAttribute("TASK", tasks.get(i));
						session.setAttribute("TASK_ID", i);
					}
					i++;
				}
			}
		}else {
			
			// ログイン画面
			url = "login.html";
		}
		
		// リクエスト転送
		request.getRequestDispatcher(url).forward(request, response);
	}

}