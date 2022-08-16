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
		Product p1 = new Product("p1", "���", 2000);
		p1.setDescription("���ִ� ���");
		p1.setCategory("�����");
		p1.setManufacturer("�������");
		p1.setUnitsInStock(20);
		p1.setCondition("������");
		p1.setFilename("food1.jpg");
		
		Product p2 = new Product("p2", "������", 2500);
		p2.setDescription("���ִ� ������");
		p2.setCategory("�����");
		p2.setManufacturer("�������");
		p2.setUnitsInStock(30);
		p2.setCondition("������");
		p2.setFilename("food2.jpg");
		
		Product p3 = new Product("p3", "�Ұ��", 6000);
		p3.setDescription("���ִ� �Ұ��");
		p3.setCategory("�����");
		p3.setManufacturer("�������");
		p3.setUnitsInStock(40);
		p3.setCondition("������");
		p3.setFilename("food4.jpg");
		
		Product p4 = new Product("p4", "������", 7000);
		p4.setDescription("���ִ� ������");
		p4.setCategory("�����");
		p4.setManufacturer("�������");
		p4.setUnitsInStock(30);
		p4.setCondition("������");
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
