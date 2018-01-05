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
import com.niit.model.Billing;
@Repository("billingDao")
@EnableTransactionManagement
@Transactional
public class BillingDaoImpl implements BillingDao{

	@Autowired
	SessionFactory sessionFactory;

	public BillingDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Transactional
	public boolean saveorupdate(Billing bill) 
	{
		sessionFactory.getCurrentSession().saveOrUpdate(bill);
		return true;
	}
	@Transactional
	public boolean delete(Billing billing){
		sessionFactory.getCurrentSession().delete(billing);
		return true;
	}
	@Transactional
	public Billing get(String bid) {
		String f1 = "from Billing where uid='" +bid + "'";
		Query w = sessionFactory.getCurrentSession().createQuery(f1);
		List<Billing> list = (List<Billing>) w.list();
		if (list == null || list.isEmpty()) 
		{
			return null;
		}
		   return list.get(0);
	   }
	
	@Transactional
	public List <Billing> list(){
		List<Billing> billings = (List<Billing>) sessionFactory.getCurrentSession().createCriteria(Billing.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

		return billings;

		
	}
	
}


