package product;

public class Product {
	
	private int num; //코드
	private String pId; //시장
	private String pName;//이름
	private int pPrice;//가격
	private String pContent;//설명
	private String pFile;//이미지
	private int cart;//상품 수량
	private int pAvailable;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public String getpFile() {
		return pFile;
	}
	public void setpFile(String pFile) {
		this.pFile = pFile;
	}
	public int getCart() {
		return cart;
	}
	public void setCart(int cart) {
		this.cart = cart;
	}
	public int getpAvailable() {
		return pAvailable;
	}
	public void setpAvailable(int pAvailable) {
		this.pAvailable = pAvailable;
	}

}
