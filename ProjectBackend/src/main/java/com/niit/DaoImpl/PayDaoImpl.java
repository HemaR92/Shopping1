package com.niit.DaoImpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.niit.Dao.PayDao;
import com.niit.model.Pay;

@Repository("payDao")
@EnableTransactionManagement
@Transactional
public class PayDaoImpl implements PayDao{

	@Autowired
	SessionFactory sessionFactory;

	public PayDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Transactional
	public boolean saveorupdate(Pay paym) 
	{
		sessionFactory.getCurrentSession().saveOrUpdate(paym);
		return true;
	}
	@Transactional
	public boolean delete(Pay paym){
		sessionFactory.getCurrentSession().delete(paym);
		return true;
	}
	@Transactional
	public Pay get(String pymid) {
		String b1 = "from Pay where paymId='" + pymid + "'";
		Query w = sessionFactory.getCurrentSession().createQuery(b1);
		List<Pay> list = (List<Pay>) w.list();
		if (list == null || list.isEmpty()) 
		{
			return null;
		}
		   return list.get(0);
	   }
	
	@Transactional
	public List <Pay> list(){
		List<Pay> pays = (List<Pay>) sessionFactory.getCurrentSession().createCriteria(Pay.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

		return pays;
	}
		
	}
	





