package vn.myclass.core.common.util;

import java.util.Map;
import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

public class HibernateUtil {
    private static final SessionFactory sessionFactory = buildSessionFactory();

    private static SessionFactory buildSessionFactory() {
    	Configuration conf = new Configuration();
    	Properties props = new Properties();
    	props.put(Environment.DIALECT, "org.hibernate.dialect.MySQLDialect");
    	props.put(Environment.DRIVER, "com.mysql.cj.jdbc.Driver");
    	props.put(Environment.URL, "jdbc:mysql://localhost:3306/toeiconline?autoReconnect=true&amp;characterEncoding=utf-8&amp;useUnicode=true&amp;connectionCollation=utf8_unicode_ci&amp;characterSetResults=utf8");
    	props.put(Environment.USER, "root");
    	props.put(Environment.PASS, "1234");
    	props.put(Environment.SHOW_SQL, "true");
    	
    	conf.setProperties(props);
    	conf.addAnnotatedClass(RoleEntity.class);
    	ServiceRegistry registry = (ServiceRegistry) new StandardServiceRegistryBuilder()
    			.applySettings(conf.getProperties()).build();
    	sessionFactory = conf.buildSessionFactory(registry);
    	try {
            // Create the SessionFactory from hibernate.cfg.xml
        	
            return sessionFactory;
        }
        catch (Throwable ex) {
            // Make sure you log the exception, as it might be swallowed
//            System.err.println("Initial SessionFactory creation failed." + ex);
//            throw new ExceptionInInitializerError(ex);
        	return null;
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static Object[] buildNameQuery(Map<String, Object> property) {
        StringBuilder nameQuery = new StringBuilder();
        if (property != null && property.size() > 0) {
            String[] params = new String[property.size()];
            Object[] values = new Object[property.size()];
            int i = 0 ;
            for(Map.Entry item: property.entrySet()) {
                params[i] = (String) item.getKey();
                values[i] = item.getValue();
                i++;
            }
            for (int i1 = 0; i1 < params.length ; i1++) {
                nameQuery.append(" and ").append(" LOWER("+params[i1]+") LIKE '%' || :"+params[i1]+" || '%' ");
            }
            return new Object[]{nameQuery, params, values};
        }
        return new Object[]{nameQuery.toString()};
    }
    public static void main(String[] args) {
		System.out.println(new Configuration().configure().buildSessionFactory());
	}

}
