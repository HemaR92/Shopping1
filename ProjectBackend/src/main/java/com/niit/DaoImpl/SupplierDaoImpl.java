package com.niit.DaoImpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.niit.Dao.SupplierDao;
import com.niit.model.Supplier;

@Repository("supplierDao")
@EnableTransactionManagement
@Transactional
public class SupplierDaoImpl implements SupplierDao
{	
	@Autowired
	SessionFactory sessionFactory;

	public SupplierDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean saveorupdate(Supplier sup) {
		sessionFactory.getCurrentSession().saveOrUpdate(sup);
		return true;
	}

	@Override
	public boolean delete(Supplier sup) {
		sessionFactory.getCurrentSession().delete(sup);
		return true;
	}

	@Override
	public Supplier get(String supId) {
		String q1 = "from Supplier where supId='" + supId + "'";
		Query w = sessionFactory.getCurrentSession().createQuery(q1);
		List<Supplier> list = (List<Supplier>) w.list();
		if (list == null || list.isEmpty()) 
		{
			return null;
		}
		   return list.get(0);
	}

	@Override
	public List<Supplier> list() {
		List<Supplier> sup = (List<Supplier>) sessionFactory.getCurrentSession().createCriteria(Supplier.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

		return sup;

	}

}
