package com.eshop.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.eshop.dao.AddressDAO;
import com.eshop.model.Address;
import com.eshop.model.Cart;

@Repository
@Transactional
public class AddressDAOImpl implements AddressDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public Address findAddressById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Address address = (Address) session.get(Address.class, id);
		session.flush();
		if (address != null) {
			return address;
		}
		return null;
	}

	public void save(Address address) {
		Session session = sessionFactory.getCurrentSession();
		session.save(address);
		session.flush();
	}

	public void edit(Address address) {
		save(address);
	}

	public void delete(Address address) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(address);
		session.flush();
	}

}
