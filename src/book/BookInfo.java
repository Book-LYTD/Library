package book;

public class BookInfo {
	String bookID;
	String bookClassID;
	int sendFlag;
	int maxLendDay;
	public String getBookID() {
		return bookID;
	}
	public void setBookID(String bookID) {
		this.bookID = bookID;
	}
	public String getBookClassID() {
		return bookClassID;
	}
	public void setBookClassID(String bookClassID) {
		this.bookClassID = bookClassID;
	}
	public int getSendFlag() {
		return sendFlag;
	}
	public void setSendFlag(int sendFlag) {
		this.sendFlag = sendFlag;
	}
	public int getMaxLendDay() {
		return maxLendDay;
	}
	public void setMaxLendDay(int maxLendDay) {
		this.maxLendDay = maxLendDay;
	}
	
}
