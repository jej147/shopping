package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {
	
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();

	public static ProductRepository getInstance(){
		return instance;
	} 

	public ProductRepository() {
		Product p1 = new Product("p1", "±Ëπ‰", 2000);
		p1.setDescription("∏¿¿÷¥¬ ±Ëπ‰");
		p1.setCategory("∏≈¿Â∏Ì");
		p1.setManufacturer("±§¿ÂΩ√¿Â");
		p1.setUnitsInStock(20);
		p1.setCondition("±π≥ªªÍ");
		p1.setFilename("food1.jpg");
		
		Product p2 = new Product("p2", "∂±∫∫¿Ã", 2500);
		p2.setDescription("∏¿¿÷¥¬ ∂±∫∫¿Ã");
		p2.setCategory("∏≈¿Â∏Ì");
		p2.setManufacturer("±§¿ÂΩ√¿Â");
		p2.setUnitsInStock(30);
		p2.setCondition("±π≥ªªÍ");
		p2.setFilename("food2.jpg");
		
		Product p3 = new Product("p3", "∫“∞Ì±‚", 6000);
		p3.setDescription("∏¿¿÷¥¬ ∫“∞Ì±‚");
		p3.setCategory("∏≈¿Â∏Ì");
		p3.setManufacturer("±§¿ÂΩ√¿Â");
		p3.setUnitsInStock(40);
		p3.setCondition("±π≥ªªÍ");
		p3.setFilename("food4.jpg");
		
		Product p4 = new Product("p4", "µ∑∞°Ω∫", 7000);
		p4.setDescription("∏¿¿÷¥¬ µ∑∞°Ω∫");
		p4.setCategory("∏≈¿Â∏Ì");
		p4.setManufacturer("±§¿ÂΩ√¿Â");
		p4.setUnitsInStock(30);
		p4.setCondition("±π≥ªªÍ");
		p4.setFilename("food6.jpg");

		
		listOfProducts.add(p1);
		listOfProducts.add(p2);
		listOfProducts.add(p3);
		listOfProducts.add(p4);
			}

	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}
	
	public Product getProductById(String productId) {
		Product productById = null;

		for (int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
	
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
}
