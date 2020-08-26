package com.Entity;

import java.util.Date;
import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.sun.istack.NotNull;

@Entity
@Table(name="Admin", uniqueConstraints =  @UniqueConstraint (name="admin_uk", columnNames={"email"}))
public class AdminEntity 
{
	@Id
	@Column(name="id")
	private int adminId=new Random().nextInt(1000);
	
	@Column(name="email",length = 50,unique = true ,nullable = false)
	private String adminEmail;
	
	@Column(name="name",length = 50)
	private String  adminName;
	
	@Column(name="password" ,length = 50)
	private String adminPassword;
	
	@Column(name="phone", length = 50)
	private String adminPhone;
	
	@Column(name="Dob")
	private Date adminDob;
	
	public AdminEntity() 
	{
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminEntity(int adminId,String adminName, String adminEmail, String adminPassword, String adminPhone, Date adminDob) {
		super();
		this.adminId = adminId;
		this.adminName=adminName;
		this.adminEmail = adminEmail;
		this.adminPassword = adminPassword;
		this.adminPhone = adminPhone;
		this.adminDob = adminDob;
	}
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public String getadminEmail() {
		return adminEmail;
	}
	public void setadminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	public String getAdminPhone() {
		return adminPhone;
	}
	public void setAdminPhone(String adminPhone) {
		this.adminPhone = adminPhone;
	}
	public Date getAdminDob() {
		return adminDob;
	}
	public void setAdminDob(Date adminDob) {
		this.adminDob = adminDob;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	
	

}
