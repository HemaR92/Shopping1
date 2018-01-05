package com.niit.DaoImpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import com.niit.Dao.OrderDao;
import com.niit.model.Order;

@Repository("OrderDao")
@EnableTransactionManagement
@Transactional
public class OrderDaoImpl implements OrderDao{

	@Autowired
	SessionFactory sessionFactory;

	public OrderDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Transactional
	public boolean saveorupdate(Order ord) 
	{
		sessionFactory.getCurrentSession().saveOrUpdate(ord);
		return true;
	}
	@Transactional
	public boolean delete(Order ord){
		sessionFactory.getCurrentSession().delete(ord);
		return true;
	}
	@Transactional
	public Order get(String orderid) {
		String v1 = "from Order where ordId='" + orderid + "'";
		Query w = sessionFactory.getCurrentSession().createQuery(v1);
		List<Order> list = (List<Order>) w.list();
		if (list == null || list.isEmpty()) 
		{
			return null;
		}
		   return list.get(0);
	   }
	
	@Transactional
	public List <Order> list(){
		List<Order> orders = (List<Order>) sessionFactory.getCurrentSession().createCriteria(Order.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

		return orders;
	}
		
	}


