import com.mongodb.*;
import com.mongodb.client.*;
import org.bson.Document;

public class jc_mongo {
    public static void main(String[] args) {
        // Replace the placeholder with your Atlas connection string
        String uri = "mongodb://192.168.209.102:27017/";

        // Construct a ServerApi instance using the ServerApi.builder() method
        ServerApi serverApi = ServerApi.builder()
                .version(ServerApiVersion.V1)
                .build();

        MongoClientSettings settings = MongoClientSettings.builder()
                .applyConnectionString(new ConnectionString(uri))
                .serverApi(serverApi)
                .build();

        // Create a new client and connect to the server
        try (MongoClient mongoClient = MongoClients.create(settings)) {
            MongoDatabase database = mongoClient.getDatabase("equipo3basedatos");
            MongoCollection<Document> collection = database.getCollection("equipo3basedatos");
            try {
                // Send a ping to confirm a successful connection
                MongoCursor<Document> cursor = collection.find().iterator();
                System.out.println();
                MongoIterable<String> collectionNames = database.listCollectionNames();
                for (String collectionName : collectionNames) {
                    System.out.println(collectionName);
                }
                while (cursor.hasNext()) {
                    Document doc = cursor.next();
                    System.out.println();
                    System.out.println(doc.toJson());
                }

            } catch (MongoException me) {
                System.err.println(me);
            }
        }
    }
}
