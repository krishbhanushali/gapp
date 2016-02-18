package gapp.model;

import javax.persistence.*;

@Entity
@Table(name="terms")
public class Terms {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="term_id")
	private int termID;
	
	@Column(name="term_name")
	private String termName;

	public int getTermID() {
		return termID;
	}

	public void setTermID(int termID) {
		this.termID = termID;
	}

	public String getTermName() {
		return termName;
	}

	public void setTermName(String termName) {
		this.termName = termName;
	}
	
}
