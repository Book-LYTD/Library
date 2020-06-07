package book;

public class BorrowInfo {
	String bookID;
	String name;
	int cardNum;
	String date;
	String author;
	int maxLendDay;
	public String getBookID() {
		return bookID;
	}
	public void setBookID(String bookID) {
		this.bookID = bookID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCardNum() {
		return cardNum;
	}
	public void setCardNum(int cardNum) {
		this.cardNum = cardNum;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getMaxLendDay() {
		return maxLendDay;
	}
	public void setMaxLendDay(int maxLendDay) {
		this.maxLendDay = maxLendDay;
	}
	
	
}
