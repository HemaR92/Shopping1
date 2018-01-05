package com.niit.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.Dao.CategoryDao;
import com.niit.Dao.ProductDao;
import com.niit.model.Category;
import com.niit.model.Product;

@Controller
public class HomeController {

	@Autowired
	Category category;
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	Product product;
	@Autowired
	ProductDao productDao;
	
	@RequestMapping("/")
	public ModelAndView productform() 
	{
		List<Product> listproduct=productDao.list();
		List<Category> categories=categoryDao.list(); 
		ModelAndView obj = new ModelAndView("home");
		obj.addObject("product", new Product());
		obj.addObject("prods",listproduct);		
		obj.addObject("cat", new Category());
		obj.addObject("categories",categories);
		return obj;
	}
	
	@RequestMapping("/kids")
	public String kids()
	{
		return "kidspage";
	}

	@RequestMapping("/dispcategory/{catId}")
	public ModelAndView dispcategory(@PathVariable("catId")String id)
	{
		List<Category> categories= categoryDao.list();
		ModelAndView obj=new ModelAndView("home");
		List<Product> lc=productDao.getProductByCategory(id);
		obj.addObject("products",lc);
		obj.addObject("cat",new Category());
		obj.addObject("lcat",categories);
		return obj;
	}
	@RequestMapping("/thankyou")
	public String thankyou()
	{
		return "thankyou";
	}
//	@RequestMapping("/viewcart")
//	public String viewcart()
//	{
//		return "viewcart";
//	}
	@RequestMapping("/orderconfirm")
	public String orderconfirm()
	{
		return "orderconfirm";
	}
	@RequestMapping("/women")
	public String women()
	{
		return "women";
	}
	@RequestMapping("/men")
	public String men()
	{
		return "men";
	}
	
	

}
