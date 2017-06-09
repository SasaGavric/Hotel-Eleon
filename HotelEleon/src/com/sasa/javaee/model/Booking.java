package com.sasa.javaee.model;

import java.util.Date;

public class Booking {
	private Date bookingDate;
	private Date checkInDate;
	private Date checkOutDate;
	private Customer customer;
	private Room room;
	private String comment;
	
	public Booking(Date checkInDate, Date checkOutDate, Customer customer, Room room, String comment) {
		this.bookingDate = new Date();
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.customer = customer;
		this.room = room;
		this.comment = comment;
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

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
	

}
