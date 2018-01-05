package com.niit.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.Dao.ProductDao;
import com.niit.Dao.SupplierDao;
import com.niit.model.Product;
import com.niit.model.Supplier;

@Controller
public class SupplierController {
	@Autowired
	Supplier supplier;
	@Autowired
	SupplierDao supplierDao;
	@Autowired
	Product product;
	@Autowired
	ProductDao productDao;
	@RequestMapping("/supplier")
	public ModelAndView supplierform() 
	{
		List<Supplier> listsupplier=supplierDao.list(); 
		ModelAndView obj = new ModelAndView("addsupplier");
		obj.addObject("supplier", new Supplier());
		obj.addObject("suppliers",listsupplier);
		return obj;
	}

	@RequestMapping(value="/addsupplier", method=RequestMethod.POST)
	public ModelAndView addsupplier(@ModelAttribute("supplier")Supplier supplier ) {
		ModelAndView obj = new ModelAndView("redirect:/supplier");
		if(supplierDao.saveorupdate(supplier))
		{
	       obj.addObject("msg","supplier is added successfuly");  		
		}
		else
		{
			obj.addObject("msg","Sorry");
		}
		return obj;
	}
	@RequestMapping("/editsupplier/{supId}")
	public ModelAndView edit(@PathVariable("supId")String id)
	{
		System.out.println(123);
		List<Supplier>listsupplier=supplierDao.list();
		ModelAndView obj = new ModelAndView("addsupplier");
		supplier=supplierDao.get(id);
		obj.addObject("suppliers",listsupplier);
		obj.addObject("supplier",supplier);
		return obj;
		
	}
	@RequestMapping("/deletesupplier/{supId}")
	public ModelAndView deletesupplier(@PathVariable("supId")String SupId)
	{
		ModelAndView obj=new ModelAndView("redirect:/supplier");
		supplier=supplierDao.get(SupId);

				List<Product> lists= productDao.getProductBySupplier("supplier");
				if(lists==null||lists.isEmpty())
				{	
					supplierDao.delete(supplier);
					obj.addObject("msg","supplier is deleted successfuly");
				}
				else
				{
					for(Product p: lists)
					{
						productDao.delete(p);
					}
					supplierDao.delete(supplier);
					obj.addObject("msg","supplier and product is deleted successfuly");
				}	
				return obj;
				}
}

