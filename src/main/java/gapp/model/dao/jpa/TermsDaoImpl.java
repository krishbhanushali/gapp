package gapp.model.dao.jpa;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import gapp.model.Terms;
import gapp.model.dao.TermsDao;

@Repository
public class TermsDaoImpl implements TermsDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Terms getTerm( Integer id )
    {
        return entityManager.find( Terms.class, id );
    }

    @Override
    public List<Terms> getAllTerms()
    {
        return entityManager.createQuery( "from Terms", Terms.class )
            .getResultList();
    }
    
    @Override
    public Terms getTerm(String termName)
    {
    	String query = "from Terms where termName LIKE :name";
    	Terms t = entityManager.createQuery(query,Terms.class).setParameter("name",termName).getSingleResult();
    	return t;
    }

}