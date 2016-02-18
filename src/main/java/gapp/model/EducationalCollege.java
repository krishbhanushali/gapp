package gapp.model;

import javax.persistence.*;

@Entity
@Table(name="education_college")
public class EducationalCollege {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="education_college_id")
	private int educationCollegeId;
	
	@Column(name="education_college_name")
	private int educationCollegeName;
	
	@Column(name="education_college_degree_start_date")
	private java.util.Date educationCollgeDegreeStartDate;
	
	@Column(name="education_college_degree_end_date")
	private java.util.Date educationCollegeDegreeEndDate;
	
	@Column(name="education_degree_earned")
	private String educationDegreeEarned;
	
	@Column(name="education_field_of_the_degree")
	private String educationFieldOfTheDegree;
	
	//@Column(name="education_student_id")
	@ManyToOne
	@JoinColumn(name="education_student_id")
	private Students student;

	public Students getStudent() {
		return student;
	}

	public void setStudent(Students student) {
		this.student = student;
	}

	public int getEducationCollegeId() {
		return educationCollegeId;
	}

	public void setEducationCollegeId(int educationCollegeId) {
		this.educationCollegeId = educationCollegeId;
	}

	public int getEducationCollegeName() {
		return educationCollegeName;
	}

	public void setEducationCollegeName(int educationCollegeName) {
		this.educationCollegeName = educationCollegeName;
	}

	public java.util.Date getEducationCollgeDegreeStartDate() {
		return educationCollgeDegreeStartDate;
	}

	public void setEducationCollgeDegreeStartDate(java.util.Date educationCollgeDegreeStartDate) {
		this.educationCollgeDegreeStartDate = educationCollgeDegreeStartDate;
	}

	public java.util.Date getEducationCollegeDegreeEndDate() {
		return educationCollegeDegreeEndDate;
	}

	public void setEducationCollegeDegreeEndDate(java.util.Date educationCollegeDegreeEndDate) {
		this.educationCollegeDegreeEndDate = educationCollegeDegreeEndDate;
	}

	public String getEducationDegreeEarned() {
		return educationDegreeEarned;
	}

	public void setEducationDegreeEarned(String educationDegreeEarned) {
		this.educationDegreeEarned = educationDegreeEarned;
	}

	public String getEducationFieldOfTheDegree() {
		return educationFieldOfTheDegree;
	}

	public void setEducationFieldOfTheDegree(String educationFieldOfTheDegree) {
		this.educationFieldOfTheDegree = educationFieldOfTheDegree;
	}
	
}
