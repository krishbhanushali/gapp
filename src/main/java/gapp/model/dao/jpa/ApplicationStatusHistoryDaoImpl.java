package gapp.model.dao.jpa;



import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.ApplicationStatusHistory;

import gapp.model.dao.ApplicationStatusHistoryDao;


@Repository
public class ApplicationStatusHistoryDaoImpl implements ApplicationStatusHistoryDao {

    @PersistenceContext
    private EntityManager entityManager;

	@Override
	@Transactional
	public void saveApplicationHistory(ApplicationStatusHistory ash) {
		entityManager.merge(ash);
		
	}

}