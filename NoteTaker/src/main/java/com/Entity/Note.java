package com.Entity;

import java.util.Date;
import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Note 
{
	@Id
	private int note_id =new Random().nextInt(10000);
	
	private String title,type;
	
	@Column(length = 1000)
	private String content;
	private Date date;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private RegisterUser user_id;
	
	public Note() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Note(int note_id, String title,String type, String content, Date date, RegisterUser user_id) {
		super();
		
		this.note_id = note_id;
		this.title = title;
		this.type=type;
		this.content = content;
		this.date = date;
		this.user_id = user_id;
	}

	public int getNote_id() {
		return note_id;
	}

	public void setNote_id(int note_id) {
		this.note_id = note_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public RegisterUser getUser_id() {
		return user_id;
	}

	public void setUser_id(RegisterUser user_id) {
		this.user_id = user_id;
	}

	
		
	

}
