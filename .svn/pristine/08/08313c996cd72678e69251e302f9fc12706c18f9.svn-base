package gapp.model;

import javax.persistence.*;

@Entity
@Table(name="academic_records")
public class AcademicRecord {
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Id
	@Column(name="academic_record_id")
	private int academicRecord;
	
	@Column(name="toefl_score")
	private int toeflScore;
	
	@Column(name="gre_score")
	private int greScore;
	
	private double gpa;
	private String transcript;
	
	@OneToOne
	@JoinColumn(name="academic_record_student_id")
	private Students student;

	public int getAcademicRecord() {
		return academicRecord;
	}

	public void setAcademicRecord(int academicRecord) {
		this.academicRecord = academicRecord;
	}

	public int getToeflScore() {
		return toeflScore;
	}

	public void setToeflScore(int toeflScore) {
		this.toeflScore = toeflScore;
	}

	public int getGreScore() {
		return greScore;
	}

	public void setGreScore(int greScore) {
		this.greScore = greScore;
	}

	public double getGpa() {
		return gpa;
	}

	public void setGpa(double gpa) {
		this.gpa = gpa;
	}

	public String getTranscript() {
		return transcript;
	}

	public void setTranscript(String transcript) {
		this.transcript = transcript;
	}

	public Students getStudent() {
		return student;
	}

	public void setStudent(Students student) {
		this.student = student;
	}
	
	
}
