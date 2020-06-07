package book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import common.DBConnection;
import book.*;

public class BookDB {
	private Connection con = null;
	public ReaderInfo getReaderInfo(int cardnum) {
        ReaderInfo reader=null;
        try {
        	Connection con=DBConnection.getConnection();
    		Statement stm=con.createStatement();
    		ResultSet rs=stm.executeQuery("select * from reader_info where CardNum="+cardnum);
    		if(rs.next()) {
    			reader=new ReaderInfo();
            	reader.setCardNum(rs.getInt("CardNum"));
            	reader.setName(rs.getString("ReaderName"));
            	reader.setCollege(rs.getString("College"));
            	reader.setProfession(rs.getString("Profession"));
            	reader.setTelNum(rs.getString("TelNumber"));
            	reader.setPwd(rs.getString("Key"));
            	reader.setType(rs.getString("ReaderType"));
            }
			rs.close();
			stm.close();
        } catch (Exception e) {
            System.out.println("获取读者信息失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return reader;
	}
	public ArrayList<BorrowInfo> getAllBorrow(int id) {
        ResultSet rs=null;
        Statement sql=null;
        ArrayList<BorrowInfo> BorrowList=new ArrayList<BorrowInfo>();
        try {
        	con=DBConnection.getConnection();
            sql=con.createStatement();
            rs=sql.executeQuery("SELECT borrow_record.CardNum,borrow_record.BookID,book_class.BookName,borrow_record.BorrowDate,BookAuthor,MaxLendDay "
            		+ "FROM borrow_record,book_info,book_class where borrow_record.BookID=book_info.BookID and book_info.BookClassID=book_class.BookClassID and borrow_record.CardNum="+id);
            while(rs.next()) {
            	BorrowInfo borrow=new BorrowInfo();
            	borrow.setBookID(rs.getString("BookID"));
            	borrow.setCardNum(rs.getInt("CardNum"));
            	borrow.setName(rs.getString("BookName"));
            	borrow.setDate(rs.getString("BorrowDate"));
            	borrow.setAuthor(rs.getString("BookAuthor"));
            	borrow.setMaxLendDay(rs.getInt("MaxLendDay"));
            	BorrowList.add(borrow);
            }
			rs.close();
			sql.close();
        } catch (Exception e) {
            System.out.println("获取借阅信息失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return BorrowList;
    }
	public int updatePwd(PwdInfo pwd) {
    	int count = 0;
    	try {
    		Connection con=DBConnection.getConnection();
    		String sql="update reader_info set reader_info.Key=? where CardNum=?";
    		PreparedStatement stm=con.prepareStatement(sql);
    		stm.setString(1, pwd.getPwd());
    		stm.setInt(2, pwd.getCard());
    		count=stm.executeUpdate();
    		stm.close();
    	}catch (Exception e) {
            System.out.println("修改密码失败！");
        } finally{
        	DBConnection.closeConnection();
		}		
        return count;
    }
	 public ArrayList<ReserveInfo> getAllReserve(int id) {
	        ResultSet rs=null;
	        Statement sql=null;
	        ArrayList<ReserveInfo> ReserveList=new ArrayList<ReserveInfo>();
	        try {
	        	con=DBConnection.getConnection();
	            sql=con.createStatement();
	            rs=sql.executeQuery("SELECT book_class.BookName,reserve_record.BookID,BookAuthor,reserve_record.ReserveDate,book_info.SendFlag " + 
	            		"FROM reserve_record,book_info,book_class " + 
	            		"where reserve_record.BookID=book_info.BookID and book_info.BookClassID=book_class.BookClassID and reserve_record.CardNum="+id);
	            while(rs.next()) {
	            	ReserveInfo reserve=new ReserveInfo();
	            	reserve.setBookID(rs.getString("BookID"));
	            	reserve.setName(rs.getString("BookName"));
	            	reserve.setAuthor(rs.getString("BookAuthor"));
	            	reserve.setDate(rs.getString("ReserveDate"));
	            	reserve.setSendFlag(rs.getInt("SendFlag"));
	            	ReserveList.add(reserve);
	            }
				rs.close();
				sql.close();
	        } catch (Exception e) {
	            System.out.println("获取所有预定信息失败！");
	        } finally{
	        	DBConnection.closeConnection();
			}		
	        return ReserveList;
	    }
	 public int deleteReserve(String id) {
		 int count = 0;
	    	try {
	    		Connection con=DBConnection.getConnection();
	    		String sql="delete from reserve_record where BookID="+"'";
	    		sql+=id+"'";
	    		PreparedStatement stm=con.prepareStatement(sql);
	    		count=stm.executeUpdate(sql);
	    		stm.close();
	    	}catch (Exception e) {
	            System.out.println("删除预定失败！");
	        } finally{
	        	DBConnection.closeConnection();
			}		
	        return count;
	 }
}