package gapp.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

import gapp.model.AcademicRecord;
import gapp.model.AdditionalFields;
import gapp.model.ApplicationStatus;
import gapp.model.Applications;
import gapp.model.Students;
import gapp.model.dao.AcademicRecordDao;
import gapp.model.dao.ApplicationsDao;
import gapp.model.dao.DepartmentDao;
import gapp.model.dao.StudentDao;

@Controller
@RequestMapping("/academicRecords")
public class AcademicRecordsController {
	
	@Autowired
	private ServletContext context;
	
	@Autowired
	AcademicRecordDao academicRecordDao;
	
	@Autowired
	StudentDao studentDao;
	
	@Autowired
	DepartmentDao deptDao;
	
	@Autowired
	ApplicationsDao applicationDao;
	
	//------------------------------CREATE GET-------------------------------------
	@RequestMapping(value="/create.html",method=RequestMethod.GET)
	public String create(ModelMap models,@ModelAttribute("student") Students student)
	{
		System.out.println(student.getStudentID());
		List<Applications> applications = applicationDao.getApplication(student);
		List<AdditionalFields> additionalFields = new ArrayList<AdditionalFields>();
		for(Applications application: applications)
		{
			
			for(AdditionalFields additionalField:application.getProgram().getDept().getAdditionalFields())
			{
				additionalFields.add(additionalField);
			}
		}
		models.put("additionalFields", additionalFields);
		models.put("academicRecord", new AcademicRecord());
		
		return "academicRecords/create";
	}
	
	//------------------------------CREATE POST-------------------------------------
	@RequestMapping(value="/create.html",method=RequestMethod.POST)
	public String create(@RequestParam MultipartFile transcript, @RequestParam Integer toeflScore, @RequestParam Integer greScore
			,@RequestParam float gpa,@RequestParam Integer studentID,@RequestParam(required=false) String additionalFieldID,RedirectAttributes ra,@RequestParam(required=false) String submit,@RequestParam(required=false) String save) throws IllegalStateException, IOException
	{
		AcademicRecord academicRecord = new AcademicRecord();
		academicRecord.setGpa(gpa);
		academicRecord.setGreScore(greScore);
		academicRecord.setToeflScore(toeflScore);
		academicRecord.setStudent(studentDao.getStudent(studentID));
		academicRecord.setTranscript(transcript.getOriginalFilename());
		academicRecord = academicRecordDao.saveAcademicRecord(academicRecord);
		
		File file = new File(context.getRealPath("/WEB-INF/files/"+studentID));
		if(!file.exists())
		{
			if(file.mkdir())
			{
				transcript.transferTo(new File(context.getRealPath("/WEB-INF/files/"+studentID),transcript.getOriginalFilename()));
			}
		}
		else
			transcript.transferTo(new File(context.getRealPath("/WEB-INF/files/"+studentID),transcript.getOriginalFilename()));
		if(additionalFieldID!=null)
			return "redirect:/additionalFieldValues/create.html";
		else
		{
			if(submit!=null)
			{
				Students student1 = studentDao.getStudent(studentID);
				List<Applications> applications = student1.getApplications();
				for(Applications application:applications)
				{
					application.setStatus(applicationDao.getApplicationStatusByID(1));
				}
			}
			ra.addAttribute("id",studentDao.getStudent(studentID).getUser().getUserID());
			return "redirect:/applications/index.html";
		}
	}
	
	@RequestMapping(value="/edit.html",method=RequestMethod.GET)
	public String edit(ModelMap models,@RequestParam(value="student",required=false) Students student,HttpSession session)
	{
		AcademicRecord academicRecord = null;
		if(student!=null)
		{
			academicRecord = academicRecordDao.getAcademicRecordByStudent(student);
		}
		else
		{
			student = (Students)session.getAttribute("studentSession");
			academicRecord = academicRecordDao.getAcademicRecordByStudent(student);
		}
		//System.out.println(student.getStudentID());
		List<Applications> applications = applicationDao.getApplication(student);
		List<AdditionalFields> additionalFields = new ArrayList<AdditionalFields>();
		for(Applications application: applications)
		{
			
			for(AdditionalFields additionalField:application.getProgram().getDept().getAdditionalFields())
			{
				additionalFields.add(additionalField);
			}
		}
		models.put("additionalFields", additionalFields);
		models.put("academicRecord", academicRecord);
		return "academicRecords/edit";
	}
	
	@RequestMapping(value="/edit.html",method=RequestMethod.POST)
	public String edit(@RequestParam MultipartFile transcript, @RequestParam Integer toeflScore, @RequestParam Integer greScore
			,@RequestParam float gpa,@RequestParam Integer studentID,@RequestParam(required=false) String additionalFieldID,RedirectAttributes ra,@RequestParam(required=false) String submit,@RequestParam(required=false) String save) throws IllegalStateException, IOException
	{
		AcademicRecord academicRecord = null;
		if(academicRecordDao.getAcademicRecordByStudent(studentDao.getStudent(studentID))!=null)
		{
			academicRecord = academicRecordDao.getAcademicRecordByStudent(studentDao.getStudent(studentID));
			academicRecord.setGpa(gpa);
			academicRecord.setGreScore(greScore);
			academicRecord.setToeflScore(toeflScore);
			academicRecord.setStudent(studentDao.getStudent(studentID));
			if(!transcript.isEmpty())
				academicRecord.setTranscript(transcript.getOriginalFilename());
			academicRecord = academicRecordDao.saveAcademicRecord(academicRecord);
			File file = new File(context.getRealPath("/WEB-INF/files/"+studentID));
			if(!file.exists())
			{
				if(file.mkdir())
				{
					transcript.transferTo(new File(context.getRealPath("/WEB-INF/files/"+studentID),transcript.getOriginalFilename()));
				}
			}
			//else
			
				//transcript.transferTo(new File(context.getRealPath("/WEB-INF/files/"+studentID),transcript.getOriginalFilename()));
		}
		if(additionalFieldID!=null)
			return "redirect:/additionalFieldValues/create.html";
		else
		{
			if(submit!=null)
			{
				Students student1 = studentDao.getStudent(studentID);
				List<Applications> applications = student1.getApplications();
				for(Applications application:applications)
				{
					application.setStatus(applicationDao.getApplicationStatusByID(1));
					applicationDao.saveApplication(application);
				}
			}
			ra.addAttribute("id",studentDao.getStudent(studentID).getUser().getUserID());
			return "redirect:/applications/index.html";
		}
	}
}
