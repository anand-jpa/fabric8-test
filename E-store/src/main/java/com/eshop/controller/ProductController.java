package com.eshop.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

/**
* ProductController to manage all product related actions
*
* @author  Navinkumar
* @email   navinkumar.boddu@in.fujitsu.com
*/

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eshop.model.Category;
import com.eshop.model.Product;
import com.eshop.service.CategoryService;
import com.eshop.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;

	@RequestMapping("/viewProduct/{productId}")
	public String viewProduct(@PathVariable int productId, Model model) throws IOException {
		Product product = productService.findProductById(productId);
		model.addAttribute("product", product);
		Category category = categoryService.findCategoryById(product.getCategoryId());
		model.addAttribute("category", category);
		return "/store/viewProduct";
	}

	@RequestMapping("/productList/{categoryId}")
	public String getProductByCategory(@PathVariable int productId, Model model) {
		List<Product> products = productService.getProductList();
		model.addAttribute("products", products);
		// model.addAttribute("searchCondition", searchCondition);
		return "productList";
	}

}
