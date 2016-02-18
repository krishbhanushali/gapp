package gapp.web.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import gapp.model.AdditionalFields;
import gapp.model.Department;
import gapp.model.dao.AdditionalFieldsDao;
import gapp.model.dao.DepartmentDao;

@Controller
public class AdditionalFieldsController {

	@Autowired
	AdditionalFieldsDao additionalFieldsDao;
	
	@Autowired
	DepartmentDao departmentDao;
	@RequestMapping("/additionalFields/index.html")
	public String view(ModelMap models)
	{
		models.put("departments", departmentDao.getAllDepartments());
		models.put("additionalFields1",additionalFieldsDao.getAllAdditionalFields());
		return "additionalFields/index";
	}
	
	@RequestMapping(value="/additionalFields/create.html",method=RequestMethod.GET)
	public String create(ModelMap models)
	{
		models.put("additionalFields", new AdditionalFields());
		models.put("dept", new Department());
		return "additionalFields/create";
	}
	
	@RequestMapping(value="/additionalFields/create.html",method=RequestMethod.POST)
	public String create(@RequestParam String name,@RequestParam boolean required,@RequestParam String type,@RequestParam String departments)
	{
		ArrayList<Department> departmentsArrayList = new ArrayList<Department>();
		String departmentIDs[] = departments.split(",");
		for(int i=0;i<departmentIDs.length;i++)
		{
			departmentsArrayList.add(departmentDao.getDepartment(Integer.parseInt(departmentIDs[i])));
		}
		AdditionalFields af = new AdditionalFields();
		af.setName(name);
		af.setRequired(required);
		af.setType(type);
		af.setDept(departmentsArrayList);
		af = additionalFieldsDao.saveAdditionalFieldsDao(af);
		return "redirect:/additionalFields/index.html";
	}
	
	@ModelAttribute("allDepartments")
	public List<Department> populateDepartments()
	{
		List<Department> departments = new ArrayList<Department>();
		departments.add(new Department(-1,"Select Department"));
		for(Department dept:departmentDao.getAllDepartments())
		{
			departments.add(new Department(dept.getDepartmentID(),dept.getDepartmentName()));
		}
		
		return departments;
	}
	
	@RequestMapping("/additionalFields/delete.html")
	public String delete(@RequestParam Integer id)
	{
		AdditionalFields additionalField = additionalFieldsDao.getAdditionalField(id);
		additionalFieldsDao.deleteField(additionalField);
		return "redirect:/additionalFields/index.html";
	}
}
