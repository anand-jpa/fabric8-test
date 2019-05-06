package com.eshop.dao;

/**
* ProductDAO interface to declare the methods
*
* @author  Navinkumar
* @email   navinkumar.boddu@in.fujitsu.com
*/

import java.util.List;

import com.eshop.model.Category;

public interface CategoryDAO {

	public List<Category> getCategoryList();

	public boolean save(Category category);

	public boolean edit(Category category);

	public void delete(Category category);
	
	public Category findCategoryByName(String categoryName);
		
	public Category findCategoryById(int id);

}