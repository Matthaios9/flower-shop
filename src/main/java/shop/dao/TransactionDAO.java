package shop.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.ParameterMode;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.procedure.ProcedureCall;
import org.hibernate.result.Output;
import org.hibernate.result.ResultSetOutput;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.dto.ReportProductDto;
import shop.entity.Order;
import shop.entity.ShopCart;
import shop.entity.Transaction;
import shop.entity.User;

@Transactional
@Service("transactionDao")
public class TransactionDAO {
	@Autowired
	 SessionFactory factory;

	// get list Transaction
	public List<Transaction> getListTrans() {
		Session session = factory.getCurrentSession();
		try {
			String sql = "FROM Transaction";
			Query query = session.createQuery(sql);
			List<Transaction> listTrans = query.list();
			System.out.println("ok");
			return listTrans;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error"+e.getMessage());
		}
		return new ArrayList<>();
	}

	// get list Transaction
	public List<Transaction> getListTransOrderByDate() {
		Session session = factory.getCurrentSession();
		try {
			String sql = "FROM Transaction ORDER BY created DESC";
			Query query = session.createQuery(sql);
			List<Transaction> listTrans = query.list();
			System.out.println("ok");
			return listTrans;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error"+e.getMessage());
		}
		return new ArrayList<>();
	}
	
	//get Transaction by Id
		public Transaction getTransById(int id) {
			Transaction trans = null;
			Session session = factory.getCurrentSession();
			try {
				trans = (Transaction) session.get(Transaction.class, id);
			} catch (Exception e) {
				System.out.print("errors" + e.getMessage());
			}
			return trans;
		}
	
	// get list Transaction by User
	public List<Transaction> getListTransByUser(int userId) {
		Session session = factory.getCurrentSession();
		try {
			String sql = "FROM Transaction t where t.user.id =:userId";
			Query query = session.createQuery(sql).setParameter("userId", userId);
			List<Transaction> listTrans = query.list();
			System.out.println("ok");
			return listTrans;
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error"+e.getMessage());
		}
		return new ArrayList<>();
	}

	
	
	// create or update
	public boolean createOrUpdate(Transaction trans) {
		
		Session session = factory.openSession();
		org.hibernate.Transaction t = session.beginTransaction();
		try {
			session.saveOrUpdate(trans);
			t.commit();
			System.out.print("Create or Update Success");
			return true;

		} catch (Exception e) {
			System.out.print(e.getMessage());
			t.rollback();
			return false;
		} finally {
			session.close();
		}
		
	}

	// create or update
	public boolean update(Transaction trans) {

		Session session = factory.openSession();
		org.hibernate.Transaction t = session.beginTransaction();
		try {
			session.update(trans);
			t.commit();
			System.out.print("Create or Update Success");
			return true;

		} catch (Exception e) {
			System.out.print(e.getMessage());
			t.rollback();
			return false;
		} finally {
			session.close();
		}

	}
	
	// delete
		public boolean delete(int id) {
			Transaction trans;
			Session session = factory.openSession();
			org.hibernate.Transaction t = session.beginTransaction();
			try {
				trans = (Transaction) session.get(Transaction.class, id);
				session.delete(trans);
				t.commit();
				return true;
				
			} catch (Throwable e) {
				t.rollback();
				return false;
			} finally {
				session.close();
			}
		}

	public List<Transaction> searchTransactionByDate(String fromDate, String toDate) {
		Session session = factory.getCurrentSession();
		try {
			String sql = "FROM Transaction WHERE status = 3 ";
			if (!fromDate.isEmpty() && !toDate.isEmpty()) {
				sql += "AND done_date BETWEEN '" + fromDate + "' AND '" + toDate + "' ";
			}
			sql += "ORDER BY done_date DESC";
			Query query = session.createQuery(sql);
			List<Transaction> listTrans = query.list();
			System.out.println("ok");
			return listTrans;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error"+e.getMessage());
		}
		return new ArrayList<>();
	}

	public List<ReportProductDto> searchTransactionByProduct(String fromDate, String toDate) {
		Session session = factory.getCurrentSession();
		List<ReportProductDto> reportProductDtoList = new ArrayList<>();
		try {
			String sql = "SELECT CAST(c.id as INT) as id, cast(c.name as NVARCHAR) as name, CAST(SUM(b.quantity) as INT) as quantity, CAST(SUM(b.amount) as DECIMAL) as amount FROM [Transaction] a INNER JOIN [Order] b ON a.id = b.transactionID INNER JOIN [Flower] c ON b.idFlower = c.id WHERE a.status = 3 AND b.status = 1 ";
			if (!fromDate.isEmpty() && !toDate.isEmpty()) {
				sql += " AND a.done_date BETWEEN '" + fromDate + "' AND '" + toDate + "' ";
			}
			sql += " GROUP BY c.id, c.name";
			SQLQuery query = session.createSQLQuery(sql);
			List<Object[]> rows = query.list();
			for (Object[] row : rows) {
				reportProductDtoList.add(new ReportProductDto((int) row[0], (String) row[1], (int) row[2], new BigDecimal(String.valueOf(row[3]))));
			}
			System.out.println("ok");
			return reportProductDtoList;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return new ArrayList<>();
	}
}
