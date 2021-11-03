package model;

import java.util.Date;

import org.bson.types.ObjectId;

public class Post extends Model{
	private ObjectId _id;
	public ObjectId get_id() {
		return _id;
	}
	public void set_id(ObjectId _id) {
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
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
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

	private ObjectId accountId;
	private String title="";
	private String content;
	private String salary="";
	private Date dateStart=new Date();
	private Date dateEnd =new Date();
	
	public Post() {
		this.set_id(new ObjectId());
	}
	public String description() {
		if(this.content.length()<100) {
			return this.content;
		}
		return this.content.substring(0, 100)+"...";
	}
	
	public void TestCreate() {
		this.set_id(new ObjectId());
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

}
