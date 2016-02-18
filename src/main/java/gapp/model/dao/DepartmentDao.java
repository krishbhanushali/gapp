package gapp.model.dao;

import java.util.Collection;
import java.util.List;

import gapp.model.Department;
public interface DepartmentDao {
	Department getDepartment(Integer id);
	List<Department> getAllDepartments();
	Department getDepartment(String dept);
	List<Department> getAdditionalFieldsByDepartment(Collection<Department> dept);
	Department saveDepartment(Department dept);
}
