package com.Entity;

import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="User")
public class RegisterUser 
{
	@Id
	private int user_id = new Random().nextInt(10000);
	
	@Column(length=50)
	private String name;
	
	@Column(length=50)
	private String password;
	
	@Column(length=50)
	private String contact;
	
	@Column(length=50)
	private String image;
	
	@Column(nullable =false ,unique = true,length=50)
	private String email;
	
	@Column(name="date_of_birth")
	private Date dob;
	
	private Date joindate;
	
	

	public RegisterUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RegisterUser(int user_id, String name, String email, String password, String contact,String image, Date dob,
			Date joindate) {
		super();
		this.user_id = user_id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.contact = contact;
		this.dob = dob;
		this.joindate = joindate;
		this.image = image;
	
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	


	
}
