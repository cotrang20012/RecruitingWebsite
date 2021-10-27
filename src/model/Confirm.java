package model;


import java.util.Iterator;
import javax.servlet.http.Cookie;
import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.BasicDBObject;
import com.mongodb.client.FindIterable;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;
public class Confirm extends Model {
	private ObjectId id;
	private ObjectId accountId;
	private String uuid;
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public ObjectId getId() {
		return id;
	}
	public void setId(ObjectId id) {
		this.id = id;
	}
	public ObjectId getAccountId() {
		return accountId;
	}
	public void setAccountId(ObjectId accountId) {
		this.accountId = accountId;
	}
	
	public Confirm() {
		
	}
	
	public Confirm(ObjectId accountid, String uuid) {
		this.id=new ObjectId();
		this.accountId=accountid;
		this.uuid=uuid;
	}
	
	
}
