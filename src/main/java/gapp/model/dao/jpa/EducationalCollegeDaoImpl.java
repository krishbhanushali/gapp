package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.EducationalCollege;
import gapp.model.Students;
import gapp.model.dao.EducationalCollegeDao;

@Repository
public class EducationalCollegeDaoImpl implements EducationalCollegeDao{
	
	@PersistenceContext
	EntityManager entityManager;

	@Override
	@Transactional
	public EducationalCollege saveCollege(EducationalCollege educationalCollege) {
		// TODO Auto-generated method stub
		return entityManager.merge(educationalCollege);
	}

	@Override
	public List<EducationalCollege> getEducationByStudent(Students student) {
		// TODO Auto-generated method stub
		return entityManager.createQuery("from EducationalCollege where student=:student", EducationalCollege.class).setParameter("student", student).getResultList();
	}

	@Override
	public EducationalCollege getEducationalCollege(Integer id) {
		// TODO Auto-generated method stub
		return entityManager.find(EducationalCollege.class, id);
	}

	@Override
	@Transactional
	public EducationalCollege removeEducatoin(Integer id) {
		// TODO Auto-generated method stub
		EducationalCollege college = getEducationalCollege(id);
		entityManager.remove(college);
		return college;
		
	}
	
}
