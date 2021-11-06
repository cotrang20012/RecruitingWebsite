package model;

import java.util.logging.Level;
import java.util.logging.Logger;
import org.bson.codecs.configuration.CodecRegistries;
import org.bson.codecs.configuration.CodecRegistry;
import org.bson.codecs.pojo.PojoCodecProvider;
import org.bson.codecs.pojo.annotations.BsonIgnore;

import com.mongodb.MongoClientSettings;

public class Model {
//	public static ConnectionString connectionString = new ConnectionString("mongodb+srv://tranbaoduy4:laptrinhweb@cluster0.sbpvz.mongodb.net/webfit");
	
	public static CodecRegistry pojoCodecRegistry = CodecRegistries.fromProviders(PojoCodecProvider.builder().automatic(true).build());
	public static CodecRegistry codecRegistry = CodecRegistries.fromRegistries(MongoClientSettings.getDefaultCodecRegistry(), pojoCodecRegistry);

	@BsonIgnore
	Logger logger = Logger.getLogger("org.mongodb.driver");

	public Model() {
		logger.setLevel(Level.SEVERE);
	}
}