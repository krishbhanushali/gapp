package gapp.model.dao.jpa;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import gapp.model.Students;
import gapp.model.User;
import gapp.model.dao.StudentDao;

@Repository
public class StudentDaoImpl implements StudentDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Students getStudent( Integer id )
    {
        return entityManager.find( Students.class, id );
    }
    
    @Override
    public Students getStudent(User user)
    {
    	return entityManager.createQuery("from Students where user=:user",Students.class).setParameter("user", user).getSingleResult();
    }
    @Override
    public List<Students> getAllStudents()
    {
        return entityManager.createQuery( "from Students", Students.class )
            .getResultList();
    }

}