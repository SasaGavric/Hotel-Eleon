package com.sasa.JavaEE.model;

import java.util.ArrayList;

public class Room {
	
	private double price;
	private boolean isBooked;
	private String type;
	private ArrayList<String> listOfPictures;
	private ArrayList<String> listOfVideos;
	
	
	
	public Room(double price, boolean isBooked, String type) {
		super();
		this.price = price;
		this.isBooked = isBooked;
		this.type = type;
	}
	
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public boolean isBooked() {
		return isBooked;
	}
	public void setBooked(boolean isBooked) {
		this.isBooked = isBooked;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public ArrayList<String> getListOfPictures() {
		return listOfPictures;
	}
	public void setListOfPictures(ArrayList<String> listOfPictures) {
		this.listOfPictures = listOfPictures;
	}
	public ArrayList<String> getListOfVideos() {
		return listOfVideos;
	}
	public void setListOfVideos(ArrayList<String> listOfVideos) {
		this.listOfVideos = listOfVideos;
	}
	
	
	
	
	

}
