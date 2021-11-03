package DAO;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;

import model.Model;
import model.Post;

public class PostDAO extends Model {
	private MongoCollection<Post> POST;
	private MongoClient mongoClient;
	
	public PostDAO() {
		
	}
	
	public PostDAO(MongoClient mongo) {
		mongoClient=mongo;
		POST = mongo.getDatabase("Webfit").getCollection("POST", Post.class);
	}
	
	public void Insert(Post post) {
		POST.insertOne(post);
	}

}
