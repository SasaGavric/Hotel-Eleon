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
 * Servlet implementation class BookedRoomControllerServlet
 */
@WebServlet("/BookedRoomControllerServlet")
public class BookedRoomControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/hoteleleon")
	DataSource dataSource;
	ModelDB dataBase;

	@Override
	public void init() {
		dataBase = new ModelDB(dataSource);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		boolean isBooked = false;

		try {
			isBooked = dataBase.bookRoom(request.getParameter("firstName"), request.getParameter("lastName"),
					request.getParameter("citzenShip"), request.getParameter("city"), request.getParameter("adress"),
					request.getParameter("phone"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		RequestDispatcher dispatcher;

		request.setAttribute("isBooked", isBooked);
		dispatcher = request.getRequestDispatcher("successfully.jsp");

		dispatcher.forward(request, response);
	}

}
