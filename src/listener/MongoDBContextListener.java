package listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.bson.codecs.configuration.CodecRegistries;
import org.bson.codecs.configuration.CodecRegistry;
import org.bson.codecs.pojo.PojoCodecProvider;

import com.mongodb.ConnectionString;
import com.mongodb.MongoClientSettings;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;

@WebListener
public class MongoDBContextListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		CodecRegistry pojoCodecRegistry = CodecRegistries.fromProviders(PojoCodecProvider.builder().automatic(true).build());
		CodecRegistry codecRegistry = CodecRegistries.fromRegistries(MongoClientSettings.getDefaultCodecRegistry(), pojoCodecRegistry);
		ServletContext servletContext=sce.getServletContext();
		ConnectionString connectionString = new ConnectionString(servletContext.getInitParameter("MONGODB_HOST"));
		MongoClientSettings settings = MongoClientSettings.builder()
	            .applyConnectionString(connectionString)
	            .codecRegistry(codecRegistry)
	            .build();
		MongoClient mongo=MongoClients.create(settings);
		System.out.println("Connected");
		sce.getServletContext().setAttribute("MONGODB_CLIENT", mongo);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		MongoClient mongo=(MongoClient)sce.getServletContext().getAttribute("MONGODB_CLIENT");
		mongo.close();		
	}

}
