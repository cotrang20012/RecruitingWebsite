package DAO;

import java.util.ArrayList;
import java.util.Iterator;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;

import model.Model;
import model.Post;

public class PostDAO extends Model {
	private MongoCollection<Post> POST;
	private MongoClient mongoClient;
	
	public PostDAO(MongoClient mongo) {
		mongoClient=mongo;
		POST = mongo.getDatabase("Webfit").getCollection("POST", Post.class);
	}
	
	public void Insert(Post post) {
		POST.insertOne(post);
	}
	
	public ArrayList<Post> GetListPost(int from, int to){
		FindIterable<Post> cursor=POST.find().skip(from).limit(to);
		Iterator<Post> iterator=cursor.iterator();
		ArrayList<Post> posts=new ArrayList<Post>();
		while(iterator.hasNext()) {
			posts.add(iterator.next());
		}
		return posts;
		
	}

}
