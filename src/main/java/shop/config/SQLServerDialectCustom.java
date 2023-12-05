package shop.config;

import org.hibernate.Hibernate;
import org.hibernate.dialect.SQLServer2012Dialect;
import org.hibernate.dialect.SQLServerDialect;
import org.hibernate.metamodel.binding.HibernateTypeDescriptor;
import org.hibernate.type.StandardBasicTypes;

import java.sql.Types;

public class SQLServerDialectCustom extends SQLServerDialect {
	public  SQLServerDialectCustom() {
		super();
		registerHibernateType(Types.DECIMAL, StandardBasicTypes.BIG_DECIMAL.getName());
		registerHibernateType(Types.INTEGER, StandardBasicTypes.INTEGER.getName());
		registerHibernateType(Types.NVARCHAR, StandardBasicTypes.STRING.getName());
	}
}
