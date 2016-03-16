package gapp.model.dao;

import java.util.List;

import gapp.model.EducationalCollege;
import gapp.model.Students;

public interface EducationalCollegeDao {
	EducationalCollege saveCollege(EducationalCollege educationalCollege);
	List<EducationalCollege> getEducationByStudent(Students student);
	
	EducationalCollege getEducationalCollege(Integer id);
	EducationalCollege removeEducatoin(Integer id);
}
