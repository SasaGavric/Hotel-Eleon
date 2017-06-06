package com.sasa.javaee.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.sasa.javaee.model.Booking;
import com.sasa.javaee.model.Customer;
import com.sasa.javaee.model.HotelDateBaseUtil;

/**
 * Servlet implementation class HotelControllerServlet
 */
@WebServlet("/HotelControllerServlet")
public class HotelControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/hoteleleon")
	DataSource dataSource;

	HotelDateBaseUtil dataBase;

	public void init() {
		dataBase = new HotelDateBaseUtil(dataSource);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String command;

		if (request.getParameter("command") == null) {
			command = "INDEX";
		} else {
			command = request.getParameter("command");
		}
		try {
			switch (command) {

			case "INDEX":
				toHomePage(request, response);
				break;
			case "BOOK":
				booking(request, response);

				break;

			}
		} catch (Exception e) {
			e.printStackTrace(System.out);
		}

	}

	private void booking(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException, ParseException {

		Customer customer = new Customer(request.getParameter("firstName"), request.getParameter("lastName"),
				request.getParameter("email"), request.getParameter("phone"));

		dataBase.addNewCustomer(customer);

		Booking booking = new Booking(new SimpleDateFormat().parse(request.getParameter("checkIn")),
				new SimpleDateFormat().parse(request.getParameter("checkOut")), customer.getId(),
				dataBase.getFreeRoom(request.getParameter("roomType")));
		// dataBase.bookRoom(booking);

		toHomePage(request, response);

	}

	private void toHomePage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// get RequestDispatcher
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.html");

		dispatcher.forward(request, response);

	}

}
