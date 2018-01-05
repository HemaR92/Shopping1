package com.niit.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.niit.Dao.UserDao;
import com.niit.model.Billing;
import com.niit.model.Cart;
import com.niit.model.User;
@Controller
public class UserController {
	@Autowired
	User user;
	@Autowired
	UserDao userDao;
	@Autowired
	Billing billing;
	@RequestMapping("/signup")
	public ModelAndView userform() 
	{
		List<User> listuser=userDao.list(); 
		ModelAndView obj = new ModelAndView("signup");
		user.setBilling(billing);
		obj.addObject("user", new User());
		obj.addObject("users",listuser);
		return obj;
	}

	@RequestMapping(value="/adduser", method=RequestMethod.POST)
	public ModelAndView adduser(@ModelAttribute("user")User user ) {
		ModelAndView obj = new ModelAndView("redirect:/");
		Cart cart= new Cart();
		user.setCart(cart);
		
		if(userDao.saveorupdate(user))
		{
	       obj.addObject("msg","user is added successfuly");  		
		}
		else
		{
			obj.addObject("msg","Sorry");
		}
		return obj;
	}
	
}


