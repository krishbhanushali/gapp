package gapp.model;
import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.*;

@Entity
@Table(name="additional_fields")
public class AdditionalFields{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="additional_field_id")
	private int additionalFieldID;
	private String name;
	private String type;
	private boolean required;
	
	@ManyToMany
	@JoinTable(name="additional_fields_departments",
				joinColumns=@JoinColumn(name="additional_field_id"),
				inverseJoinColumns=@JoinColumn(name="department_id"))
	private Collection<Department> departments = new ArrayList<Department>();
	public int getAdditionalFieldID() {
		return additionalFieldID;
	}

	public void setAdditionalFieldID(int additionalFieldID) {
		this.additionalFieldID = additionalFieldID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public boolean isRequired() {
		return required;
	}

	public void setRequired(boolean required) {
		this.required = required;
	}

	public Collection<Department> getDepartments() {
		return departments;
	}

	public void setDept(Collection<Department> departments) {
		this.departments = departments;
	}
	
	
}
