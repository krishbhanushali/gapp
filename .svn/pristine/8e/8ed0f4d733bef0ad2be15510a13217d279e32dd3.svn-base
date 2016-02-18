package gapp.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import gapp.model.Department;
import gapp.model.Programs;
import gapp.model.dao.DepartmentDao;
import gapp.model.dao.ProgramsDao;

@Controller
public class AdminController {
	
	@Autowired
	DepartmentDao deptDao;
	
	@Autowired
	ProgramsDao programsDao;
	
	@RequestMapping("/admin/index.html")
	public String index()
	{
		return "admin/index";
	}
	
	@RequestMapping("/admin/department.html")
	public String listDepartments(ModelMap models){
		
		List<Department> dept = deptDao.getAllDepartments();
		List<Programs> programs = programsDao.getAllPrograms();
		models.put("DEPARTMENTS", dept);
		models.put("PROGRAMS", programs);
		return "admin/listDept";
	}
}
