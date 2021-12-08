package DAO;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.bson.codecs.pojo.annotations.BsonIgnore;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import com.mongodb.BasicDBObject;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;

import Util.Utilities;
import model.Apply;
import model.Model;
import model.Post;
import model.UserEmployee;

public class PostDAO {
	private MongoCollection<Post> POST;
	private MongoClient mongoClient;

	public PostDAO(MongoClient mongo) {
		mongoClient = mongo;
		POST = mongo.getDatabase("Webfit").getCollection("POST", Post.class);
	}

	public void Insert(Post post) {
		POST.insertOne(post);
	}

	public int Count() {
		return (int) POST.estimatedDocumentCount();
	}

	public ArrayList<Post> GetListPost(int from, int limit) {
		FindIterable<Post> cursor = POST.find(Filters.eq("status","Đang tuyển")).skip(from).limit(limit);
		Iterator<Post> iterator = cursor.iterator();
		ArrayList<Post> posts = new ArrayList<Post>();
		while (iterator.hasNext()) {
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

	public ArrayList<Post> search(String query) {
		query = Utilities.removeAccent(query.toLowerCase());
		FindIterable<Post> cursor = POST.find();
		Iterator<Post> it = cursor.iterator();
		ArrayList<Post> data = new ArrayList<Post>();
		if (it.hasNext()) {
			while (it.hasNext()) {
				Post post = it.next();

				// Handle data in database
				String tilte = Utilities.removeAccent(post.getTitle().toLowerCase());
				String skill = Utilities.removeAccent(post.getSkill().toLowerCase());
				if (post.getStatus().equals("Đang tuyển"))
					if (tilte.indexOf(query) != -1 || skill.indexOf(query) != -1) {
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

	public Post GetPostByURL(String url) {
		return POST.find(Filters.eq("url", url)).first();
	}

	public ArrayList<Post> getPostOfUser(ObjectId id) {
		ArrayList<Post> lPost = new ArrayList<Post>();
		FindIterable<Post> listPost = POST.find(Filters.eq("accountId", id));
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

	public ArrayList<Post> GetLastestPost(int skip, int lim) {
		FindIterable<Post> cursor = POST.find(Filters.eq("is_public", true)).sort(new BasicDBObject("_id", -1))
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

	public ArrayList<Post> GetPostListWithAccID(ObjectId accountID) {
		ArrayList<Post> lPost = new ArrayList<Post>();
		FindIterable<Post> listPost = POST.find(Filters.eq("accountId", accountID));
		Iterator<Post> list = listPost.iterator();
		while (list.hasNext()) {
			lPost.add(list.next());
		}
		return lPost;
	}

	public void updatePostStatusAct(ObjectId postId) {
		POST.updateOne(Filters.eq("_id", postId), Updates.set("status", "Đang tuyển"));

	}

	public void updatePostStatusDeAct(ObjectId postId) {
		POST.updateOne(Filters.eq("_id", postId), Updates.set("status", "Dừng tuyển"));
	}

	public boolean updatePostAddApply(ObjectId postId) {
		Post post = POST.find(Filters.eq("_id", postId)).first();
		post.setApply(post.getApply() + 1);
		return POST.updateOne(Filters.eq("_id", postId), Updates.set("apply", post.getApply())).getModifiedCount() > 0
				? true
				: false;
	}

	public boolean updatePostSubApply(ObjectId postId) {
		Post post = POST.find(Filters.eq("_id", postId)).first();
		post.setApply(post.getApply() - 1);
		return POST.updateOne(Filters.eq("_id", postId), Updates.set("apply", post.getApply())).getModifiedCount() > 0
				? true
				: false;
	}

	public void DeleteAllPostWithAccID(ObjectId accountID) {
		POST.deleteMany(Filters.eq("accountId", accountID));
	}

	public void UpdatePost(Post post) {
		Bson update1 = Updates.set("title", post.getTitle());
		Bson update2 = Updates.set("url", post.getUrl());
		Bson update3 = Updates.set("content", post.getContent());
		Bson update4 = Updates.set("location", post.getLocation());
		Bson update5 = Updates.set("position", post.getPosition());
		Bson update6 = Updates.set("skill", post.getSkill());
		Bson update7 = Updates.set("phone", post.getPhone());
		Bson update8 = Updates.set("email", post.getEmail());
		Bson update9 = Updates.set("thumbnail_url", post.getThumbnail_url());
		Bson update10 = Updates.set("exp", post.getExp());
		Bson update11 = Updates.set("luong", post.getLuong());
		Bson update12 = Updates.set("dateEnd", post.getDateEnd());
		Bson update13 = Updates.set("quantity", post.getQuantity());
		Bson update14 = Updates.set("accountId", post.getAccountId());

		POST.updateOne(Filters.eq("_id", post.getId()), Updates.combine(update1, update2, update3, update4, update5,
				update6, update7, update8, update9, update10, update11, update12, update13, update14));
	}

}
