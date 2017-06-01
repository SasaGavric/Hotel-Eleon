package com.sasa.JavaEE.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class ModelDB {
	
	DataSource dataSource;
	
	public ModelDB(DataSource dataSource){
		this.dataSource = dataSource;
	}
	
	public List<Room> getRooms() throws SQLException{
		ArrayList<Room> listOfRooms = new ArrayList<Room>();
			
			try(CallableStatement callStmt = getConnection().prepareCall("{call getRooms}")){
				
				try(ResultSet myRs = callStmt.executeQuery()){
					
					while(myRs.next()){
						listOfRooms.add(new Room(myRs.getDouble(2), myRs.getBoolean(3), myRs.getString(4)));
					}
					
				}
				
			}
			
		
		return listOfRooms;
		
	}

	
	public boolean bookRoom(String firstName, String lastName, String citzenShip, String city,String adress, String phone) throws SQLException{
		

		try(Connection myConn = dataSource.getConnection()){
		try(PreparedStatement myCallStmt = myConn.prepareStatement("{call bookRoom(?, ?, ?, ?, ?, ?) }")){
			
			myCallStmt.setString(1, firstName);
			myCallStmt.setString(2, lastName);
			myCallStmt.setString(3, citzenShip);
			myCallStmt.setString(4, city);
			myCallStmt.setString(5, adress);
			myCallStmt.setString(6, phone);
			
			
			myCallStmt.execute();
			return true;
		}catch(Exception e){
			e.printStackTrace(System.out);
			return false;
		}
		}
		
	}
	
	public Connection getConnection() throws SQLException{
		
		try(Connection myConn = dataSource.getConnection()){
			return myConn;
		}
		
	}
}
