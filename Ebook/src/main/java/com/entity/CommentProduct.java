package com.entity;

public class CommentProduct {

	private int id;
	private String name;
	private String email;
	private String date;
	private String content;
	
	public CommentProduct(int id, String name, String email, String date, String content) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.date = date;
		this.content = content;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "CommentProduct [id=" + id + ", name=" + name + ", email=" + email + ", date=" + date + ", content="
				+ content + "]";
	}
	
	
}
