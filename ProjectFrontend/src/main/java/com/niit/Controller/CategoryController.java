package com.niit.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.Dao.CategoryDao;
import com.niit.Dao.ProductDao;
import com.niit.model.Category;
import com.niit.model.Product;


@Controller
public class CategoryController {
	@Autowired
	Category category;
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	Product product;
	@Autowired
	ProductDao productDao;
	@RequestMapping("/category")
	public ModelAndView categoryform() 
	{
		List<Category> categories=categoryDao.list(); 
		ModelAndView obj = new ModelAndView("addcategory");
		obj.addObject("cat", new Category());
		obj.addObject("categories",categories);
		return obj;
	}

	@RequestMapping(value="/addcategory", method=RequestMethod.POST)
	public ModelAndView addcategory(@ModelAttribute("cat")Category category ) {
		ModelAndView obj = new ModelAndView("redirect:/category");
		if(categoryDao.saveorupdate(category))
		{
	       obj.addObject("msg","category is added successfuly");  		
		}
		else
		{
			obj.addObject("msg","Sorry");
		}
		return obj;
	}
	@RequestMapping("/editcategory/{CatId}")
	public ModelAndView edditcategory(@PathVariable("CatId")String id)
	{
		System.out.println(123);
		List<Category> categories=categoryDao.list();
		ModelAndView obj = new ModelAndView("addcategory");
		category=categoryDao.get(id);
		obj.addObject("categories",categories);
		obj.addObject("cat",category);
		return obj;
		
	}
	@RequestMapping("/deletecategory/{catId}")
	public ModelAndView deletecategory(@PathVariable("catId")String catId)
	{
		ModelAndView obj=new ModelAndView("redirect:/category");
		category=categoryDao.get(catId);

				List<Product> lists= productDao.getProductByCategory("category");
				if(lists==null||lists.isEmpty())
				{	
					categoryDao.delete(category);
					obj.addObject("msg","category is deleted successfuly");
				}
				else
				{
					for(Product p: lists)
					{
						productDao.delete(p);
					}
					categoryDao.delete(category);
					obj.addObject("msg","category and product is deleted successfuly");
				}	
				return obj;
				}
}
