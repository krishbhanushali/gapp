package gapp.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import gapp.model.Department;
import gapp.model.Programs;
import gapp.model.dao.DepartmentDao;
import gapp.model.dao.ProgramsDao;

@Controller
@SessionAttributes("department")
public class DepartmentController {
	
	@Autowired
	DepartmentDao departmentDao;
	
	@Autowired
	ProgramsDao programsDao;
	
	
	@RequestMapping(value="department/view.html")
	public String view(@RequestParam Integer id,ModelMap models)
	{
		Department dept = departmentDao.getDepartment(id);
		List<Programs> programs = programsDao.getProgramsByDepartment(dept);
		List<Department> deptList = new ArrayList<Department>();
		deptList.add(dept);
		List<Department> additionalFields = departmentDao.getAdditionalFieldsByDepartment(deptList);
		models.put("additionalFields", additionalFields);
		models.put("department", dept);
		models.put("programs", programs);
		return "department/view";
	}
	
	@RequestMapping(value="department/create.html", method = RequestMethod.GET)
	public String create(ModelMap models)
	{
		models.put("department",new Department());
		return "department/create";
	}
	
	@RequestMapping(value="department/create.html",method=RequestMethod.POST)
	public String create(@ModelAttribute Department dept)
	{
		dept = departmentDao.saveDepartment(dept);
		return "redirect:/admin/department.html";
	}
	
	@RequestMapping(value="department/edit.html", method = RequestMethod.GET)
	public String edit(@RequestParam Integer id,ModelMap models)
	{
		models.put("department",departmentDao.getDepartment(id));
		return "department/edit";
	}
	
	@RequestMapping(value="department/edit.html",method=RequestMethod.POST)
	public String edit(@ModelAttribute Department dept,@RequestParam Integer id)
	{
		dept = departmentDao.saveDepartment(dept);
		return "redirect:/admin/department.html";
	}
}
