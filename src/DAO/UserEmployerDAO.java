package DAO;

import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;

import model.UserEmployee;
import model.UserEmployer;

public class UserEmployerDAO {
private MongoCollection<UserEmployer> USEREMPLOYER;
	
	public UserEmployerDAO(MongoClient mongo) {
		USEREMPLOYER =mongo.getDatabase("Webfit").getCollection("USEREMPLOYER",UserEmployer.class);
	}
	
	public void Insert(UserEmployer user) {
		USEREMPLOYER.insertOne(user);
	}
	public UserEmployer findEmployerWithID(ObjectId id) {
		return USEREMPLOYER.find(Filters.eq("accountID", id)).first();
	}
}
