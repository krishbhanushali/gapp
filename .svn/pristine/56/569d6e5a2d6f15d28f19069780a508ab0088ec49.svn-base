package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.AdditionalFieldsValues;
import gapp.model.Applications;
import gapp.model.dao.AdditionalFieldsValueDao;

@Repository
public class AdditionalFieldsValueDaoImpl implements AdditionalFieldsValueDao {
	@PersistenceContext
	EntityManager entityManager;

	@Override
	@Transactional
	public void saveFieldValue(AdditionalFieldsValues afd) {
		// TODO Auto-generated method stub
		entityManager.merge(afd);
	}

	@Override
	public List<AdditionalFieldsValues> getValuesByApplication(Applications application) {
		// TODO Auto-generated method stub
		return entityManager.createQuery("from AdditionalFieldsValues where application=:application", AdditionalFieldsValues.class).setParameter("application", application).getResultList();
	}

	@Override
	public AdditionalFieldsValues getAdditionalFieldValue(Integer id) {
		// TODO Auto-generated method stub
		return entityManager.find(AdditionalFieldsValues.class, id);
	}
}
