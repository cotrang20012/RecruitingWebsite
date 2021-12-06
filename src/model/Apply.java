package model;


import java.util.Date;

import org.bson.types.ObjectId;

public class Apply extends Model {
	private ObjectId _id;
	private ObjectId accountId;
	private ObjectId postId;
	private String date;
	
	public Apply() {
	}
	
	public Apply(ObjectId id, ObjectId account_id,ObjectId post_id,String date) {
		this._id = id;
		this.accountId = account_id;
		this.postId = post_id;
		this.date = date;
	}
	
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
	
	public ObjectId getId() {
		return _id;
	}
	
	public ObjectId getAccountId() {
		return accountId;
	}
	
	public void setAccountId(ObjectId accountId) {
		this.accountId = accountId;
	}
	
	public void setId(ObjectId _id) {
		this._id = _id;
	}
	
	public ObjectId getPostId() {
		return postId;
	}
	public void setPostId(ObjectId post_id) {
		this.postId = post_id;
	}
	
	public String HexStringId() {
		return this._id.toHexString();
	}
	
}
