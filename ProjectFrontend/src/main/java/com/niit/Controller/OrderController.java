package com.niit.Controller;

	import java.util.List;

	import javax.servlet.http.HttpSession;

	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.mail.SimpleMailMessage;
	import org.springframework.mail.javamail.JavaMailSender;
	import org.springframework.security.authentication.AnonymousAuthenticationToken;
	import org.springframework.security.core.Authentication;
	import org.springframework.security.core.context.SecurityContextHolder;
	import org.springframework.stereotype.Controller;
	import org.springframework.ui.Model;
	import org.springframework.web.bind.annotation.ModelAttribute;
	import org.springframework.web.bind.annotation.PathVariable;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestMethod;
	import org.springframework.web.bind.annotation.RequestParam;

import com.niit.Dao.BillingDao;
import com.niit.Dao.CardDao;
import com.niit.Dao.CartDao;
import com.niit.Dao.CartItemsDao;
import com.niit.Dao.OrderDao;
import com.niit.Dao.OrderItemsDao;
import com.niit.Dao.PayDao;
import com.niit.Dao.ProductDao;
import com.niit.Dao.ShippingDao;
import com.niit.Dao.UserDao;
import com.niit.OtpGenerator.OtpGenerator;
import com.niit.model.Billing;
import com.niit.model.Card;
import com.niit.model.Cart;
import com.niit.model.CartItems;
import com.niit.model.Order;
import com.niit.model.OrderItems;
import com.niit.model.Pay;
import com.niit.model.Product;
import com.niit.model.Shipping;
import com.niit.model.User;

	@Controller
	public class OrderController {


		@Autowired
		Cart cart;
		@Autowired
		CartDao cartDao;
		@Autowired
		CartItems cartItems;
		@Autowired
		CartItemsDao cartItemsDao;
		@Autowired
		Card card;
		@Autowired
		CardDao cardDao;
		@Autowired
		Billing billing;
		@Autowired
		BillingDao billingDao;
		@Autowired
		Shipping shipping;
		@Autowired
		ShippingDao shippingDao;
		@Autowired
		Pay pay;
		@Autowired
		PayDao payDao;
		@Autowired
		Order order;
		@Autowired
		OrderDao orderDao;
		@Autowired
		OrderItems orderItems;
		@Autowired
		OrderItemsDao orderItemsDao;
		@Autowired
		Product product;
		@Autowired
		ProductDao productDao;
		@Autowired
		User user;
		@Autowired
		UserDao userDao;
		@Autowired
		List<CartItems> cartItems1;
		
		@Autowired
	    private JavaMailSender mailSender;
		
		String o;
		
		
		@RequestMapping("/Buyall")
		public String orderall(Model model,HttpSession session) {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			if (!(authentication instanceof AnonymousAuthenticationToken)) {
				String currusername = authentication.getName();
				user = userDao.getUseremail(currusername);
				cart = user.getCart();
				
				
//				session.setAttribute("products", product1);			
				cartItems= cartItemsDao.get(cart.getCartId());
			
					
					billing = billingDao.get(user.getUid());
					List<Shipping> shippingAddresies = shippingDao.getaddbyuser(user.getUid());
					
					model.addAttribute("billing", billing);
					model.addAttribute("user", user);
					model.addAttribute("shippingAddresies", shippingAddresies);
					model.addAttribute("shippingAddress", new Shipping());
					session.setAttribute("p", product);
				}
				return "addressorder";
			} 
		
		

		@RequestMapping("/Buy/{p_id}/{ci_id}")
		public String order(@PathVariable("p_id") String id, Model model,HttpSession session) {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			if (!(authentication instanceof AnonymousAuthenticationToken)) {
				String currusername = authentication.getName();
				user = userDao.getUseremail(currusername);
				cart = user.getCart();
				cartItems=null;
				product = productDao.get(id);
				billing = billingDao.get(user.getUid());
				
				System.out.println(billing.getCountry());
//				for(Billing b: billing)
//				{
//					System.out.println(b.getBillId());
//					System.out.println(b.getCountry());
//				}
				List<Shipping> shippingAddresies = shippingDao.getaddbyuser(user.getUid());
				user.setBilling(billing);
				model.addAttribute("billing", billing);
				model.addAttribute("user", user);
				model.addAttribute("shippingAddresies", shippingAddresies);
				model.addAttribute("shippingAddress", new Shipping());
				session.setAttribute("p", product);
				return "addressorder";
			} else {
				return "redirect:/";
			}

		}

		@RequestMapping("/orderConfirm")
		public String payment(@ModelAttribute("shippingAddress") Shipping sh, Model model) {
//			if(cartItems==null || cartItems.isEmpty())
//			{
//				System.out.println("sorry");
//			}
			sh.setUser(user);
			shipping = sh;
			model.addAttribute("billing", billing);
			model.addAttribute("shippingAddress", shipping);
			model.addAttribute("prot", product);
			model.addAttribute("cartItems",cartItems);
			model.addAttribute("cart",cart);
			return "orderconfirm";
		}

		@RequestMapping("/previous")
		public String previous(Model model) {
			List<Shipping> shippingAddresies = shippingDao.getaddbyuser(user.getUid());
			model.addAttribute("shippingAddresies", shippingAddresies);
			model.addAttribute("billing", billing);
			model.addAttribute("shippingAddress", shipping);
			model.addAttribute("product", product);
			
			return "addressorder";
		}

		@RequestMapping("/pay")
		public String pay(Model model) {
			List<Card> cards = cardDao.getcardbyuser(user.getUid());
			model.addAttribute("cards", cards);
			model.addAttribute("card", new Card());
			return "payment";
		}

		
		
		@RequestMapping("/payment")
		public String paymet(@ModelAttribute("card") Card car,@RequestParam("otp") String otp,Model model) {
			int a;
			if(otp==null)
				a=2;
			else 
				a=1;
			switch (a) {
			case 1:
				if(otp.equals(o))
			     {
					pay.setPaymentmethod("COD");
					  pay.setPaymentstatus("NO");
					  break;	
			     }
				else{
					return "redirect:/pay";
					
				}
			case 2:
				
				pay.setPaymentmethod("Card");
				pay.setPaymentstatus("yes");
				payDao.saveorupdate(pay);
				cardDao.saveorupdate(car);
				break;
			}

			return "redirect:/orderconformation";
		}
		
		
		
		
//		@RequestMapping("/payment")
//		public String payment(@RequestParam("payb2") String str, Model model) {
//					
//	 		System.out.println(1324);
//			int a;
//			System.out.println(str);
//			if(str.equals(o))
//			{
//				return "redirect:/thankyou" ;	
//			}
//					
//	return "redirect:/orderconfirmation";
//		}

		@RequestMapping("/orderconfirmation")
		public String orderconformation(HttpSession session) {
			System.out.println(32);
			order.setBilling(billing);
			order.setShipping(shipping);
			order.setPay(pay);
			order.setUser(user);
			System.out.println(524);
			if (cartItems == null) 
			{
				order.setGrandtotal(product.getPrice());
				orderDao.saveorupdate(order);
				orderItems.setOrder(order);
				orderItems.setProductid(product.getProdId());
				orderItemsDao.saveorupdate(orderItems);
				cart.setGrandtotal(cart.getGrandtotal() - cartItems.getPrice());
				cart.setTotalitem(cart.getTotalitem() - 1);
				session.setAttribute("items", cart.getTotalitem());
				cartDao.saveorupdate(cart);
				cartItemsDao.delete(cartItemsDao.getlistall(cart.getCartId(),product.getProdId()).getCarId());
				System.out.println(324);
			}
			else
			{ 
				System.out.println(656);
				order.setGrandtotal(cart.getGrandtotal());
				orderDao.saveorupdate(order);
				for(CartItems c:cartItems1)
				{
					System.out.println(3444);
					orderItems.setOrder(order);
					orderItems.setProductid(c.getProduct().getProdId());
					System.out.println(3443);
					orderItemsDao.saveorupdate(orderItems);
					cartItemsDao.delete(c.getCarId());
				}
				cart.setGrandtotal(0.0);
				cart.setTotalitem(0);
				System.out.println(346);
				session.setAttribute("items", cart.getTotalitem());
				cartDao.saveorupdate(cart);
			}
			cartItems=null;
			cartItems1=null;
			product=null;
			order=new Order();
			orderItems=new OrderItems();
			System.out.println(565);
			return "thankyou";
		}

	@RequestMapping(value="/SendMail")
	public void SendMail() {
		System.out.println(21312);
	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	if (!(authentication instanceof AnonymousAuthenticationToken)) {
		String currusername = authentication.getName();
		user = userDao.getUseremail(currusername);      
		OtpGenerator ot=new OtpGenerator();
//		String o=ot.Otpga();
		o=ot.Otpga();
		String recipientAddress = user.getUmail();
		String subject="OTP";
	//String subject = request.getParameter("subject");
	String message = "your one time password is "+o+" ";

	// prints debug info
	System.out.println("To:" + recipientAddress);
	System.out.println("Subject: " + subject);
	System.out.println("Message: " + message);

	    
	//System.out.println("OTP:"+ otp);
	// creates a simple e-mail object
	SimpleMailMessage email = new SimpleMailMessage();
	email.setTo(recipientAddress);
	email.setSubject(subject);
	email.setText(message);
	//email.setSubject(otp);
	// sends the e-mail
	mailSender.send(email);

	 
	// forwards to the view named "Result"
	//return "Result";
	}
	}
	}

