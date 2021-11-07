package DAO;

import javax.servlet.http.Cookie;

import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;

import model.Account;
import model.Confirm;
import model.Model;
import model.UserEmployer;

public class AccountDAO extends Model{
	
	private MongoCollection<Account> ACCOUNT;
	private MongoClient mongoClient;
	
	public AccountDAO() {
		
	}
	
	public AccountDAO(MongoClient mongo) {
		mongoClient=mongo;
		ACCOUNT = mongo.getDatabase("Webfit").getCollection("ACCOUNT", Account.class);
	}

	public boolean isLogged(Cookie[] cookies)
	{
		if (cookies == null)
			return false;
		String UUID = "";
		
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("UUID"))
				UUID = cookie.getValue();
		}
		ConfirmDAO confirmDAO=new ConfirmDAO(mongoClient);
		Confirm confirm=confirmDAO.getConfirmFromUUID(UUID);
		if(confirm!=null)
			return true;	
		return false;
	}
	
	public ObjectId getAccountIdFromCookie(Cookie[] cookies) {
		if(cookies==null)
			return null;
		String UUID="";
		for (Cookie cookie : cookies) {
			if(cookie.getName().equals("UUID"))
				UUID=cookie.getValue();
		}
		if(UUID.equals(""))
			return null;
		ConfirmDAO confirmDAO=new ConfirmDAO(mongoClient);
		Confirm confirm=confirmDAO.getConfirmFromUUID(UUID);
		if(confirm!=null)
			return confirm.getAccountId();
		return null;
	}
	
	public ObjectId getAccountIdFromUsername(String username) {		
		Account acc=ACCOUNT.find(Filters.eq("username", username)).first();
		if(acc!=null)
			return acc.getId();
		return null;
	}
	
	public Account getAccountFromUsername(String username) {		
		Account acc=ACCOUNT.find(Filters.eq("username", username)).first();
		if(acc!=null)
			return acc;
		return null;
	}
	
	public Account getAccountFromAccountId(ObjectId accountId) {
		Account acc=ACCOUNT.find(Filters.eq("_id",accountId)).first();
		return acc;
	}
	
	public boolean isEmployer(Cookie[] cookies) {
		if(cookies==null)
			return false;
		ObjectId accountId= getAccountIdFromCookie(cookies);
		Account account= getAccountFromAccountId(accountId);
		
		
		if(account!=null)
			if(account.getTypeUser().equals("EMPLOYER"))
				return true;
		return false;
	}
	
	public void Insert(Account acc) {
		ACCOUNT.insertOne(acc);
	}
	
	public void ChangePassword(String username,String password) {
		ACCOUNT.updateOne(Filters.eq("username",username), Updates.set("password", password));
	}
	
	
}
