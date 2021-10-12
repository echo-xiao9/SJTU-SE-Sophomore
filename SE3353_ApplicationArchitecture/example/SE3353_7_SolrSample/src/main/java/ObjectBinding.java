import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.client.solrj.response.UpdateResponse;

import java.io.IOException;
import java.util.List;

public class ObjectBinding {
    public static void main(String[] args) throws IOException, SolrServerException {
        final SolrClient client = getSolrClient();

        final TechProduct kindle = new TechProduct("kindle-id-4", "Amazon Kindle Paperwhite");
        final UpdateResponse response = client.addBean("techproducts", kindle);

        client.commit("techproducts");

        final SolrQuery query = new SolrQuery("*:*");
        query.addField("id");
        query.addField("name");
        query.setSort("id", SolrQuery.ORDER.asc);

        final QueryResponse responseOne = client.query("techproducts", query);
        final List<TechProduct> products = responseOne.getBeans(TechProduct.class);
        for (TechProduct product : products) {
            final String id = product.getId();
            final String name = product.getName();

            System.out.println("id: " + id + "; name: " + name);
        }
    }

    public static SolrClient getSolrClient() {
        final String solrUrl = "http://localhost:8983/solr";
        return new HttpSolrClient.Builder(solrUrl)
                .withConnectionTimeout(10000)
                .withSocketTimeout(60000)
                .build();
    }
}
