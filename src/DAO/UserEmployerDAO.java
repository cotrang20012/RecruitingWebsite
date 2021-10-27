package DAO;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;


import model.UserEmployer;

public class UserEmployerDAO {
private MongoCollection<UserEmployer> USEREMPLOYER;
	
	public UserEmployerDAO(MongoClient mongo) {
		USEREMPLOYER =mongo.getDatabase("Webfit").getCollection("USEREMPLOYER",UserEmployer.class);
	}
	
	public void Insert(UserEmployer user) {
		USEREMPLOYER.insertOne(user);
	}
}
