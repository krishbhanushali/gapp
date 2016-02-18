package gapp.model;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.*;

@Entity
@Table(name="departments")
public class Department {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="dept_id")
	private int departmentID;
	
	@Basic
	@Column(name="dept_name")
	private String departmentName;
	
	@ManyToMany(mappedBy="departments")
	private Collection<AdditionalFields> additionalFields = new ArrayList<AdditionalFields>();
	
	public Department(){};
	public Department(int departmentID, String departmentName) {
		super();
		this.departmentID = departmentID;
		this.departmentName = departmentName;
	}

	public int getDepartmentID() {
		return departmentID;
	}

	public void setDepartmentID(int departmentID) {
		this.departmentID = departmentID;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public Collection<AdditionalFields> getAdditionalFields() {
		return additionalFields;
	}

	public void setAdditionalFields(Collection<AdditionalFields> additionalFields) {
		this.additionalFields = additionalFields;
	}
	
}
