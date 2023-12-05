package shop.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import shop.entity.Payment;
import shop.entity.Transaction;

import javax.transaction.Transactional;

@Transactional
@Service("PaymentDao")
public class PaymentDAO {
	@Autowired
	private SessionFactory factory;

	// create or update
	public boolean createOrUpdate(Payment payment) {

		Session session = factory.openSession();
		org.hibernate.Transaction t = session.beginTransaction();
		try {
			session.saveOrUpdate(payment);
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
}
