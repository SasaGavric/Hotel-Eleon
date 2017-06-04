package com.sasa.javaee.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

public class HotelDateBaseUtil {

	private DataSource dataSource;

	public HotelDateBaseUtil(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public void addNewCustomer(Customer customer) throws SQLException {
		try(Connection myConn = dataSource.getConnection()){
			
			try(PreparedStatement myPstmt = myConn.prepareStatement("INSERT INTO customer (firstName, lastName, email, phone) VALUES (?,?,?,?)")){
				myPstmt.setString(1, customer.getFirstName());
				myPstmt.setString(2, customer.getLastName());
				myPstmt.setString(3, customer.getEmail());
				myPstmt.setString(4, customer.getPhone());
				
				myPstmt.execute();
			}
			
		}
		
	}
	
	
	
	
	
}
