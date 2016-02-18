package gapp.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import gapp.model.Role;
import gapp.model.User;
import gapp.model.dao.RoleDao;
import gapp.model.dao.UserDao;

@Controller
public class UserController {

    @Autowired
    private UserDao userDao;
    
    @Autowired
    private RoleDao roleDao;

    @RequestMapping("/users.html")
    public String users( ModelMap models )
    {
        models.put( "users", userDao.getUsers() );
        return "users";
    }
    
    @RequestMapping(value = "/user/register.html", method = RequestMethod.GET)
	public String register(ModelMap models,@RequestParam(value="error",required=false) String error) {
    	if(error!=null)
    	{
    		if(error.equals("1"))
    		{
    			error = "Email ID is already registered.";
    		}
    		else
    			return "user/register";
    	}
    	else
    		error=null;
    	models.put("error", error);
		models.put("users", new User());
		return "user/register";
	}

	@RequestMapping(value = "/user/register.html", method = RequestMethod.POST)
	public String register(@RequestParam String firstName,@RequestParam String lastName,@RequestParam 
			String emailID, @RequestParam String password, ModelMap models) {
		if(userDao.getUserByEmail(emailID)==null)
		{
			User user = new User();
			Role role = new Role();
			role = roleDao.getRole(3);
			user.setPassword(password);
			user.setLastName(lastName);
			user.setRole(role);
			user.setFirstName(firstName);
			user.setEmailID(emailID);
			userDao.save(user);
			return "redirect:/home.html";
		}
		models.put("error", "1");
		return "redirect:register.html";
	}
	
	@RequestMapping(value="/logout.html")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:home.html";
	}
}