package gapp.model;

import javax.persistence.*;

@Entity
@Table(name="programs")
public class Programs {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="program_id")
	private int programID;
	
	@Column(name="program_name")
	private String programName;
	
	@ManyToOne
	@JoinColumn(name="program_dept_id")
	private Department dept;

	public int getProgramID() {
		return programID;
	}

	public void setProgramID(int programID) {
		this.programID = programID;
	}

	public String getProgramName() {
		return programName;
	}

	public void setProgramName(String programName) {
		this.programName = programName;
	}

	public Department getDept() {
		return dept;
	}

	public void setDept(Department dept) {
		this.dept = dept;
	}

	
}
