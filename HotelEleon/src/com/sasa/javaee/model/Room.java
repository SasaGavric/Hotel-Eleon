package com.sasa.javaee.model;

public class Room {
	
	int id;
	int typeId;
	boolean isBooked;
	
	public Room(int id, int typeId, boolean isBooked) {
		super();
		this.id = id;
		this.typeId = typeId;
		this.isBooked = isBooked;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public boolean isBooked() {
		return isBooked;
	}

	public void setBooked(boolean isBooked) {
		this.isBooked = isBooked;
	}
	
	
	
	

}
