package model;


import java.util.Iterator;
import javax.servlet.http.Cookie;
import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.BasicDBObject;
import com.mongodb.client.FindIterable;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;

public class Account extends Model {
	protected ObjectId _id;
	protected String username;
	protected String password;
	protected String email;
	protected String typeUser;
	public String getTypeUser() {
		return typeUser;
	}
	public void setTypeUser(String typeUser) {
		this.typeUser = typeUser;
	}
	public ObjectId getId() {
		return _id;
	}
	public void setId(ObjectId id) {
		this._id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public Account() {

	}

	public Account(String username, String password, String email,String typeUser) {
		this.setId(new ObjectId());
		this.setUsername(username);
		this.setEmail(email);
		this.setPassword(password);
		this.setTypeUser(typeUser);
	}
	
	public Account(ObjectId id,String username, String password, String email,String typeUser) {
		this.setId(id);
		this.setUsername(username);
		this.setEmail(email);
		this.setPassword(password);
		this.setTypeUser(typeUser);
	}
	
	public static boolean isLogged(Cookie[] cookies)
	{
		if (cookies == null)
			return false;
		String is_logged = "";
		
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("is_logged"))
				is_logged = cookie.getValue();
		}
		if (is_logged.equals("true"))
				return true;
		
		return false;
	}
	
	public static ObjectId getAccountIdFromCookie(Cookie[] cookies) {
		if(cookies==null)
			return null;
		String accountID="";
		for (Cookie cookie : cookies) {
			if(cookie.getName().equals("accountID"))
				accountID=cookie.getValue();
		}
		if(accountID.equals(""))
			return null;
		ObjectId id=new ObjectId(accountID);
		Account account=Model.ACCOUNT.find(Filters.eq("_id", id)).first();
		if(account!=null)
			return account.getId();
		return null;
	}
}
