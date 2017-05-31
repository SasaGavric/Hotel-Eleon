package com.sasa.JavaEE.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.sasa.JavaEE.model.ModelDB;

/**
 * Servlet implementation class RoomControllerServlet
 */
@WebServlet("/RoomControllerServlet")
public class RoomControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="jdbc/hoteleleon")
	DataSource dataSource;
	ModelDB modelDb;
	
	@Override
	public void init(){
		modelDb = new ModelDB(dataSource);
	}
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			request.setAttribute("listOfRooms", modelDb.getRooms());
		} catch (SQLException e) {
			e.printStackTrace(System.out);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("bookingRooms.jsp");
		dispatcher.forward(request, response);
		
	}

}
