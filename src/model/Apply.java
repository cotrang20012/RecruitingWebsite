package model;


import java.util.Date;

import org.bson.types.ObjectId;

public class Apply extends Model {
	private ObjectId _id;
	private ObjectId account_id;
	private ObjectId post_id;
	private String date;
	public Apply() {
	}
	public Apply(ObjectId id, ObjectId account_id,ObjectId post_id,String date) {
		this._id = id;
		this.account_id = account_id;
		this.post_id = post_id;
		this.date = date;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public ObjectId get_id() {
		return _id;
	}
	public void set_id(ObjectId _id) {
		this._id = _id;
	}
	public ObjectId getAccount_id() {
		return account_id;
	}
	public void setAccount_id(ObjectId account_id) {
		this.account_id = account_id;
	}
	public ObjectId getPost_id() {
		return post_id;
	}
	public void setPost_id(ObjectId post_id) {
		this.post_id = post_id;
	}
	
}
