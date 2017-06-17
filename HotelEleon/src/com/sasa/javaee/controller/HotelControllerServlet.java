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
			if (command.equals("INDEX")) {
				toHomePage(request, response);
			} else if (command.equals("BOOKING_PAGE")) {

				request.setAttribute("availableRooms", dataBase.getAvailableRooms().size() > 0);
				request.setAttribute("availableTypes", dataBase.getAvailableRooms());

				toBookingPage(request, response);
			}
		} catch (Exception e) {
			toHomePage(request, response);
			e.printStackTrace(System.out);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String command;

		if (request.getParameter("command") == null) {
			command = "INDEX";
		} else {
			command = request.getParameter("command");
		}

		try {
			if (command.equals("BOOK")) {
				booking(request, response);
			} else {
				response.sendRedirect(request.getContextPath() + "/HotelControllerServlet?command=INDEX");
			}
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath() + "/HotelControllerServlet?command=INDEX");
			e.printStackTrace(System.out);
		}

	}

	private void booking(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException, ParseException {

		Customer customer = new Customer(request.getParameter("firstName"), request.getParameter("lastName"),
				request.getParameter("email"), request.getParameter("phone"));

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		Booking booking = new Booking(format.parse(request.getParameter("checkIn")),
				format.parse(request.getParameter("checkOut")), customer,
				dataBase.getFreeRoom(request.getParameter("roomType")), request.getParameter("comment"));
		
		

		dataBase.bookingRoom(customer, booking);

		response.sendRedirect(request.getContextPath() + "/HotelControllerServlet?command=INDEX");

	}

	private void toHomePage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// get RequestDispatcher
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.html");

		dispatcher.forward(request, response);

	}

	private void toBookingPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// get RequestDispatcher
		RequestDispatcher dispatcher = request.getRequestDispatcher("booking.jsp");

		dispatcher.forward(request, response);

	}

}
