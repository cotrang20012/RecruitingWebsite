package model;


import java.util.Date;

import org.bson.types.ObjectId;

import webfit.Utilities;

public class Post {
//	private ObjectId author_id;
	private String url;
	private int apply = 0;
	private String thumbnail_url;
	private String status;
	private ObjectId _id;
	private ObjectId accountId;
	private String title = "";
	private String content;
	private String phone;
	private String position;
	private String skill;
	private String email;
	private String location;
	private String luong;
	private String quantity;
	private String Exp;
	private Date dateStart = new Date();
	private Date dateEnd = new Date();


	public String getLuong() {
		return luong;
	}

	public void setLuong(String luong) {
		this.luong = luong;
	}
	public int getApply() {
		return apply;
	}

	public void setApply(int apply) {
		this.apply = apply;
	}
	
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

	
	public ObjectId getId() {
		return _id;
	}

	public void setId(ObjectId _id) {
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

	}

	public String description() {
		if (this.content.length() < 100) {
			return this.content;
		}
		return this.content.substring(0, 100) + "...";
	}

	public void TestCreate() {
		this.setId(new ObjectId());
		title = "Tuyển dụng lập trình viên Java";
		content = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum";
		dateEnd = new Date(2021, 12, 03, 12, 0, 0);
	}

	public String time() {
		String time = "";
		Date nowDate = new Date();
		long diff = nowDate.getTime() - dateStart.getTime();
		long sec = diff / 1000;
		long min = sec / 60;
		if (min < 60)
			return String.valueOf(min) + " phút trước";
		long hours = min / 60;
		if (hours < 24)
			return String.valueOf(hours) + " giờ trước";
		long days = hours / 24;
		return String.valueOf(days) + " ngày trước";
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

	public Post(String title, ObjectId author_id, String content, boolean is_public, String thumbnail_url,
			String category) {
		this._id = new ObjectId();
		this.title = title;
		this.accountId = author_id;
		this.url = Utilities.createURL(title);
		this.content = content;
		this.dateStart = new Date();
		this.apply = 0;
		this.thumbnail_url = thumbnail_url;
		this.status = "Đang tuyển";
	}

	public String ContentHTML() {
		return this.content.replace("\n", "<br>");
	}

}
