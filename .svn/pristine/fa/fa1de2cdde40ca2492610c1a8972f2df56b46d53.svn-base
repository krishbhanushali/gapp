package gapp.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import gapp.model.AdditionalFields;
import gapp.model.AdditionalFieldsValues;
import gapp.model.Applications;
import gapp.model.Department;
import gapp.model.Students;
import gapp.model.dao.AdditionalFieldsDao;
import gapp.model.dao.AdditionalFieldsValueDao;
import gapp.model.dao.ApplicationsDao;
import gapp.model.dao.DepartmentDao;
import gapp.model.dao.ProgramsDao;
import gapp.model.dao.StudentDao;

@Controller
@RequestMapping("/additionalFieldValues")
public class AdditionalFieldValuesController {
		
		@Autowired
		AdditionalFieldsDao afd;
		
		@Autowired
		ApplicationsDao applicationDao;
		
		@Autowired
		DepartmentDao deptDao;
		
		@Autowired
		ProgramsDao programDao;
		
		@Autowired
		StudentDao studentDao;
		@Autowired
		AdditionalFieldsValueDao afvd;
		
		@Autowired
		private ServletContext context;
		
		@RequestMapping(value="/create.html",method=RequestMethod.GET)
		public String create(ModelMap models, HttpSession session)
		{
			Students student = (Students)session.getAttribute("studentSession");
			Applications application = applicationDao.getOneApplication(student);
			Collection<Department> dept = new ArrayList<Department>();
			dept.add(application.getProgram().getDept());
			
			Collection<AdditionalFields> additionalFields = application.getProgram().getDept().getAdditionalFields();
			ArrayList<AdditionalFields> af2 = new ArrayList<AdditionalFields>();
			
			for(AdditionalFields af1:additionalFields)
			{
				af2.add(new AdditionalFields(af1.getAdditionalFieldID(),af1.getName(),af1.getType(),af1.isRequired()));
			}
			models.put("additionalFields", af2);
			models.put("application", application);
			return "additionalFieldValues/create";
		}
		
		@RequestMapping(value="/edit.html",method=RequestMethod.GET)
		public String edit(@ModelAttribute List<AdditionalFieldsValues> additionalFieldValues,HttpSession session,ModelMap models)
		{
			Students student = (Students)session.getAttribute("studentSession");
			List<AdditionalFieldsValues> afv = null;
			for(Applications app:student.getApplications())
			{
				afv = afvd.getValuesByApplication(app);
			}
			Applications application = applicationDao.getOneApplication(student);
			Collection<Department> dept = new ArrayList<Department>();
			dept.add(application.getProgram().getDept());
			
			Collection<AdditionalFields> additionalFields = application.getProgram().getDept().getAdditionalFields();
			ArrayList<AdditionalFields> af2 = new ArrayList<AdditionalFields>();
			
			for(AdditionalFields af1:additionalFields)
			{
				af2.add(new AdditionalFields(af1.getAdditionalFieldID(),af1.getName(),af1.getType(),af1.isRequired()));
			}
			models.put("additionalFields", af2);
			models.put("application", application);
			models.put("additionalFieldValues", afv);
			return "additionalFieldValues/edit";
		}
		@RequestMapping(value="/create.html",method=RequestMethod.POST)
		public String create(RedirectAttributes ra,HttpSession session,@RequestParam(required=false) String[] stringValue,@RequestParam(required=false) String[] integerValue,@RequestParam(required=false) MultipartFile[] fileValue,
				@RequestParam(required=false) Integer applicationID,@RequestParam(required=false) Integer additionalFieldID,@RequestParam(required=false) Integer[] additionalFieldIDString,
				@RequestParam(required=false) Integer[] additionalFieldIDInteger,@RequestParam(required=false) Integer[] additionalFieldIDFile,
				@RequestParam(required=false) String submit) throws IllegalStateException, IOException
		{
			Students student = (Students)session.getAttribute("studentSession");
			AdditionalFieldsValues afv = new AdditionalFieldsValues();
			Applications application = applicationDao.getApplication(applicationID);
			AdditionalFields additionalFields;
			if(additionalFieldIDInteger!=null)
			{	
				for(Integer i:additionalFieldIDInteger)
				{
					additionalFields = afd.getAdditionalField(i);
					for(String s:integerValue)
					{
						if(s!=null)
						{
							afv.setValue(s);
							afv.setApplication(application);
							afv.setAdditonalFields(additionalFields);
							afvd.saveFieldValue(afv);
						}
						break;
					}
				}
			}
			if(additionalFieldIDString!=null)
			{
				for(Integer i:additionalFieldIDString)
				{
					additionalFields = afd.getAdditionalField(i);
					for(String s:stringValue)
					{
						if(s!=null)
						{
							afv.setValue(s);
							afv.setApplication(application);
							afv.setAdditonalFields(additionalFields);
							afvd.saveFieldValue(afv);
						}
						break;
					}
				}
			}
			if(additionalFieldIDFile!=null)
			{
				for(Integer i:additionalFieldIDFile)
				{
					additionalFields = afd.getAdditionalField(i);
					for(MultipartFile s:fileValue)
					{
						File file = new File(context.getRealPath("/WEB-INF/files/"+student.getStudentID()));
						if(!file.exists())
						{
							if(file.mkdir())
							{
								s.transferTo(new File(context.getRealPath("/WEB-INF/files/"+student.getStudentID()),s.getOriginalFilename()));
							}
						}
						else
							s.transferTo(new File(context.getRealPath("/WEB-INF/files/"+student.getStudentID()),s.getOriginalFilename()));
						if(s!=null)
						{
							afv.setValue(s.getOriginalFilename());
							afv.setApplication(application);
							afv.setAdditonalFields(additionalFields);
							afvd.saveFieldValue(afv);
						}
						break;
					}
				}
			}
			if(submit!=null)
			{
				Students student1 = studentDao.getStudent(student.getStudentID());
				List<Applications> applications = student1.getApplications();
				for(Applications application1:applications)
				{
					application1.setStatus(applicationDao.getApplicationStatusByID(1));
					applicationDao.saveApplication(application);
				}
			}
			ra.addAttribute("id",student.getUser().getUserID());
			return "redirect:/applications/index.html";
		}
}
