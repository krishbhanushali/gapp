package gapp.model;

import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="applications")
public class Applications {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="application_id")
	private int applicationID;
	
	@ManyToOne
	@JoinColumn(name="application_student_id")
	Students student;
	
	@ManyToOne
	@JoinColumn(name="application_term_id")
	Terms term;
	
	@ManyToOne
	@JoinColumn(name="application_program_id")
	Programs program;
	
	@OneToOne
	@JoinColumn(name="application_status")
	ApplicationStatus status;
	
	@Column(name="time_changed")
	private java.util.Date timeChanged;
	
	@Column(name="comments_if_any")
	private String commentsIfAny;

	public int getApplicationID() {
		return applicationID;
	}

	public void setApplicationID(int applicationID) {
		this.applicationID = applicationID;
	}

	public Students getStudent() {
		return student;
	}

	public void setStudent(Students student) {
		this.student = student;
	}

	public Terms getTerm() {
		return term;
	}

	public void setTerm(Terms term) {
		this.term = term;
	}

	public Programs getProgram() {
		return program;
	}

	public void setProgram(Programs program) {
		this.program = program;
	}

	public ApplicationStatus getStatus() {
		return status;
	}

	public void setStatus(ApplicationStatus status) {
		this.status = status;
	}

	public java.util.Date getTimeChanged() {
		return timeChanged;
	}

	public void setTimeChanged(java.util.Date timeChanged) {
		this.timeChanged = timeChanged;
	}

	public String getCommentsIfAny() {
		return commentsIfAny;
	}

	public void setCommentsIfAny(String commentsIfAny) {
		this.commentsIfAny = commentsIfAny;
	}
	
	
}
