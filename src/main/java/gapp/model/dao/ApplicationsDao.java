package gapp.model.dao;

import java.util.List;

import gapp.model.Applications;
import gapp.model.Students;
public interface ApplicationsDao {
	Applications getApplication(Integer id);
	List<Applications> getApplication(Students student);
	List<Applications> getAllApplications();
}
