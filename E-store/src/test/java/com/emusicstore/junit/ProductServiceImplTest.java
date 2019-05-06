package com.emusicstore.junit;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;

import com.eshop.dao.impl.ProductDAOImpl;
import com.eshop.model.Product;

public class ProductServiceImplTest extends BaseTest {

	@Autowired
	private ProductDAOImpl productService;

	@Test
	@Rollback(false)
	public void editProductTest() {
		Product product = productService.findProductById(1);
		product.setName("Bikestar");
		productService.edit(product);
		product = productService.findProductById(1);
		assertEquals("Bikestar", product.getName());
	}

	@Test
	@Rollback(false)
	public void getProductByIdTest() {
		Product product = productService.findProductById(1);
		assertNotNull(product);
	}

	@Test
	@Rollback(false)
	public void getProductListTest() {
		List<Product> productList = productService.getProductList();
		assertNotNull(productList);
	}

}