package gapp.web.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.NoResultException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import gapp.model.AcademicRecord;
import gapp.model.AdditionalFields;
import gapp.model.AdditionalFieldsValues;
import gapp.model.ApplicationStatus;
import gapp.model.ApplicationStatusHistory;
import gapp.model.Applications;
import gapp.model.Department;
import gapp.model.EducationalCollege;
import gapp.model.Programs;
import gapp.model.Students;
import gapp.model.Terms;
import gapp.model.User;
import gapp.model.dao.AcademicRecordDao;
import gapp.model.dao.AdditionalFieldsValueDao;
import gapp.model.dao.ApplicationStatusHistoryDao;
import gapp.model.dao.ApplicationsDao;
import gapp.model.dao.DepartmentDao;
import gapp.model.dao.ProgramsDao;
import gapp.model.dao.StudentDao;
import gapp.model.dao.TermsDao;
import gapp.model.dao.UserDao;

@Controller
@EnableWebMvc
@SessionAttributes("applications")
public class ApplicationController {
	
	@Autowired
	private ServletContext context;
	
	@Autowired
	ApplicationsDao applicationsDao;
	
	@Autowired
	StudentDao studentDao;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	DepartmentDao departmentDao;
	
	@Autowired
	ProgramsDao programsDao;
	
	@Autowired
	TermsDao termsDao;
	
	@Autowired
	ApplicationStatusHistoryDao ashd;
	
	@Autowired
	AcademicRecordDao academicRecordDao;
	
	@Autowired
	AdditionalFieldsValueDao afvd;
	
	//------------------------------INDEX-------------------------------------
	@RequestMapping(value="/applications/index.html")
	public String view(@RequestParam(value="id",required=false) Integer id, ModelMap models,HttpSession session)
	{
		if(session.getAttribute("studentSession")!=null)
		{
			session.setAttribute("studentSession", null);
		}
		if(id!=null)
		{
			User user = userDao.getUser(id);
			
			List<Applications> applications = new ArrayList<Applications>();
			try
			{
				
				List<Students> student = studentDao.getStudent(user);
				for(Students stud:student)
				{
					List<Applications> applicationsTemp = stud.getApplications();
					for(Applications app:applicationsTemp)
					{
						applications.add(app);
					}
				}
 				//student = studentDao.getStudent(user);
				//applications = student.getApplications();
			}
			catch(NoResultException nre)
			{
				
			}
			models.put("applications", applications);
			return "applications/index";
		}
		else
		{
			List<Applications> applications = applicationsDao.getAllApplications();
			models.put("applications", applications);
			return "";
		}
	}
	
	//------------------------------CREATE GET-------------------------------------
	@RequestMapping(value="/applications/create.html",method=RequestMethod.GET)
	public String create(@RequestParam(value="id",required=false) Integer id,ModelMap models,HttpSession session,HttpServletRequest request,RedirectAttributes ra)
	{
		models.put("applications", new Applications());
		models.put("departments", new Department());
		models.put("applicationStatus", new ApplicationStatus());
		session.setAttribute("edit", "no");
		User user = (User)session.getAttribute("user");
		Students student = new Students();
		student.setUser(user);
		//session.setAttribute("studentSession", null);
		Students student1=null;
		
		if(session.getAttribute("studentSession")!=null)
		{			
			System.out.println();
			student1 = (Students)session.getAttribute("studentSession");
			System.out.println("student id in session before saving :- "+student1.getStudentID());
		    session.setAttribute("studentSession", student1);
		    List<Applications> applications = applicationsDao.getApplication(student1);
		    int applicationID = 0;
		    for(Applications applications1:applications)
		    {
		    	applicationID = applications1.getApplicationID();
		    }
		    ra.addAttribute("id", applicationID);
		    return "redirect:/applications/edit.html";
		}
		else
		{
			student1 = studentDao.saveStudent(student);
			session.setAttribute("studentSession", student1);
			Students temp1 = (Students)session.getAttribute("studentSession");
			System.out.println("student id in session after saving :- "+temp1.getStudentID());
		}
		
		if(student1==null)
		{
			student1 = (Students)session.getAttribute("studentSession");
		}
		models.put("student",student1);
		return "applications/create";
	}
	
	//------------------------------CREATE POST-------------------------------------
	@RequestMapping(value="/applications/create.html",method=RequestMethod.POST)
	public String create(@ModelAttribute Applications applications,RedirectAttributes ra,HttpSession session)
	{
		System.out.println("student id in post : "+applications.getStudent().getStudentID());
		ApplicationStatusHistory ash = new ApplicationStatusHistory();
		Date date = new Date();
		applications.setStudent((Students)session.getAttribute("studentSession"));
		Applications application1 = applicationsDao.saveApplication(applications);
		System.out.println("Application Student id : "+application1.getStudent().getStudentID());
		ash.setApplication(application1);
		System.out.println("Application Student id after application history set: "+application1.getStudent().getStudentID());
		ash.setTimeChanged(date);
		ashd.saveApplicationHistory(ash);
		ra.addFlashAttribute("student", application1.getStudent());
		return "redirect:/student/edit.html";
	}
	
	//------------------------------EDIT GET-------------------------------------
	@RequestMapping(value="/applications/edit.html",method=RequestMethod.GET)
	public String edit(@RequestParam Integer id,ModelMap models,HttpSession session)
	{
		Applications application = applicationsDao.getApplication(id);
		session.setAttribute("edit", "yes");
		models.put("applications", application);
		models.put("applicationStatus", new ApplicationStatus());
		Students student = application.getStudent();
		
		//User user = (User)session.getAttribute("user");
		//models.put("student",studentDao.getStudent(user));
		if(session.getAttribute("studentSession")==null)
		{
			session.setAttribute("studentSession", student);
		}
		else
		{
			student = (Students)session.getAttribute("studentSession");
		}
		if(student==null)
		{
			student = (Students)session.getAttribute("studentSession");
		}
		models.put("student", student); //edited
		return "applications/edit";
	}
	
	//------------------------------EDIT POST-------------------------------------
	@RequestMapping(value="/applications/edit.html",method=RequestMethod.POST)
	public String edit(@ModelAttribute Applications applications,SessionStatus status,RedirectAttributes ra) //changed Ra
	{
		System.out.println("department is : "+applications.getProgram().getDept().getDepartmentName());
		System.out.println("program is : "+applications.getProgram().getProgramName());
		System.out.println("term is: "+applications.getTerm().getTermName());
		ApplicationStatusHistory ash = new ApplicationStatusHistory();
		Date date = new Date();
		Applications application1 = applicationsDao.saveApplication(applications);
		status.setComplete();
		ash.setApplication(application1);
		ash.setTimeChanged(date);
		ashd.saveApplicationHistory(ash);
		
		ra.addFlashAttribute("student", applications.getStudent()); //edited
		return "redirect:/student/edit.html";
	}
	
	//------------------------------AJAX-------------------------------------
	@RequestMapping(value="/applications/getPrograms/{departmentID}",method=RequestMethod.POST)
	@ResponseBody
	public String getPrograms(@PathVariable(value="departmentID") Integer departmentID)
	{
		Department dept = departmentDao.getDepartment(departmentID);
		List<Programs> program = programsDao.getProgramsByDepartment(dept);
		String response = "<select name='program.programID' id='programID' required class='form-control'><option value=''>Select Program...</option>";
		for(Programs prog:program)
		{
			response += "<option value='"+prog.getProgramID()+"'>"+prog.getProgramName()+"</option>";
		}
		response +="</select>";
		return response;
	}
	
	//***********************************AJAX EDIT-------------------------------------
	@RequestMapping(value="/applications/getProgramsEdit",method=RequestMethod.POST)
	@ResponseBody
	public String getProgramsEdit(@RequestParam Integer deptID, @RequestParam Integer progID)
	{
		Department dept = departmentDao.getDepartment(deptID);
		List<Programs> program = programsDao.getProgramsByDepartment(dept);
		String response = "<select name='program.programID' id='programID' required class='form-control'><option value=''>Select Program...</option>";
		String selected=null;
		for(Programs prog:program)
		{
			if(prog.getProgramID()==progID)
			{
				selected="selected";
			}
			else
				selected = null;
			response += "<option value='"+prog.getProgramID()+"'"+selected+">"+prog.getProgramName()+"</option>";
		}
		response +="</select>";
		return response;
	}
	
	//************************View Application**********************************
	@RequestMapping(value="/applications/view.html")
	public String viewApplication(@RequestParam Integer applicationID,ModelMap models)
	{
		Applications application = applicationsDao.getApplication(applicationID);
		Students student = application.getStudent();
		List<EducationalCollege> educationalCollege = application.getStudent().getEducationalCollege();
		AcademicRecord academicRecord = academicRecordDao.getAcademicRecordByStudent(student);
		Collection<AdditionalFields> additionalFields = application.getProgram().getDept().getAdditionalFields();
		List<AdditionalFieldsValues> additionalFieldsValues = afvd.getValuesByApplication(application);
		models.put("additionalFieldsValues", additionalFieldsValues);
		models.put("additionalFields", additionalFields);
		models.put("student", student);
		models.put("academicRecord", academicRecord);
		models.put("educationalCollege", educationalCollege);
		models.put("application", application);
		return "applications/view";
	}
	
	@RequestMapping(value="/applications/downloadRequirement.html",method=RequestMethod.GET)
	public String downloadRequirement(@RequestParam Integer studentID,@RequestParam Integer valueID,HttpServletResponse response) throws IOException
	{
		AdditionalFieldsValues afv = afvd.getAdditionalFieldValue(valueID);
		FileInputStream in = new FileInputStream(new File(context.getRealPath("/WEB-INF/files/"+studentID),afv.getValue()));
		OutputStream out = response.getOutputStream();
		if(afv.getValue().contains("pdf"))
		{
			response.setContentType("application/pdf");
		}
		if(afv.getValue().contains("jpg"))
		{
			response.setContentType("image/jpg");	
		}
		if(afv.getValue().contains("docx"))
		{
			response.setContentType("application/docx");	
		}
		response.setHeader("Content-Disposition", "inline; filename="+afv.getValue());
		response.setHeader("Content-Disposition", "inline;filename="+afv.getValue());
		byte buffer[] = new byte[2048];
		int bytesRead;
		while((bytesRead = in.read(buffer))>0)
		{
			out.write(buffer, 0, bytesRead);
		}
		in.close();
		return null;
	}
	@RequestMapping(value="/applications/download.html",method=RequestMethod.GET)
	public String download(@RequestParam Integer id,HttpServletResponse response) throws IOException
	{
		AcademicRecord academicRecord = academicRecordDao.getAcademicRecordByStudent(studentDao.getStudent(id));
		FileInputStream in = new FileInputStream(new File(context.getRealPath("/WEB-INF/files/"+id),academicRecord.getTranscript()));
		OutputStream out = response.getOutputStream();
		if(academicRecord.getTranscript().contains("pdf"))
		{
			response.setContentType("application/pdf");
		}
		if(academicRecord.getTranscript().contains("jpg"))
		{
			response.setContentType("image/jpg");	
		}
		if(academicRecord.getTranscript().contains("docx"))
		{
			response.setContentType("application/docx");	
		}
		response.setHeader("Content-Disposition", "inline; filename="+academicRecord.getTranscript());
		response.setHeader("Content-Disposition", "inline;filename="+academicRecord.getTranscript());
		byte buffer[] = new byte[2048];
		int bytesRead;
		while((bytesRead = in.read(buffer))>0)
		{
			out.write(buffer, 0, bytesRead);
		}
		in.close();
		return null;
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
	
	@ModelAttribute("allTerms")
	public List<Terms> populateTerms()
	{
		List<Terms> terms = new ArrayList<Terms>();
		terms.add(new Terms(0,"Select Term"));
		for(Terms term:termsDao.getAllTerms())
		{
			terms.add(new Terms(term.getTermID(),term.getTermName()));
		}
		return terms;
	}
}
