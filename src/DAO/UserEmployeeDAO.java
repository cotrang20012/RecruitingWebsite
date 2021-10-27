package DAO;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;


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
}
