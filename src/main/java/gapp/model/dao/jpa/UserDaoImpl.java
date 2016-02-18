package gapp.model.dao.jpa;


import java.sql.SQLException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.Terms;
import gapp.model.User;
import gapp.model.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public User getUser( Integer id )
    {
        return entityManager.find( User.class, id );
    }
    
    @Override
    public User getUser(String name)
    {
    	return entityManager.createQuery("from User where firstName=:name",User.class)
    			.setParameter("name", name).getSingleResult();
    }
    @Override
    public List<User> getUsers()
    {
        return entityManager.createQuery( "from User", User.class )
            .getResultList();
    }
    
    @Override
    public User getUserByEmailAndPassword(String emailID,String password) throws SQLException
    {
    	String query = "from User where emailID=:emailID and password=:password";
    	User user = null;
    	try
    	{
    		user = entityManager.createQuery(query,User.class).setParameter("emailID",emailID).setParameter("password", password).getSingleResult();
    	}
    	catch(NoResultException nre)
    	{
    		
    	}
    	if(user!=null)
    		return user;
    	else
    		return null;
    	
    }

	@Override
	@Transactional
	public User save(User user) {
		return entityManager.merge(user);
		
	}

	@Override
	public User getUserByEmail(String emailID) {
		// TODO Auto-generated method stub
		String query = "from User where emailID=:emailID";
    	User user = null;
    	try
    	{
    		user = entityManager.createQuery(query,User.class).setParameter("emailID",emailID).getSingleResult();
    	}
    	catch(NoResultException nre)
    	{
    		
    	}
    	if(user!=null)
    		return user;
    	else
    		return null;
	}

}