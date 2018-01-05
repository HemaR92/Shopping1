package com.niit.DaoImpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.niit.Dao.ProductDao;
import com.niit.model.Product;

@Repository("productDao")
@EnableTransactionManagement
@Transactional

public class ProductDaoImpl implements ProductDao{

	@Autowired
	SessionFactory sessionFactory;

	public ProductDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public boolean saveorupdate(Product prod) {
		sessionFactory.getCurrentSession().saveOrUpdate(prod);
		return true;
	}

	@Override
	public boolean delete(Product prod) {
		sessionFactory.getCurrentSession().delete(prod);
		return true;
	}

	@Override
	public Product get(String prodId) {
		String q1 = "from Product where prodId='" + prodId + "'";
		Query w = sessionFactory.getCurrentSession().createQuery(q1);
		List<Product> list = (List<Product>) w.list();
		if (list == null || list.isEmpty()) 
		{
			return null;
		}
		   return list.get(0);
	}

	@Override
	public List<Product> getProductByCategory(String Id) {
		String q1 = "from Product where catId='" + Id + "'";
		Query w = sessionFactory.getCurrentSession().createQuery(q1);
		List<Product> list1 = (List<Product>) w.list();
		if (list1 == null || list1.isEmpty()) 
		{
			return null;
		}
		   return (List<Product>) list1.get(0);
	}

	@Override
	public List<Product> getProductBySupplier(String Id) {
		String q1 = "from Product where supId='" + Id + "'";
		Query w = sessionFactory.getCurrentSession().createQuery(q1);
		List<Product> list2 = (List<Product>) w.list();
		if (list2 == null || list2.isEmpty()) 
		{
			return null;
		}
		   return (List<Product>) list2.get(0);
	}

	@Override
	public List<Product> list() {
		List<Product> prod = (List<Product>) sessionFactory.getCurrentSession().createCriteria(Product.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

		return prod;
	}

}
