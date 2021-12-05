package model;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import org.bson.Document;
import org.bson.codecs.pojo.annotations.BsonIgnore;
import org.bson.types.ObjectId;
//import org.eclipse.persistence.nosql.annotations.Field;

import com.mongodb.BasicDBObject;
import com.mongodb.client.FindIterable;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;

import java.util.Date;

import org.bson.types.ObjectId;

import webfit.Utilities;


public class Post extends Model{
//	private ObjectId author_id;
	private String url;
	private String published_at;
	private String updated_at;
	private int views_count;
	private int points;
	private boolean is_public;
	private String thumbnail_url;
	private String status;
	private ObjectId _id;
	private ObjectId accountId;
	private String title="";
	private String content;
	private String phone;
	private String position;
	private String skill;
	private String email;
	private String location;
	private String quantity;
	private String Exp;
	public String getExp() {
		return Exp;
	}
	public void setExp(String exp) {
		Exp = exp;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	private Date dateStart=new Date();
	private Date dateEnd =new Date();
	
	public ObjectId getid() {
		return _id;
	}
	public void setid(ObjectId _id) {
		this._id = _id;
	}

	public ObjectId getAccountId() {
		return accountId;
	}
	public void setAccountId(ObjectId accountId) {
		this.accountId = accountId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDateStart() {
		return dateStart;
	}
	public void setDateStart(Date dateStart) {
		this.dateStart = dateStart;
	}
	public Date getDateEnd() {
		return dateEnd;
	}
	public void setDateEnd(Date dateEnd) {
		this.dateEnd = dateEnd;
	}

	
	
	public Post() {
		this.setid(new ObjectId());
	}
	public String description() {
		if(this.content.length()<100) {
			return this.content;
		}
		return this.content.substring(0, 100)+"...";
	}
	
	public void TestCreate() {
		this.setid(new ObjectId());
		title="Tuyển dụng lập trình viên Java";
		content="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum";
		dateEnd= new Date(2021, 12, 03, 12, 0, 0);
	}
	
	public String time() {
		String time="";
		Date nowDate=new Date();
		long diff = nowDate.getTime() - dateStart.getTime(); 
		long sec=diff/1000;
		long min=sec/60;
		if(min<60)
			return String.valueOf(min)+" phút trước";
		long hours=min/60;
		if(hours<24)
			return String.valueOf(hours)+" giờ trước";
		long days=hours/24;
		return String.valueOf(days)+" ngày trước";
	}
	

//	public ObjectId getAuthor_id() {
//		return author_id;
//	}
//
//	public void setAuthor_id(ObjectId author_id) {
//		this.author_id = author_id;
//	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}


	public String getPublished_at() {
		return published_at;
	}
	public void setPublished_at(String published_at) {
		this.published_at = published_at;
	}

	public String getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}

	public int getViews_count() {
		return views_count;
	}
	public void setViews_count(int views_count) {
		this.views_count = views_count;
	}

	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
	}
	public boolean getIs_public() {
		return is_public;
	}
	public void setIs_public(boolean is_public) {
		this.is_public = is_public;
	}

	public String getThumbnail_url() {
		if (thumbnail_url == null || thumbnail_url.equals(""))
			return "thumbnail.jpg";
		return thumbnail_url;
	}
	public void setThumbnail_url(String thumbnail_url) {
		this.thumbnail_url = thumbnail_url;
	}

	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getShortContent()
	{
		if(this.getContent().length() < 150)
			return this.getContent();
		return (this.getContent().substring(0, 150) + "...");
		
	}
	public Post(String title, ObjectId author_id, String content, boolean is_public, String thumbnail_url, String category) 
	{
		this._id = new ObjectId();
		this.title = title;
		//this.author_id = author_id;
		this.url = Utilities.createURL(title);
		this.content = content;
		this.published_at = this.updated_at = Utilities.GetCurrentDateTime();
		this.views_count = 0;
		this.points = 0;
		this.is_public = is_public;
		this.thumbnail_url = thumbnail_url;
		this.status = "Chờ duyệt";
	}
	


}
