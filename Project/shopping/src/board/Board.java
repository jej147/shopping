package board;

public class Board {
	
	private int tId;
	private String tTitle;
	private String userId;
	private String tDate;
	private String tContent;
	private int tAvailable;
	public int gettId() {
		return tId;
	}
	public void settId(int tId) {
		this.tId = tId;
	}
	public String gettTitle() {
		return tTitle;
	}
	public void settTitle(String tTitle) {
		this.tTitle = tTitle;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String gettDate() {
		return tDate;
	}
	public void settDate(String tDate) {
		this.tDate = tDate;
	}
	public String gettContent() {
		return tContent;
	}
	public void settContent(String tContent) {
		this.tContent = tContent;
	}
	public int gettAvailable() {
		return tAvailable;
	}
	public void settAvailable(int tAvailable) {
		this.tAvailable = tAvailable;
	}

}
