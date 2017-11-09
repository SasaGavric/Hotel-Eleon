package com.sasa.javaee.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.sql.DataSource;

public class HotelDateBaseUtil {

	private DataSource dataSource;

	public HotelDateBaseUtil(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public void bookingRoom(Customer customer, Booking book) throws SQLException {
		try (Connection myConn = dataSource.getConnection()) {

			try (PreparedStatement myPstmt = myConn.prepareStatement("{call newCustomer(?,?,?,?)}")) {
				myPstmt.setString(1, customer.getFirstName());
				myPstmt.setString(2, customer.getLastName());
				myPstmt.setString(3, customer.getEmail());
				myPstmt.setString(4, customer.getPhone());

				myPstmt.execute();
			}

			try (PreparedStatement myPstmt = myConn.prepareStatement("{call newBooking(?,?,?,?,?)}")) {

				myPstmt.setDate(1, new Date(book.getBookingDate().getTime()));
				myPstmt.setDate(2, new Date(book.getCheckInDate().getTime()));
				myPstmt.setDate(3, new Date(book.getCheckOutDate().getTime()));
				myPstmt.setInt(4, getCustomerId());
				myPstmt.setString(5, book.getComment());

				myPstmt.execute();
			}

		}

	}

	private int getCustomerId() throws SQLException {
		try (Connection myConn = dataSource.getConnection()) {
			try (CallableStatement myStmt = myConn.prepareCall("{call getLastCustomerId(?)}")) {
				myStmt.registerOutParameter(1, Types.INTEGER);
				myStmt.execute();

				return myStmt.getInt(1);
			}
		}

	}

	public List<Room> getRooms() throws SQLException {

		ArrayList<Room> listOfRooms = new ArrayList<Room>();

		try (Connection myConn = dataSource.getConnection()) {

			try (PreparedStatement myStmt = myConn.prepareStatement("{call getRooms()}")) {

				try (ResultSet myRs = myStmt.executeQuery()) {
					while (myRs.next()) {
						listOfRooms.add(new Room(myRs.getInt(1), myRs.getInt(3), myRs.getBoolean(2)));
					}
				}

			}

		}catch(Exception e) {
			e.printStackTrace(System.out);
		}
		return listOfRooms;
	}

	public Room getFreeRoom(String roomType) throws SQLException {

		int roomId;

		if (roomType.equals("Classic")) {
			roomId = 1;
		} else if (roomType.equals("Silver")) {
			roomId = 2;
		} else {
			roomId = 3;
		}

		for (Room room : getRooms()) {
			if (room.getTypeId() == roomId && room.isBooked == false) {
				return room;
			}
		}
		return null;
	}

	public Set<String> getAvailableRooms() throws SQLException {
		Set<String> listOfAvailableRooms = new HashSet<>();

		getRooms().forEach((room) ->{
			if (!room.isBooked) {
				if (room.typeId == 1) {
					listOfAvailableRooms.add("Classic");
				} else if (room.typeId == 2) {
					listOfAvailableRooms.add("Silver");
				} else {
					listOfAvailableRooms.add("Gold");
				}
			}
		});
		
		return listOfAvailableRooms;
	}

}
