import org.apache.solr.client.solrj.beans.Field;

public class TechProduct {
    @Field
    public String id;
    @Field
    public String name;

    public TechProduct(String id, String name) {
        this.id = id;
        this.name = name;
    }

    public TechProduct() {
    }

    public String getId() {
        return this.id;
    }

    public String getName() {
        return this.name;
    }

}
