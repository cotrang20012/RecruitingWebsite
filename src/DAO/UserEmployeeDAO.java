package DAO;

import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;

import model.Model;
import model.UserEmployee;
import model.UserEmployer;

public class UserEmployeeDAO extends Model{
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
	
	public void UpdateUserEmployee(UserEmployee user) {
		Bson update1 = Updates.set("fullName", user.getFullName());
		Bson update2 = Updates.set("phone", user.getPhone());
		Bson update3 = Updates.set("address", user.getAddress());
		Bson update4 = Updates.set("email", user.getEmail());
		Bson update5 = Updates.set("birthday", user.getBirthday());
		
				
		USEREMPLOYEE.updateOne(Filters.eq("_id",user.getId()),Updates.combine(update1, update2, update3, update4, update5));
	}
	
	public void UpdateUserEmployeeUrl(UserEmployee user) {
		Bson update1 = Updates.set("profile_url", user.getProfile_url());
						
		USEREMPLOYEE.updateOne(Filters.eq("_id",user.getId()),Updates.combine(update1));
	}
	
}
