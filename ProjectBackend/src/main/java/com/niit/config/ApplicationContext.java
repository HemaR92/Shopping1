package com.niit.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.niit.Dao.AuthenticationDao;
import com.niit.Dao.BillingDao;
import com.niit.Dao.CardDao;
import com.niit.Dao.CartDao;
import com.niit.Dao.CartItemsDao;
import com.niit.Dao.CategoryDao;
import com.niit.Dao.OrderDao;
import com.niit.Dao.OrderItemsDao;
import com.niit.Dao.PayDao;
import com.niit.Dao.ProductDao;
import com.niit.Dao.ShippingDao;
import com.niit.Dao.SupplierDao;
import com.niit.Dao.UserDao;
import com.niit.DaoImpl.AuthenticationDaoImpl;
import com.niit.DaoImpl.BillingDaoImpl;
import com.niit.DaoImpl.CardDaoImpl;
import com.niit.DaoImpl.CartDaoImpl;
import com.niit.DaoImpl.CartItemsDaoImpl;
import com.niit.DaoImpl.CategoryDaoImpl;
import com.niit.DaoImpl.OrderDaoImpl;
import com.niit.DaoImpl.OrderItemsDaoImpl;
import com.niit.DaoImpl.PayDaoImpl;
import com.niit.DaoImpl.ProductDaoImpl;
import com.niit.DaoImpl.ShippingDaoImpl;
import com.niit.DaoImpl.SupplierDaoImpl;
import com.niit.DaoImpl.UserDaoImpl;
import com.niit.model.Authentication;
import com.niit.model.Billing;
import com.niit.model.Card;
import com.niit.model.Cart;
import com.niit.model.CartItems;
import com.niit.model.Category;
import com.niit.model.Order;
import com.niit.model.OrderItems;
import com.niit.model.Pay;
import com.niit.model.Product;
import com.niit.model.Shipping;
import com.niit.model.Supplier;
import com.niit.model.User;


@Configuration
@ComponentScan("com.niit.*")
@EnableTransactionManagement
public class ApplicationContext 
{
	@Bean("dataSource")
	public DataSource getDataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("org.h2.Driver");
		dataSource.setUrl("jdbc:h2:tcp://localhost/~/test/trendyproj");
		dataSource.setUsername("sa");
		dataSource.setPassword("sa");
		return dataSource;
}
	private Properties getHibernateProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.connection.pool_size", "10");
		properties.put("hibernate.hbm2ddl.auto", "update");
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
		return properties;
	}
	
	@Autowired
	@Bean("sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource) {
		LocalSessionFactoryBuilder sessionBuilder = new LocalSessionFactoryBuilder(dataSource);
		sessionBuilder.addProperties(getHibernateProperties());
		sessionBuilder.addAnnotatedClass(Category.class);
		sessionBuilder.addAnnotatedClass(Supplier.class);
		sessionBuilder.addAnnotatedClass(Product.class);
		sessionBuilder.addAnnotatedClass(User.class);
		sessionBuilder.addAnnotatedClass(Cart.class);
		sessionBuilder.addAnnotatedClass(CartItems.class);
		sessionBuilder.addAnnotatedClass(Authentication.class);
		sessionBuilder.addAnnotatedClass(Billing.class);
		sessionBuilder.addAnnotatedClass(Shipping.class);
		sessionBuilder.addAnnotatedClass(Order.class);
		sessionBuilder.addAnnotatedClass(OrderItems.class);
		sessionBuilder.addAnnotatedClass(Card.class);
		sessionBuilder.addAnnotatedClass(Pay.class);
		
		return sessionBuilder.buildSessionFactory();
	}
	
	@Autowired
	@Bean("transactionManager")
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
		return transactionManager;
	}

	@Autowired
	@Bean("categoryDao")
	public CategoryDao getCategoryDao(SessionFactory sessionFactory) {
		return new CategoryDaoImpl(sessionFactory);
	}

	@Autowired
	@Bean("supplierDao")
	public SupplierDao getSupplierDao(SessionFactory sessionFactory) {
		return new SupplierDaoImpl(sessionFactory);
	}

	@Autowired
	@Bean("productDao")
	public ProductDao getProductDao(SessionFactory sessionFactory) {
		return new ProductDaoImpl(sessionFactory);

	}

	@Autowired
	@Bean("userDao")
	public UserDao getUserDao(SessionFactory sessionFactory) {
		return new UserDaoImpl(sessionFactory);
	}
	
	@Autowired
	@Bean("cartDao")
	public CartDao getCartDao(SessionFactory sessionFactory) {
		return new CartDaoImpl(sessionFactory);
	}
	
	@Autowired
	@Bean("cartItemsDao")
	public CartItemsDao getCartItemDao(SessionFactory sessionFactory) {
		return new CartItemsDaoImpl(sessionFactory);
	}
	@Autowired
	@Bean("authenticationDao")
	public AuthenticationDao getAuthenticationDao(SessionFactory sessionFactory) {
		return new AuthenticationDaoImpl(sessionFactory);
	}
	
	@Autowired
	@Bean("billingDao")
	public BillingDao getBillingDao(SessionFactory sessionFactory) {
		return new BillingDaoImpl(sessionFactory);
	}
	
	@Autowired
	@Bean("shippingAddressDao")
	public ShippingDao getShippingAddressDao(SessionFactory sessionFactory) {
		return new ShippingDaoImpl(sessionFactory);
	}
	
	@Autowired
	@Bean("orderDao")
	public OrderDao getOrderDao(SessionFactory sessionFactory) {
		return new OrderDaoImpl(sessionFactory);
	}
	
	@Autowired
	@Bean("orderItemsDao")
	public OrderItemsDao getOrderItemsDao(SessionFactory sessionFactory) {
		return new OrderItemsDaoImpl(sessionFactory);
	}
	
	@Autowired
	@Bean("cardDao")
	public CardDao getCardDao(SessionFactory sessionFactory) {
		return new CardDaoImpl(sessionFactory);
	}
	
	@Autowired
	@Bean("payDao")
	public PayDao getPayDao(SessionFactory sessionFactory) {
		return new PayDaoImpl(sessionFactory);
	}
	
	

}