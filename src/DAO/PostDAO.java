package DAO;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.bson.codecs.pojo.annotations.BsonIgnore;
import org.bson.types.ObjectId;

import com.mongodb.BasicDBObject;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;

import model.Model;
import model.Post;
import webfit.Utilities;

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
	public int Count() {
		return (int)POST.estimatedDocumentCount();
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
	@BsonIgnore
	public List<Post> getAllPosts() {
		FindIterable<Post> cursor = POST.find();
		Iterator<Post> it = cursor.iterator();
		List<Post> data = new ArrayList<Post>();
		if (it.hasNext()) {
			while (it.hasNext()) {
				data.add(it.next());
			}
		}
		return data;
	}
	public List<Post> search(String query) {
		query = Utilities.removeAccent(query.toLowerCase());
		FindIterable<Post> cursor = POST.find();
		Iterator<Post> it = cursor.iterator();
		List<Post> data = new ArrayList<Post>();
		if (it.hasNext()) {
			while (it.hasNext()) {
				Post post = it.next();
				
				// Handle data in database
				String tilte = Utilities.removeAccent(post.getTitle().toLowerCase());
				String category = Utilities.removeAccent(post.getCategory().toLowerCase());
				String status = Utilities.removeAccent(post.getStatus().toLowerCase());
				
				if (tilte.indexOf(query) != -1
						|| category.indexOf(query) != -1
						|| String.valueOf(post.getViews_count()).indexOf(query) != -1
						|| String.valueOf(post.getPoints()).indexOf(query) != -1
						|| status.indexOf(query) != -1) {
					data.add(post);
				}
				
			}
		}
		return data;
	}
	
	public void Delete(ObjectId postId) {
		POST.deleteOne(Filters.eq("_id", postId));
	}
	public Post GetPostByID(ObjectId id) {
		return POST.find(Filters.eq("_id", id)).first();
	}

	public List<Post> getPostOfUser(int idUser) {
		List<Post> lPost = new ArrayList<Post>();
		FindIterable<Post> listPost = POST.find(Filters.eq("author_id", idUser));
		Iterator<Post> list = listPost.iterator();
		while (list.hasNext()) {
			lPost.add(list.next());
		}

		return lPost;
	}
	
	
	// Duyệt bài post
	public boolean acceptPost(ObjectId postId) {
		try {
//			POST.updateOne(Filters.eq("_id", postId), new Document("$set", new Document("status", "Đã duyệt")));
			POST.updateOne(Filters.eq("_id", postId), 
					Updates.combine(Updates.set("status", "Đã duyệt"), Updates.set("is_public", true)));
			System.out.println("Accepted post!");
			return true;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return false;
		}
	}
	
	public Post GetPost(String p) {
		Post post = POST.findOneAndUpdate(Filters.eq("url", p), Updates.inc("views_count", 1));
		return post;
	}
	
	public ArrayList<Post> GetLastestPost(int skip, int lim)
	{
		FindIterable<Post> cursor = POST.find(Filters.eq("is_public", true))
										.sort(new BasicDBObject("_id", -1))
										.skip(skip).limit(lim);
		Iterator<Post> it = cursor.iterator();
		ArrayList<Post> topPost = new ArrayList<Post>();
		if (it.hasNext()) {
			while (it.hasNext()) {
				topPost.add(it.next());
			}
		}
		return topPost;
	}

	
	public List<Post> GetAllPostByAccountID(ObjectId account_id) {
		FindIterable<Post> cursor = POST.find(new BasicDBObject("author_id", account_id));
		Iterator<Post> it = cursor.iterator();
		List<Post> lstPost = new ArrayList<Post>();
		if (it.hasNext()) {
			while (it.hasNext()) {
				lstPost.add(it.next());
			}
		}
		//System.out.print(lstPost.size());
		return lstPost;
	}

	public String Update(String p, String title, String new_title, String content, 
			boolean is_public, String thumbnail_url, String category) {
		
		String newURL = p;
		if (!new_title.equals(title))
			newURL = Utilities.createURL(title);
		POST.updateOne(Filters.eq("url", p),
				Updates.combine(Updates.set("url", newURL), 
						Updates.set("title", new_title), 
						Updates.set("content", content),
						Updates.set("category", category), 
						Updates.set("is_public", is_public),
						Updates.set("updated_at", Utilities.GetCurrentDateTime()),
						Updates.set("thumbnail_url", thumbnail_url)));
		return newURL;
		
	}
}
