package model;

import java.util.Date;

import org.bson.types.ObjectId;


public class UserEmployer extends Model{
	protected ObjectId _id;
	protected ObjectId accountID;
	protected String companyName;
	protected String phone;
	protected String address;
	protected String email;
	
	public ObjectId getId() {
		return _id;
	}
	public void setId(ObjectId _id) {
		this._id = _id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public ObjectId getAccountID() {
		return accountID;
	}
	public void setAccountID(ObjectId accountID) {
		this.accountID = accountID;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public UserEmployer() {
		
	}
	public UserEmployer(ObjectId accountID, String companyName, String phone, String address,String email ) {
		this._id=new ObjectId();
		this.accountID=accountID;
		this.companyName=companyName;
		this.phone=phone;
		this.address=address;
		this.email=email;
	}
}
