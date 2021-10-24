package example;

import javax.jws.WebParam;
import javax.jws.WebService;
import javax.xml.ws.Endpoint;
import java.util.HashMap;
import java.util.Map;

@WebService
public class Warehouse {
  public Warehouse() {
    prices = new HashMap<String, Double>();
    prices.put("Blackwell Toaster", 24.95);
    prices.put("ZapXpress Microwave Oven", 49.95);
  }

  public double getPrice(@WebParam(name="description") String description)
  {
    Double price = prices.get(description);
    System.out.println(description);
    return price == null ? 0 : price;
  }

  private Map<String, Double> prices;

  public static void main(String[] argv) {
    Object implementor = new Warehouse ();
    String address = "http://localhost:9000/Warehouse";
    Endpoint.publish(address, implementor);
  }
}
