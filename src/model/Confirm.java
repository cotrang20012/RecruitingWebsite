package model;

import org.bson.types.ObjectId;
public class Confirm{
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
