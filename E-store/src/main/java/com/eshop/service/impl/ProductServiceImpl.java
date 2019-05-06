package com.eshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eshop.dao.ProductDAO;
import com.eshop.model.Product;
import com.eshop.service.ProductService;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDao;

	public Product findProductById(int id) {
		return productDao.findProductById(id);
	}

	public List<Product> getProductList() {
		return productDao.getProductList();
	}

	public void save(Product product) {
		productDao.save(product);
	}

	public void edit(Product product) {
		productDao.edit(product);
	}

	public void delete(Product product) {
		productDao.delete(product);
	}

}
