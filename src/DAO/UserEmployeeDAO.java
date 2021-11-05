package DAO;

import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;

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
	
	public void UpdateUserEmployer(UserEmployee user) {
		Bson update1 = Updates.set("fullname", user.getFullName());
		Bson update2 = Updates.set("phone", user.getPhone());
		Bson update3 = Updates.set("address", user.getAddress());
		Bson update4 = Updates.set("email", user.getEmail());
		Bson update5 = Updates.set("birthday", user.getBirthday());
		
				
		USEREMPLOYEE.updateOne(Filters.eq("_id",user.get_id()),Updates.combine(update1, update2, update3, update4, update5));
	}
}
