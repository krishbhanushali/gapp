package gapp.model;

import javax.persistence.*;

@Entity
@Table(name="students")
public class Students {
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Id

	@Column(name="student_id")
	private int studentID;
	
	@Column(name="cin")
	private String CIN;
	
	private String phone;
	private String email;
	private java.util.Date dob;
	private String citizenship;
	
	@OneToOne
	User user;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getStudentID() {
		return studentID;
	}
	public void setStudentID(int studentID) {
		this.studentID = studentID;
	}
	public String getCIN() {
		return CIN;
	}
	public void setCIN(String cIN) {
		CIN = cIN;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public java.util.Date getDob() {
		return dob;
	}
	public void setDob(java.util.Date dob) {
		this.dob = dob;
	}
	public String getCitizenship() {
		return citizenship;
	}
	public void setCitizenship(String citizenship) {
		this.citizenship = citizenship;
	}
	
}
