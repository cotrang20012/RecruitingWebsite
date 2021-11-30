package model;

public class Paging {
	private int value;
	private String name;
	private String state;
	public Paging(String name,int value,String state) {
		this.name = name;
		this.value = value;
		this.state = state;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
