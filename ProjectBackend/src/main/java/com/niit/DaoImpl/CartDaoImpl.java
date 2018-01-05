package com.niit.DaoImpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.niit.Dao.BillingDao;
import com.niit.Dao.CartDao;
import com.niit.model.Billing;
import com.niit.model.Cart;

@Repository("cartDao")
@EnableTransactionManagement
@Transactional
public class CartDaoImpl implements CartDao{

	@Autowired
	SessionFactory sessionFactory;

	public CartDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Transactional
	public boolean saveorupdate(Cart car) 
	{
		sessionFactory.getCurrentSession().saveOrUpdate(car);
		return true;
	}
	@Transactional
	public boolean delete(Cart car){
		sessionFactory.getCurrentSession().delete(car);
		return true;
	}
	@Transactional
	public Cart get(String crid) {
		String t1 = "from Cart where cartId='" + crid + "'";
		Query w = sessionFactory.getCurrentSession().createQuery(t1);
		List<Cart> list = (List<Cart>) w.list();
		if (list == null || list.isEmpty()) 
		{
			return null;
		}
		   return list.get(0);
	   }
	
	@Transactional
	public List <Cart> list(){
		List<Cart> carts = (List<Cart>) sessionFactory.getCurrentSession().createCriteria(Cart.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

		return carts;
	}
		
	}
	
