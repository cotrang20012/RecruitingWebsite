package DAO;

import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;

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
	
	public void UpdateUserEmployer(UserEmployer user) {
		Bson update1 = Updates.set("companyName", user.getCompanyName());
		Bson update2 = Updates.set("phone", user.getPhone());
		Bson update3 = Updates.set("address", user.getAddress());
		Bson update4 = Updates.set("email", user.getEmail());
		Bson update5 = Updates.set("website", user.getWebsite());
		Bson update6 = Updates.set("quymo", user.getQuymo());
		Bson update7 = Updates.set("nganhnghe", user.getNganhnghe());
		Bson update8 = Updates.set("techstack", user.getTechstack());
				
		USEREMPLOYER.updateOne(Filters.eq("_id",user.getId()),Updates.combine(update1, update2, update3, update4, update5, update6, update7, update8));
	}
	
	public void UpdateUserEmployerUrl(UserEmployer user) {
		Bson update1 = Updates.set("profile_url", user.getProfile_url());
						
		USEREMPLOYER.updateOne(Filters.eq("_id",user.getId()),Updates.combine(update1));
	}
	
}
