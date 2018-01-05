package com.niit.DaoImpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.niit.Dao.CardDao;
import com.niit.model.Card;


@Repository("cardDao")
@EnableTransactionManagement
@Transactional
public class CardDaoImpl implements CardDao{

	@Autowired
	SessionFactory sessionFactory;

	public CardDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Transactional
	public boolean saveorupdate(Card crd) 
	{
		sessionFactory.getCurrentSession().saveOrUpdate(crd);
		return true;
	}
	@Transactional
	public boolean delete(Card crd){
		sessionFactory.getCurrentSession().delete(crd);
		return true;
	}
	@Transactional
	public Card get(String crdid) {
		String h1 = "from Card where crId='" + crdid + "'";
		Query w = sessionFactory.getCurrentSession().createQuery(h1);
		List<Card> list = (List<Card>) w.list();
		if (list == null || list.isEmpty()) 
		{
			return null;
		}
		   return list.get(0);
	   }
	
	@Transactional
	public List <Card> list(){
		List<Card> cards = (List<Card>) sessionFactory.getCurrentSession().createCriteria(Card.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

		return cards;
	}
	
	@Transactional
	public List<Card> getcardbyuser(String uid) {
		String q1 ="from Card where uid='"+uid+"'";
		Query w = sessionFactory.getCurrentSession().createQuery(q1);
		@SuppressWarnings("unchecked")
		List<Card> list = (List<Card>) w.list();
		if (list == null || list.isEmpty()) {
			return null;
		}
		return list;
	}

		
	}
	


