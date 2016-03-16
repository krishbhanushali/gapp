package gapp.model.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.AcademicRecord;
import gapp.model.Students;
import gapp.model.dao.AcademicRecordDao;

@Repository
public class AcademicRecordDaoImpl implements AcademicRecordDao{
	
	@PersistenceContext
	EntityManager entityManager;
	
	@Override
	@Transactional
	public AcademicRecord saveAcademicRecord(AcademicRecord academicRecord) {
		return entityManager.merge(academicRecord);
	}
	
	@Override
	public AcademicRecord getAcademicRecordByStudent(Students student)
	{
		try
		{
			return entityManager.createQuery("from AcademicRecord where student=:student",AcademicRecord.class).setParameter("student", student).getSingleResult();
		}
		catch(NoResultException nre)
		{
			return null;
		}
	}
}
