package com.niit.DaoImpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import com.niit.Dao.CartItemsDao;
import com.niit.model.CartItems;

@Repository("cartItemsDao")
@EnableTransactionManagement
@Transactional
public class CartItemsDaoImpl implements CartItemsDao{

	@Autowired
	SessionFactory sessionFactory;

	public CartItemsDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Transactional
	public boolean saveorupdate(CartItems crtms) 
	{
		sessionFactory.getCurrentSession().saveOrUpdate(crtms);
		return true;
	}
	@Transactional
	public boolean delete(String crtId){
		CartItems ci= new CartItems();
		ci.setCarId(crtId);
		sessionFactory.getCurrentSession().delete(ci);
		return true;
	}
	@Transactional
	public CartItems get(String crtid) {
		String k1 = "from CartItems where carId='" + crtid + "'";
		Query w = sessionFactory.getCurrentSession().createQuery(k1);
		List<CartItems> list = (List<CartItems>) w.list();
		if (list == null || list.isEmpty()) 
		{
			return null;
		}
		   return list.get(0);
	   }
	
	@Transactional
	public List <CartItems> list(){
		List<CartItems> cartitms = (List<CartItems>) sessionFactory.getCurrentSession().createCriteria(CartItems.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

		return cartitms;
	}
		

	@Override
	public List<CartItems> getlist(String cartId)
	{
		String Sq1="from CartItems where cartId='"+cartId+"'";
		Query q1=sessionFactory.getCurrentSession().createQuery(Sq1);
		@SuppressWarnings("unchecked")
		List<CartItems> list=(List<CartItems>)q1.list();
		if(list==null||list.isEmpty())
		{
			System.out.println("Item is not found");
			return null;
		}
		else
		{
			return list;
		}
		
	}

	@Override
	public CartItems getlistall(String cartId, String pro) {
		String sql= "from CartItems where cartId='" +cartId+ "'and p_id ='" +pro+ "'";
		Query q1= sessionFactory.getCurrentSession().createQuery(sql);
		@SuppressWarnings("unchecked")
		List<CartItems> list=(List<CartItems>) q1.list();
		if(list==null || list.isEmpty()){
			System.out.println("Item is not found");
			return null;
		}
		else
		{
			return list.get(0);
		}
	}

}
