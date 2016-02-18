package gapp.model.dao.jpa;


import java.util.Collection;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.AdditionalFields;
import gapp.model.Department;
import gapp.model.Terms;
import gapp.model.dao.DepartmentDao;

@Repository
public class DepartmentDaoImpl implements DepartmentDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Department getDepartment( Integer id )
    {
    	Department dept = null;
    	try{
    		dept = entityManager.find( Department.class, id ); 
    	}
    	catch(NoResultException nre)
    	{
    		
    	}
        if(dept!=null)
        	return dept;
        else
        	return null;
    }

    @Override
    public List<Department> getAllDepartments()
    {
        return entityManager.createQuery( "from Department order by departmentID", Department.class )
            .getResultList();
    }
    
    @Override
    public Department getDepartment(String dept)
    {
    	String query = "from Department where departmentName LIKE :name";
    	Department d = entityManager.createQuery(query,Department.class).setParameter("name",dept).getSingleResult();
    	return d;
    }
    @Override
	public List<Department> getAdditionalFieldsByDepartment(Collection<Department> dept) {
		String query="select dept from Department dept left join fetch dept.additionalFields where dept=:dept";
		return entityManager.createQuery(query,Department.class).setParameter("dept", dept).getResultList();
		//return entityManager.createQuery("from AdditionalFields where dept=:dept", AdditionalFields.class).setParameter("dept", dept).getResultList();
	}

	@Override
	@Transactional
	public Department saveDepartment(Department dept) {
		// TODO Auto-generated method stub
		
		return entityManager.merge(dept); 
	}
}