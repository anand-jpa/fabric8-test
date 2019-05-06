package com.eshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eshop.dao.CategoryDAO;
import com.eshop.model.Category;
import com.eshop.service.CategoryService;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDAO categoryDAO;

	public List<Category> getCategoryList() {
		return categoryDAO.getCategoryList();
	}

	public void delete(Category category) {
		categoryDAO.delete(category);
	}

	public boolean save(Category category) {
		return categoryDAO.save(category);
	}

	public boolean edit(Category category) {
		return categoryDAO.edit(category);
	}

	public Category findCategoryByName(String categoryName) {
		return categoryDAO.findCategoryByName(categoryName);
	}

	public Category findCategoryById(int id) {
		return categoryDAO.findCategoryById(id);
	}
}
