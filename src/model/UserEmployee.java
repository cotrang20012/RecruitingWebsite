package model;
import java.util.Date;
import java.util.Iterator;
import javax.servlet.http.Cookie;
import org.bson.Document;
import org.bson.types.ObjectId;

public class UserEmployee extends Model {
	
	protected ObjectId accountID;
	protected String fullName;
	protected String phone;
	protected String address;
	protected Date birthday;
	public UserEmployee() {
		
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
}
