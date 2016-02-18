package gapp.model.dao;

import gapp.model.AdditionalFields;
import java.util.List;
public interface AdditionalFieldsDao {
	AdditionalFields getAdditionalField(Integer id);
	List<AdditionalFields> getAllAdditionalFields();
	AdditionalFields saveAdditionalFieldsDao(AdditionalFields additionalFields);
	void deleteField(AdditionalFields additionalField);
}
