package com.sasa.javaee.model;

import java.util.Date;

public class Booking {
	Date bookingDate;
	Date checkInDate;
	Date checkOutDate;
	int customerId;
	int roomId;
	
	public Booking(Date checkInDate, Date checkOutDate, int customerId, int roomId) {
		this.bookingDate = new Date();
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.customerId = customerId;
		this.roomId = roomId;
	}

	public Date getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}

	public Date getCheckInDate() {
		return checkInDate;
	}

	public void setCheckInDate(Date checkInDate) {
		this.checkInDate = checkInDate;
	}

	public Date getCheckOutDate() {
		return checkOutDate;
	}

	public void setCheckOutDate(Date checkOutDate) {
		this.checkOutDate = checkOutDate;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	
	
	
	

}
