package shop.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import shop.entity.Storage;
import shop.entity.Transaction;

import javax.transaction.Transactional;

@Transactional
@Service("StorageDao")
public class StorageDAO {
    @Autowired
    private SessionFactory factory;

    // create or update
    public boolean createOrUpdate(Storage storage) {

        Session session = factory.openSession();
        org.hibernate.Transaction t = session.beginTransaction();
        try {
            session.saveOrUpdate(storage);
            t.commit();
            System.out.print("Create or Update Success");
            return true;

        } catch (Exception e) {
            System.out.print(e);
            t.rollback();
            return false;
        } finally {
            session.close();
        }

    }
}
