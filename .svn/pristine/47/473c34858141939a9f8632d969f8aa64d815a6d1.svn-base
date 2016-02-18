package gapp.model.dao.jpa;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import gapp.model.Applications;
import gapp.model.Department;
import gapp.model.Terms;
import gapp.model.dao.AccountingTestDao;

@Repository

public class AccountingTestDaoImpl implements AccountingTestDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Applications> getAllData(Department dept,Terms term)
    {
    	String query = "select a from Applications a "
    			+ "join a.program p where p.dept=:dept and a.term=:term";
    	
    	return entityManager.createQuery(query, Applications.class).setParameter("dept", dept).setParameter("term", term).getResultList();
    }

}