package news;

public class News {
	
	private int nId;
	private String nTitle;
	private String userId;
	private String nDate;
	private String nContent;
	private int nAvailable;
	public int getnId() {
		return nId;
	}
	public void setnId(int nId) {
		this.nId = nId;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getnDate() {
		return nDate;
	}
	public void setnDate(String nDate) {
		this.nDate = nDate;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public int getnAvailable() {
		return nAvailable;
	}
	public void setnAvailable(int nAvailable) {
		this.nAvailable = nAvailable;
	}
	
}
