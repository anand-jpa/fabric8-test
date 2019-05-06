package com.eshop.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.eshop.dao.CartDAO;
import com.eshop.model.Cart;
import com.eshop.model.Category;

@Repository
@Transactional
public class CartDAOImpl implements CartDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public Cart createCart(String sessionId, int userId) {
		Session session = sessionFactory.getCurrentSession();
		Cart cart = new Cart(0, sessionId, userId);
		session.saveOrUpdate(cart);
		session.flush();
		return cart;
	}

	public Cart getCartById(int cartId) {
		Session session = sessionFactory.getCurrentSession();
		Cart cart = (Cart) session.get(Cart.class, cartId);
		session.flush();
		if (cart != null) {
			return cart;
		}
		return null;
	}

	public Cart getCartBySessionId(String sessionId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = sessionFactory.getCurrentSession().createQuery("from Cart where sessionId=:name");
		query.setParameter("name", sessionId);
		Cart cart = (Cart) query.uniqueResult();
		session.flush();
		return cart;
	}

	public boolean saveCart(Cart cart) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(cart);
		session.flush();
		return true;
	}

	public void update(Cart cart) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(cart);
		session.flush();
	}

}
