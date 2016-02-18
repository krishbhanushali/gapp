package gapp.model;

import javax.persistence.*;

@Entity
@Table(name="additional_fields_values")
public class AdditionalFieldsValues {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="additional_fields_values_id")
	private int additionalFieldsValuesId;
	
	@Column(name="value")
	private String value;
	
	@ManyToOne
	@JoinColumn(name="additional_field_id")
	AdditionalFields additonalFields;
	
	@ManyToOne
	@JoinColumn(name="application_id")
	Applications application;

	public int getAdditionalFieldsValuesId() {
		return additionalFieldsValuesId;
	}

	public void setAdditionalFieldsValuesId(int additionalFieldsValuesId) {
		this.additionalFieldsValuesId = additionalFieldsValuesId;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Applications getApplication() {
		return application;
	}

	public void setApplication(Applications application) {
		this.application = application;
	}

	public AdditionalFields getAdditonalFields() {
		return additonalFields;
	}

	public void setAdditonalFields(AdditionalFields additonalFields) {
		this.additonalFields = additonalFields;
	}
	
	
}
