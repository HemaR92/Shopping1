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
import com.niit.Dao.SupplierDao;
import com.niit.fileinput.FileInput;
import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.model.Supplier;
@Controller
public class ProductController {
	@Autowired
	Product product;
	@Autowired
	ProductDao productDao;
	@Autowired
	Category category;
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	Supplier supplier;
	@Autowired
	SupplierDao supplierDao;
	
	String path="D:\\EclipseProjectWorkspace3\\ProjectFrontend\\src\\main\\webapp\\resources\\images\\";
	
	@RequestMapping("/product")
	public ModelAndView productform() 
	{
		List<Product> listproduct=productDao.list();
		List<Category> listcategory=categoryDao.list();
		List<Supplier> listsupplier=supplierDao.list();
		ModelAndView obj = new ModelAndView("addproduct");
		obj.addObject("product", new Product());
		obj.addObject("products",listproduct);
		obj.addObject("categories", listcategory);
		obj.addObject("suppliers", listsupplier);
		
		return obj;
	}

	@RequestMapping(value="/addproduct", method=RequestMethod.POST)
	public ModelAndView addproduct(@ModelAttribute("product")Product product ) {
		ModelAndView obj = new ModelAndView("redirect:/product");
		if(productDao.saveorupdate(product))
		{
			FileInput.upload(path, product.getPimg(), product.getProdId()+".jpg");
	       obj.addObject("msg","product is added successfuly");  
	       
		}
		else
		{
			obj.addObject("msg","Sorry");
		}
		return obj;
	}
	@RequestMapping("/editproduct/{prodId}")
	public ModelAndView edit(@PathVariable("prodId")String id)
	{
		System.out.println(123);
		List<Category> listcategory=categoryDao.list();
		List<Supplier> listsupplier=supplierDao.list();
		List<Product>listproduct=productDao.list();
		ModelAndView obj = new ModelAndView("addproduct");
		product=productDao.get(id);
		obj.addObject("categories", listcategory);
		obj.addObject("suppliers", listsupplier);
		obj.addObject("products",listproduct);
		obj.addObject("product",product);
		return obj;
		
	}
	@RequestMapping("/deleteproduct/{prodId}")
	public ModelAndView delete(@PathVariable("prodId")String id)
	{
		ModelAndView obj = new ModelAndView("redirect:/product");
		product=productDao.get(id);
		if(productDao.delete(product)==true)
		{
			obj.addObject("msg1","product deleted successfully");
		}
			else
			{
				obj.addObject("msg2","product deleted");
			}
		return obj;
		
	}
}

