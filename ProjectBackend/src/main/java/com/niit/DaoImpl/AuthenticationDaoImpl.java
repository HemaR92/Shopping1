package com.niit.DaoImpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.niit.Dao.AuthenticationDao;
import com.niit.model.Authentication;

@Repository("authenticationDao")
@EnableTransactionManagement
@Transactional
public class AuthenticationDaoImpl implements AuthenticationDao{

	@Autowired
	SessionFactory sessionFactory;

	public AuthenticationDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public boolean saveorupdate(Authentication autn) 
	{
		sessionFactory.getCurrentSession().saveOrUpdate(autn);
		return true;
	}

	public boolean delete(Authentication authentication){
		sessionFactory.getCurrentSession().delete(authentication);
		return true;
	}
	
	public Authentication get(String autnid) {
	String q1 = "from Authentication where roleId='" + autnid + "'";
	Query n = sessionFactory.getCurrentSession().createQuery(q1);
	List<Authentication> list = (List<Authentication>) n.list();
		if (list == null || list.isEmpty()) 
		{
			return null;
		}
		   return list.get(0);
	   }
	

	public List <Authentication> list(){
		List<Authentication> authentication = (List<Authentication>) sessionFactory.getCurrentSession().createCriteria(Authentication.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

		return authentication;

		
	}
	
}
