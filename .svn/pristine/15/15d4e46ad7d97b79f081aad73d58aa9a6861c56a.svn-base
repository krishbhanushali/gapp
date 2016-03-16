package gapp.web.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import gapp.model.EducationalCollege;
import gapp.model.Students;
import gapp.model.User;
import gapp.model.dao.AcademicRecordDao;
import gapp.model.dao.EducationalCollegeDao;
import gapp.model.dao.StudentDao;

@Controller
@SessionAttributes("education")
public class EducationalController {
	
	@Autowired
	StudentDao studentDao;
	
	@Autowired
	EducationalCollegeDao educationalCollegeDao;
	
	@Autowired
	AcademicRecordDao academicRecordDao;
	
	@InitBinder
	protected void initBinder(HttpServletRequest request,WebDataBinder binder) {
		SimpleDateFormat dateFormat =new SimpleDateFormat("yyyy-mm-dd");
	    dateFormat.setLenient(false);
	    binder.registerCustomEditor(Date.class, null, new CustomDateEditor(dateFormat, true));
	}
	
	@RequestMapping(value="/educationalCollege/create.html",method=RequestMethod.GET)
	public String create(ModelMap models,HttpSession session,@RequestParam(value="student",required=false) Students student)
	{
		try
		{
			Students student1 = null;
			if(student!=null)
			{
				student1 = student;
			}
			else
			{
				student1 = (Students)session.getAttribute("studentSession");
			}
			List<EducationalCollege> educationalCollege = new ArrayList<EducationalCollege>();
			for(EducationalCollege ec:educationalCollegeDao.getEducationByStudent(student1))
			{
				System.out.println(ec.getEducationCollegeName());
				educationalCollege.add(new EducationalCollege(ec.getEducationCollegeId(),ec.getEducationCollegeName(),
						ec.getEducationCollgeDegreeStartDate(),ec.getEducationCollegeDegreeEndDate(),ec.getEducationDegreeEarned(),ec.getEducationFieldOfTheDegree(),
						ec.getStudent()));
			}
			Collections.sort(educationalCollege,new Comparator<EducationalCollege>(){
				@Override public int compare(EducationalCollege ec1, EducationalCollege ec2){
					return ec1.getEducationCollegeId() - ec2.getEducationCollegeId();
				}
			});
			models.put("student", session.getAttribute("studentSession"));
			models.put("student", student1);
			models.put("educationalCollege", educationalCollege);
			models.put("education", new EducationalCollege());
		}
		catch(NullPointerException npe)
		{
			return "redirect:/home.html";
		}
			return "/educationalCollege/create";
	}

	@RequestMapping(value="/educationalCollege/create.html",method=RequestMethod.POST)
	public String create(@ModelAttribute EducationalCollege educationalCollege,RedirectAttributes ra)
	{
		EducationalCollege educationalCollege1 = educationalCollegeDao.saveCollege(educationalCollege);
		ra.addFlashAttribute("student", educationalCollege1.getStudent());
		return "redirect:create.html";
	}
	
	@RequestMapping(value="/educationalCollege/edit.html",method=RequestMethod.POST)
	public String edit(@ModelAttribute EducationalCollege educationalCollege,RedirectAttributes ra)
	{
		if(educationalCollegeDao.getEducationalCollege(educationalCollege.getEducationCollegeId())!=null)
		{
			EducationalCollege temp = educationalCollegeDao.getEducationalCollege(educationalCollege.getEducationCollegeId());
			temp.setEducationCollegeDegreeEndDate(educationalCollege.getEducationCollegeDegreeEndDate());
			temp.setEducationCollegeName(educationalCollege.getEducationCollegeName());
			temp.setEducationCollgeDegreeStartDate(educationalCollege.getEducationCollgeDegreeStartDate());
			temp.setEducationDegreeEarned(educationalCollege.getEducationDegreeEarned());
			temp.setEducationFieldOfTheDegree(educationalCollege.getEducationFieldOfTheDegree());
			temp.setStudent(educationalCollege.getStudent());
			EducationalCollege educationalCollege1 = educationalCollegeDao.saveCollege(temp);
			System.out.println(educationalCollege1.getEducationCollegeId());
			ra.addFlashAttribute("student", educationalCollege1.getStudent());
		}
		return "redirect:create.html";
	}
	
	@RequestMapping(value="/educationalCollege/removeEducation.html",method=RequestMethod.GET)
	public String removeEducation(@RequestParam Integer id,RedirectAttributes ra)
	{
		Students student= educationalCollegeDao.getEducationalCollege(id).getStudent();
		educationalCollegeDao.removeEducatoin(id);
		ra.addFlashAttribute("student", student);
		return "redirect:create.html";
	}
	@RequestMapping(value="/educationalCollege/redirectToAcademicRecords.html",method=RequestMethod.POST)
	public String redirect(@RequestParam Integer studentID,RedirectAttributes ra,@RequestParam String edit,HttpSession session)
	{
		Students student = studentDao.getStudent(studentID);
		ra.addFlashAttribute("student", student);
		if(session.getAttribute("edit").equals("yes") && academicRecordDao.getAcademicRecordByStudent(student)!=null)
		{
			return "redirect:/academicRecords/edit.html";
		}
		return "redirect:/academicRecords/create.html";
	}
}
