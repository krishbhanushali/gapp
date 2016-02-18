package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.Department;
import gapp.model.Programs;
import gapp.model.dao.ProgramsDao;

@Repository
public class ProgramsDaoImpl implements ProgramsDao{
	
	@PersistenceContext
    private EntityManager entityManager;
	
	@Override
	public List<Programs> getAllPrograms() {
		 return entityManager.createQuery( "from Programs", Programs.class )
		            .getResultList();
		
	}

	@Override
	public List<Programs> getProgramsByDepartment(Department dept) {
		return entityManager.createQuery("from Programs where dept=:dept",Programs.class).setParameter("dept", dept).getResultList();
		
	}

	@Override
	@Transactional
	public Programs saveProgram(Programs program) {
		// TODO Auto-generated method stub
		return entityManager.merge(program);
	}

	@Override
	public Programs getProgram(Integer id) {
		String query = "from Programs where programID=:id";
    	Programs program = entityManager.createQuery(query,Programs.class).setParameter("id",id).getSingleResult();
    	return program;
	}

	@Override
	@Transactional
	public void deleteProgram(Programs program) {
		 entityManager.remove(program);
	}

}
