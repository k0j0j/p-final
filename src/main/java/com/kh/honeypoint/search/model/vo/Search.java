package com.kh.honeypoint.search.model.vo;

public class Search {
	private String searchValue;
	private int price;
	private String category;
	private String parking;
	
	public Search() {}

	public Search(String searchValue, int price, String category, String parking) {
		super();
		this.searchValue = searchValue;
		this.price = price;
		this.category = category;
		this.parking = parking;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	@Override
	public String toString() {
		return "Search [searchValue=" + searchValue + ", price=" + price + ", category=" + category + ", parking="
				+ parking + "]";
	}

	
}
