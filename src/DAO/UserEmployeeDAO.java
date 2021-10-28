package DAO;

import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;

import model.UserEmployee;
import model.UserEmployer;

public class UserEmployeeDAO {
private MongoCollection<UserEmployee> USEREMPLOYEE;
	
	public UserEmployeeDAO(MongoClient mongo) {
		USEREMPLOYEE =mongo.getDatabase("Webfit").getCollection("USEREMPLOYEE",UserEmployee.class);
	}
	public void Insert(UserEmployee user) {
		USEREMPLOYEE.insertOne(user);
	}
	public UserEmployee findEmployeeWithID(ObjectId id) {
		return USEREMPLOYEE.find(Filters.eq("accountID", id)).first();
	}
}
