package com.niit.DaoImpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;


import com.niit.Dao.OrderItemsDao;
import com.niit.model.OrderItems;

@Repository("OrderItemsDao")
@EnableTransactionManagement
@Transactional
public class OrderItemsDaoImpl implements OrderItemsDao{

	@Autowired
	SessionFactory sessionFactory;

	public OrderItemsDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Transactional
	public boolean saveorupdate(OrderItems ordit) 
	{
		sessionFactory.getCurrentSession().saveOrUpdate(ordit);
		return true;
	}
	@Transactional
	public boolean delete(OrderItems ordit){
		sessionFactory.getCurrentSession().delete(ordit);
		return true;
	}
	@Transactional
	public OrderItems get(String orderitmid) {
		String h1 = "from OrderItems where orditId='" + orderitmid + "'";
		Query w = sessionFactory.getCurrentSession().createQuery(h1);
		List<OrderItems> list = (List<OrderItems>) w.list();
		if (list == null || list.isEmpty()) 
		{
			return null;
		}
		   return list.get(0);
	   }
	
	@Transactional
	public List <OrderItems> list(){
		List<OrderItems> orderitms = (List<OrderItems>) sessionFactory.getCurrentSession().createCriteria(OrderItems.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

		return orderitms;
	}
		
	}


