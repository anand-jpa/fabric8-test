package com.eshop.controller.ws;

import java.nio.file.Path;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.eshop.model.Category;
import com.eshop.model.Product;
import com.eshop.service.CategoryService;
import com.eshop.service.ProductService;

@RestController
@RequestMapping(value = "/rest")
public class AdminRestController {

	private Path path;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ProductService productService;

	@RequestMapping(path = "/addCategory", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Void> addCategory(@RequestBody Category category) {
		if (categoryService.save(category)) {
			return new ResponseEntity<Void>(HttpStatus.CREATED);
		}
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@RequestMapping(path = "/categoriesList", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Category> categoriesList() {
		try {
			List<Category> categoriesList = categoryService.getCategoryList();
			return categoriesList;
		} catch (Exception e) {
			return null;
		}

	}

	@RequestMapping(path = "editCategory", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Void> editCategory(@RequestBody Category category) {
		if (categoryService.edit(category)) {
			return new ResponseEntity<Void>(HttpStatus.CREATED);
		}
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@RequestMapping(path = "addProduct", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Void> addProduct(@RequestBody Product product, HttpServletRequest request) {

		productService.save(product);
		// MultipartFile productImage = product.getProductImage();
		/*
		 * String rootDirectory =
		 * request.getSession().getServletContext().getRealPath("/"); path =
		 * Paths.get(rootDirectory + "/WEB-INF/resources/images/" + 1 + ".png");
		 * 
		 * if (productImage != null && !productImage.isEmpty()) { try {
		 * productImage.transferTo(new File(path.toString())); } catch
		 * (Exception ex) { ex.printStackTrace(); throw new
		 * RuntimeException("Product image saving failed", ex); } }
		 */

		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
