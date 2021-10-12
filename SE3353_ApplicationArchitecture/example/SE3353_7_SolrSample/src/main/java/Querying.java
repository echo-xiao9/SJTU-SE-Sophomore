import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.params.MapSolrParams;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class Querying {
    public static void main(String[] args) throws IOException, SolrServerException {
        final SolrClient client = getSolrClient();

        final Map<String, String> queryParamMap = new HashMap<String, String>();
        queryParamMap.put("q", "*:*");
        queryParamMap.put("fl", "id, name");
        queryParamMap.put("sort", "id asc");
        MapSolrParams queryParams = new MapSolrParams(queryParamMap);

        final QueryResponse response = client.query("techproducts", queryParams);
        final SolrDocumentList documents = response.getResults();

        System.out.println("Found " + documents.getNumFound() + " documents");
        for (SolrDocument document : documents) {
            final String id = (String) document.getFirstValue("id");
            final String name = (String) document.getFirstValue("name");

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