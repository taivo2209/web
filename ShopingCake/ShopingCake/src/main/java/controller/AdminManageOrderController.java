package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import dao.BillsDAO;
import dao.BillsDetailDAO;
import model.BillDetailsFull;
import model.Bills;

/**
 * Servlet implementation class AdminManageOrderController
 */
@WebServlet("/AdminManageOrderController")
public class AdminManageOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminManageOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		BillsDAO b = new BillsDAO();
		ArrayList<Bills> listBD= b.getListOrder();
		 Gson  gson = new GsonBuilder().create();
		JsonArray jarrayB = gson.toJsonTree(listBD).getAsJsonArray();

	        var jsonObject = new JsonObject();
	        jsonObject.add("products", jarrayB);

	        request.setAttribute("jsonOrder", jarrayB);
	        
		RequestDispatcher rd = request.getRequestDispatcher("admin\\managaorder.jsp");
		rd.forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
