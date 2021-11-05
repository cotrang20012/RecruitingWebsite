package model;
import java.util.Date;
import java.util.Iterator;
import javax.servlet.http.Cookie;
import org.bson.Document;
import org.bson.types.ObjectId;

public class UserEmployee extends Model{
	
	protected ObjectId _id;
	protected ObjectId accountID;
	protected String fullName;
	protected String phone;
	protected String address;
	protected Date birthday;
	protected String email;
	
	public UserEmployee() {
		
	}
	public ObjectId get_id() {
		return _id;
	}
	public void set_id(ObjectId _id) {
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
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
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
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
	public UserEmployee(ObjectId accountID, String fullName, String phone, String address,Date birthDate ) {
		this._id=new ObjectId();
		this.accountID=accountID;
		this.fullName=fullName;
		this.phone=phone;
		this.address=address;
		this.birthday=birthDate;
	}
	
	
}
