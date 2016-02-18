package gapp.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import gapp.model.Department;
import gapp.model.Programs;
import gapp.model.dao.DepartmentDao;
import gapp.model.dao.ProgramsDao;

@Controller
public class ProgramController {
	
	@Autowired
	ProgramsDao programsDao;
	
	@Autowired
	DepartmentDao departmentDao;
	
	@RequestMapping("/programs/index.html")
	public String index(ModelMap models){
		models.put("programs", programsDao.getAllPrograms() );
		return "programs/view";
	}
	
	@RequestMapping(value="/programs/create.html",method=RequestMethod.GET)
	public String create(ModelMap models)
	{
		models.put("dept", new Department());
		models.put("programs", new Programs());
		return "programs/create";
	}
	
	@RequestMapping(value="/programs/create.html",method=RequestMethod.POST)
	public String create(@ModelAttribute Programs program)
	{
		program = programsDao.saveProgram(program);
		return "redirect:index.html";
	}
	
	@ModelAttribute("allDepartments")
	public List<Department> populateDepartments()
	{
		List<Department> departments = new ArrayList<Department>();
		departments.add(new Department(0,"Select Department"));
		for(Department dept:departmentDao.getAllDepartments())
		{
			departments.add(new Department(dept.getDepartmentID(),dept.getDepartmentName()));
		}
		
		return departments;
	}
	
	@RequestMapping("/programs/delete.html")
	public String deleteProgram(@RequestParam Integer id)
	{
		Programs program = programsDao.getProgram(id);
		programsDao.deleteProgram(program);
		return "redirect:index.html";
	}
}
