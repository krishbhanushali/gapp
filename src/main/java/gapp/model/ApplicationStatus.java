package gapp.model;

import javax.persistence.*;

@Entity
@Table(name="application_status")
public class ApplicationStatus {
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Id
	@Column(name="application_id")
	private int applicationID;
	
	@Column(name="application_status")
	private String application_status_name;
}
