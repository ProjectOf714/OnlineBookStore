package onlinebookstore.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.logging.log4j.core.config.ConfigurationSource;
import org.apache.logging.log4j.core.config.Configurator;

public class Log4jContextListener implements ServletContextListener {
	/**
	 * Initialize log4j when the application is being started
	 */
	@Override
	public void contextInitialized(ServletContextEvent event) {
		ServletContext context = event.getServletContext();
		String log4jConfigFile = context
				.getInitParameter("log4j2-config-location");
		String fullPath = context.getRealPath("") + File.separator
				+ log4jConfigFile;
		ConfigurationSource srcConfig;
		try {
			srcConfig = new ConfigurationSource(new FileInputStream(fullPath));
			Configurator.initialize(null, srcConfig);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// do nothing
	}
}