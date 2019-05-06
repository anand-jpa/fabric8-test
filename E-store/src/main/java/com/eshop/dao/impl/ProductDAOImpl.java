package com.eshop.dao.impl;

/**
* ProductDAOImpl provides implementation for ProductDAO interface
*
* @author  Navinkumar
* @email   navinkumar.boddu@in.fujitsu.com
*/

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eshop.dao.ProductDAO;
import com.eshop.model.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public Product findProductById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Product product = (Product) session.get(Product.class, id);
		session.flush();
		if (product != null) {
			return product;
		}
		return null;
	}

	public List<Product> getProductList() {
		String sql = "from Product";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(sql);
		List<Product> productList = (List<Product>) query.list();
		session.flush();
		if (productList != null) {
			return productList;
		}
		return null;
	}

	public void save(Product product) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(product);
		session.flush();
	}

	public void edit(Product product) {
		save(product);
	}

	public void delete(Product product) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(product);
		session.flush();
	}

}
