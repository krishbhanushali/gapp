package gapp.model;

import javax.persistence.*;

@Entity
@Table(name="application_status_history")
public class ApplicationStatusHistory {
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Id
	@Column(name="application_status_history_id")
	int applicationStatusHistoryId;
	
	@Column(name="time_changed")
	private java.util.Date timeChanged;
	
	@Column(name="comments_if_any")
	private String commentsIfAny;
	
	@ManyToOne
	@JoinColumn(name="application_id")
	private Applications application;
	
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

	public int getApplicationStatusHistoryId() {
		return applicationStatusHistoryId;
	}

	public void setApplicationStatusHistoryId(int applicationStatusHistoryId) {
		this.applicationStatusHistoryId = applicationStatusHistoryId;
	}

	public Applications getApplication() {
		return application;
	}

	public void setApplication(Applications application) {
		this.application = application;
	}
	
	
}
