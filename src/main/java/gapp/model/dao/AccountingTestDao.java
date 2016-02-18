package gapp.model.dao;

import java.util.List;

import gapp.model.Applications;
import gapp.model.Department;
import gapp.model.Terms;

public interface AccountingTestDao {
	List<Applications> getAllData(Department dept,Terms term);
}
