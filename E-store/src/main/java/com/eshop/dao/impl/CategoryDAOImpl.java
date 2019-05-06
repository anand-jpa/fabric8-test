package com.eshop.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eshop.dao.CategoryDAO;
import com.eshop.model.Category;
import com.eshop.model.Product;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public List<Category> getCategoryList() {
		String sql = " from Category";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(sql);
		List<Category> categoryList = (List<Category>) query.list();
		// categoryList = session.createCriteria(Category.class).list();
		session.flush();
		if (categoryList != null) {
			return categoryList;
		}
		return null;
	}

	public boolean save(Category category) {
		Session session = sessionFactory.getCurrentSession();
		if (findCategoryByName(category.getCategoryName()) == null) {
			session.saveOrUpdate(category);
			session.flush();
			return true;
		}
		session.flush();
		return false;
	}

	public boolean edit(Category category) {
		Session session = sessionFactory.getCurrentSession();
		Category editCategory = findCategoryByName(category.getCategoryName());
		if (editCategory == null) {
			session.update(category);
			session.flush();
			return true;
		} else if (editCategory.getCategoryName().equals(category.getCategoryName())
				&& !editCategory.getDescription().equals(editCategory.getDescription())) {
			session.update(category);
			session.flush();
			return true;
		}
		session.flush();
		return false;
	}

	public void delete(Category category) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(category);
		session.flush();
	}

	public Category findCategoryByName(String categoryName) {
		Session session = sessionFactory.getCurrentSession();
		Query query = sessionFactory.getCurrentSession().createQuery("from Category where categoryName=:name");
		query.setParameter("name", categoryName);
		Category category = (Category) query.uniqueResult();
		return category;
	}

	public Category findCategoryById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Category category = (Category) session.get(Category.class, id);
		session.flush();
		if (category != null) {
			return category;
		}
		return null;
	}

}
