package com.sasa.javaee.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

public class HotelDateBaseUtil {

	private DataSource dataSource;

	public HotelDateBaseUtil(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public void addNewCustomer(Customer customer) throws SQLException {
		try (Connection myConn = dataSource.getConnection()) {

			try (PreparedStatement myPstmt = myConn.prepareStatement("{call newCustomer(?,?,?,?)}")) {
				myPstmt.setString(1, customer.getFirstName());
				myPstmt.setString(2, customer.getLastName());
				myPstmt.setString(3, customer.getEmail());
				myPstmt.setString(4, customer.getPhone());

				myPstmt.execute();
			}

		}

	}

	public void bookRoom(Booking book) throws SQLException {
		try (Connection myConn = dataSource.getConnection()) {

			try (PreparedStatement myPstmt = myConn.prepareStatement("{call newBooking(?,?,?,?,?)}")) {

			}

		}

	}

	public int getFreeRoom(String roomType) {

		if (roomType.equals("classic")) {
			return 1;
		} else if (roomType.equals("silver")) {
			return 2;
		} else {
			return 3;
		}
	}

}
