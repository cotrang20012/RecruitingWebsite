package DAO;

import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;

import model.Confirm;
import model.Model;

public class ConfirmDAO extends Model{
private MongoCollection<Confirm> CONFIRM;
	
	public ConfirmDAO(MongoClient mongo) {
		CONFIRM =mongo.getDatabase("Webfit").getCollection("CONFIRM",Confirm.class);
	}
	
	
	public boolean Update(Confirm confirm) {
		if (confirm.getAccountId()==null)
			return false;
		if (CONFIRM.find(Filters.eq("accountId", confirm.getAccountId())).first() != null)
		{
			CONFIRM.updateOne(Filters.eq("accountId", confirm.getAccountId()), 
					Updates.set("uuid", confirm.getUuid()));
		}
		else
		{
			Insert(confirm);
		}
		return true;
	}
	
	public Confirm getConfirmFromUUID(String UUID) {
		return CONFIRM.find(Filters.eq("uuid", UUID)).first();
	}
	
	public void Insert(Confirm con) {
		CONFIRM.insertOne(con);
	}
	
	
	public void DeleteConfirm(ObjectId accountId) {
		CONFIRM.deleteOne(Filters.eq("accountId",accountId));
	}
}
