/*
 *
 */
package onlinebookstore.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

public class EntityHelper {
	public static <T> List<T> getListFromRS(Class<T> clazz, ResultSet rs) {
		return getListFromRS(clazz, rs, false);
	}

	public static <T> List<T> getListFromRS(Class<T> clazz, ResultSet rs,
			Boolean firstOnly) {
		Field field = null;
		List<T> lists = new ArrayList<T>();

		try {
			ResultSetMetaData rsmd = rs.getMetaData();
			int counts = rsmd.getColumnCount();
			while (rs.next()) {
				T t = clazz.newInstance();
				for (int i = 0; i < counts; i++) {
					String elename = firstLowerCase(rsmd.getColumnName(i + 1));
					field = clazz.getDeclaredField(elename);

					Class<?> beanType = field.getType();

					Object value = rs.getObject(elename);

					if (value != null) {

						Class<?> dbType = value.getClass();

						if (dbType == java.sql.Timestamp.class
								&& beanType == java.util.Date.class) {
							value = new java.util.Date(
									((java.sql.Timestamp) value).getTime());
						} else if (dbType == java.math.BigDecimal.class
								&& beanType == double.class) {
							value = new Double(value.toString());
						} else if (dbType == java.math.BigDecimal.class
								&& beanType == int.class) {
							value = new Integer(value.toString());
						}
					}

					String setMethodName = "set" + firstUpperCase(elename);
					Method m = t.getClass().getMethod(setMethodName, beanType);

					m.invoke(t, value);

					if (firstOnly)
						break;
				}

				lists.add(t);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return lists;
	}

	public static String firstUpperCase(String old) {
		return old.substring(0, 1).toUpperCase() + old.substring(1);
	}

	public static String firstLowerCase(String old) {
		return old.substring(0, 1).toLowerCase() + old.substring(1);
	}
}
