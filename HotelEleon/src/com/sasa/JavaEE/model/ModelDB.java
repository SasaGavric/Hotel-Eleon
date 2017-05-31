package com.sasa.JavaEE.model;

import java.sql.CallableStatement;
import java.sql.Connection;
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
		
		try(Connection myConn = dataSource.getConnection()){
			
			try(CallableStatement callStmt = myConn.prepareCall("{call getRooms}")){
				
				try(ResultSet myRs = callStmt.executeQuery()){
					
					while(myRs.next()){
						listOfRooms.add(new Room(myRs.getDouble(2), myRs.getBoolean(3), myRs.getString(4)));
					}
					
				}
				
			}
			
		}
		return listOfRooms;
		
	}

}
