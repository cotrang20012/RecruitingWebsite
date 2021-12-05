package DAO;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.bson.types.ObjectId;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;

import model.Account;
import model.Apply;
import model.Model;
import model.Post;

public class ApplyDAO extends Model {
	private MongoCollection<Apply> APPLY;
	private MongoClient mongoClient;
	public ApplyDAO(MongoClient mongo) {
		mongoClient=mongo;
		APPLY = mongo.getDatabase("Webfit").getCollection("APPLY", Apply.class);
	}
	public void Insert(Apply apply) {
		APPLY.insertOne(apply);
	}
	public void Delete(ObjectId _id) {
		APPLY.deleteOne(Filters.eq("_id", _id));
	}
	public ArrayList<Apply> GetApplyList(ObjectId account_id){
		ArrayList<Apply> lApply = new ArrayList<Apply>();
		FindIterable<Apply> listApply = APPLY.find(Filters.eq("accountId", account_id));
		Iterator<Apply> list = listApply.iterator();
		while (list.hasNext()) {
			lApply.add(list.next());
		}
		return lApply;
	}
	public void DeleteAllApplyWithAccID(ObjectId account_id) {
		APPLY.deleteMany(Filters.eq("accountId", account_id));
	}
	
	public void DeleteAllApplyWithPostID(ObjectId postID) {
		APPLY.deleteMany(Filters.eq("_id", postID));
	}
	
}
