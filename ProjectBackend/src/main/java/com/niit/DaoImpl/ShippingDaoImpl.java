package com.niit.DaoImpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.niit.Dao.ShippingDao;
import com.niit.model.Shipping;

@Repository("shippingDao")
@EnableTransactionManagement
@Transactional
public class ShippingDaoImpl implements ShippingDao
{	
	@Autowired
	SessionFactory sessionFactory;

	public ShippingDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean saveorupdate(Shipping ship) {
		sessionFactory.getCurrentSession().saveOrUpdate(ship);
		return true;
	}

	@Override
	public boolean delete(Shipping ship) {
		sessionFactory.getCurrentSession().delete(ship);
		return true;
	}

	@Override
	public Shipping get(String shipngId) {
		String n1 = "from Shipping where shipId='" + shipngId + "'";
		Query w = sessionFactory.getCurrentSession().createQuery(n1);
		List<Shipping> list = (List<Shipping>) w.list();
		if (list == null || list.isEmpty()) 
		{
			return null;
		}
		   return list.get(0);
	}

	@Override
	public List<Shipping> list() {
		List<Shipping> ships = (List<Shipping>) sessionFactory.getCurrentSession().createCriteria(Shipping.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

		return ships;

	}
	@Override
	public List<Shipping> getaddbyuser(String u_id) {
		String q1 ="from Shipping where uid='"+u_id+"'";
		Query w = sessionFactory.getCurrentSession().createQuery(q1);
		@SuppressWarnings("unchecked")
		List<Shipping> list = (List<Shipping>) w.list();
		if (list == null || list.isEmpty()) {
			return null;
		}
		return list;
		}


}



