package gapp.model;

import java.util.Date;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="education_college")
public class EducationalCollege {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="education_college_id")
	private int educationCollegeId;
	
	@Column(name="education_college_name")
	private String educationCollegeName;
	
	
	@Column(name="education_college_degree_start_date")
	@DateTimeFormat(pattern="yyyy-dd-MM")
	private java.util.Date educationCollgeDegreeStartDate;
	
	
	@Column(name="education_college_degree_end_date")
	@DateTimeFormat(pattern="yyyy-dd-MM")
	private java.util.Date educationCollegeDegreeEndDate;
	
	@Column(name="education_degree_earned")
	private String educationDegreeEarned;
	
	@Column(name="education_field_of_the_degree")
	private String educationFieldOfTheDegree;
	
	//@Column(name="education_student_id")
	@ManyToOne
	@JoinColumn(name="education_student_id")
	private Students student;

	public EducationalCollege(){};
	public EducationalCollege(int educationCollegeId, String educationCollegeName, Date educationCollgeDegreeStartDate,
			Date educationCollegeDegreeEndDate, String educationDegreeEarned, String educationFieldOfTheDegree,
			Students student) {
		super();
		this.educationCollegeId = educationCollegeId;
		this.educationCollegeName = educationCollegeName;
		this.educationCollgeDegreeStartDate = educationCollgeDegreeStartDate;
		this.educationCollegeDegreeEndDate = educationCollegeDegreeEndDate;
		this.educationDegreeEarned = educationDegreeEarned;
		this.educationFieldOfTheDegree = educationFieldOfTheDegree;
		this.student = student;
	}

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

	public String getEducationCollegeName() {
		return educationCollegeName;
	}

	public void setEducationCollegeName(String educationCollegeName) {
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
