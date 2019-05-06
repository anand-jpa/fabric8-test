package com.eshop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eshop.dao.UserDAO;
import com.eshop.model.User;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private DataSource dataSource;

	public User findUserById(int id) {
		Session session = sessionFactory.getCurrentSession();
		User user = (User) session.get(User.class, id);
		session.flush();
		if (user != null) {
			return user;
		}
		return null;
	}

	public User save(User user) {
		Session session = sessionFactory.getCurrentSession();
		session.save(user);
		session.flush();
		return user;
	}

	public void edit(User user) {
		save(user);
	}

	public void delete(User user) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(user);
		session.flush();
	}

	public User verifyUser(String name, String password, String role) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User where name = ? and password = ? and role = ?");
		query.setString(0, name);
		query.setString(1, password);
		query.setString(2, role);
		session.flush();
		return (User) query.uniqueResult();
	}

	public User verifyJDBCUser(String name, String password, String role) {
		String sql = "Select * from user where name = ? and password = ?";
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, password);
			User user = null;
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				user = User.createFromDataSet(rs);
			}
			rs.close();
			ps.close();

			if (user.getRole().equals(role)) {
				return user;
			}
			return null;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	public User findUserForEmailAddress(String emailAddress) {
		Session session = sessionFactory.getCurrentSession();
		Query query = sessionFactory.getCurrentSession().createQuery("from User where emailAddress=:emailAddress and role='USER'");
		query.setParameter("emailAddress", emailAddress);
		User user = (User) query.uniqueResult();
		return user;
	}
}
