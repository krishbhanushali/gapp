package gapp.web.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import gapp.model.User;
import gapp.model.dao.UserDao;

@Controller
public class HomeController {

	@Autowired
	UserDao userDao;

	@RequestMapping("/home.html")
	public String index() {
		return "home";
	}

	@RequestMapping(value = "home.html", method = RequestMethod.POST)
	public String getCredentials(HttpServletRequest request,@RequestParam String emailID, @RequestParam String password, ModelMap models) {
		try {
			if (userDao.getUserByEmailAndPassword(emailID, password) != null) {

				int roleID = userDao.getUserByEmailAndPassword(emailID, password).getRole().getRoleID();
				User user = userDao.getUserByEmailAndPassword(emailID, password);
				HttpSession session = request.getSession(true);
				session.setAttribute("user", user);
				if (roleID == 1)
					return "redirect:admin/index.html";
				if (roleID == 2)
					return "redirect:staff/index.html";
				if (roleID == 3)
					return "redirect:student/index.html";
			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		models.put("error", "Incorrect username or password");
		return "home";
	}
}
