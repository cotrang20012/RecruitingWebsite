package model;

import org.bson.types.ObjectId;

public class User {
	protected ObjectId _id;
	protected ObjectId accountID;
	
	public ObjectId getId() {
		return _id;
	}
	public void setId(ObjectId _id) {
		this._id = _id;
	}

	public ObjectId getAccountID() {
		return accountID;
	}
	public void setAccountID(ObjectId accountID) {
		this.accountID = accountID;
	}	
}
