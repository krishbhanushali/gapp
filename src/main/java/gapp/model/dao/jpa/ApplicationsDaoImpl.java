package gapp.model.dao.jpa;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import gapp.model.Applications;
import gapp.model.Students;
import gapp.model.dao.ApplicationsDao;

@Repository
public class ApplicationsDaoImpl implements ApplicationsDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Applications getApplication( Integer id )
    {
        return entityManager.find( Applications.class, id );
    }
    
    @Override
    public List<Applications> getApplication(Students student)
    {
    	return entityManager.createQuery("from Applications where student=:student",Applications.class).setParameter("student", student).getResultList();
    }
    @Override
    public List<Applications> getAllApplications()
    {
        return entityManager.createQuery( "from Applications", Applications.class )
            .getResultList();
    }

}