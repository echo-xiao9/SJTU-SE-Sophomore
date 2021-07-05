package com.reins.bookstore.daoimpl;

import com.reins.bookstore.dao.OrderDao;
import com.reins.bookstore.repository.BookRepository;
import com.reins.bookstore.repository.OrderItemRepository;
import com.reins.bookstore.repository.OrderRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.reins.bookstore.entity.Order;

import java.util.*;


@Repository
public class OrderDaoImpl implements OrderDao {
    @Autowired
    private OrderRepository orderRepository;


    @Override
    public Order findOne(Integer id) {
        return orderRepository.getOne(id);
    }

    @Override
    public List<Order> getOrders() {
        List<Order> orderList=orderRepository.getOrders();
        System.out.println(1);
        return orderList;

    }

//
//    @Override
//    public ArrayList getAdminOrder() {
//        List<Order> result = orderRepository.getOrders();
//        System.out.println(result);
//        Iterator<Order> it = result.iterator();
//        ArrayList<JSONArray> ordersJson = new ArrayList<JSONArray>();
//        while (it.hasNext()) {
//            Order order = (Order) it.next();
//            ArrayList<String> arrayList = new ArrayList<String>();
//            arrayList.add(order.getUser_id().toString());
//            arrayList.add(order.getOrder_price().toString());
//            ordersJson.add((JSONArray) JSONArray.toJSON(arrayList));
//        }
//        String ordersString = JSON.toJSONString(ordersJson, SerializerFeature.BrowserCompatible);
//        return ordersJson;
//    }
//
//    @Override
//    public Order addOrderFromUser(Integer user_id, Integer order_price, String date, String year, String month, String day) {
//        Order order = new Order(user_id, order_price, date, year, month, day);
//        orderRepository.save(order);
//        return order;
//    }
//
//    @Override
//    public List<OrderItem> getOrderItems(Integer order_id) {
//        System.out.println("before get items");
//        return orderItemRepository.getOrderItemsByOrderId(order_id);
//    }
//
//    public ArrayList getOrderItemsList(Integer order_id) {
//        List<OrderItem> orderItemList = getOrderItems(order_id);
//        ArrayList<JSONArray> orderItemJson = new ArrayList<JSONArray>();
//        Iterator<OrderItem> it = orderItemList.iterator();
//        while (it.hasNext()) {
//            OrderItem orderItem = (OrderItem) it.next();
//            ArrayList<String> arrayList = new ArrayList<String>();
//            arrayList.add(orderItem.getBook_id().toString());
//            arrayList.add(orderItem.getBook_name());
//            arrayList.add(orderItem.getBook_price().toString());
//            arrayList.add(orderItem.getBook_num().toString());
//            orderItemJson.add((JSONArray) JSONArray.toJSON(arrayList));
//        }
//        return orderItemJson;
//    }
//
//    @Override
//    public ArrayList getAdminAllOrder() {
//        List<Order> result = orderRepository.getOrders();
//        System.out.println(result);
//        Iterator<Order> it = result.iterator();
//        ArrayList<JSONArray> ordersJson = new ArrayList<JSONArray>();
//        while (it.hasNext()) {
//            Order order = (Order) it.next();
//            ArrayList<String> arrayList = new ArrayList<String>();
//            arrayList.add(order.getOrder_price().toString());
//            arrayList.add(order.getUser_id().toString());
//            arrayList.add(order.getYear());
//            arrayList.add(order.getMonth());
//            arrayList.add(order.getDay());
//            arrayList.add(order.getOrderId().toString());
////            arrayList.add(getOrderItems(order.getOrderId()).toString());
////            arrayList.add((JSONArray)JSONArray.toJSON(getOrderItemsList(order.getOrderId())));
//            ordersJson.add((JSONArray) JSONArray.toJSON(arrayList));
//        }
////        String  ordersString = JSON.toJSONString(ordersJson, SerializerFeature.BrowserCompatible);
//        return ordersJson;
//    }
//
//    public List<Order> getOrderBetween(String from, String to) {
//        List<Order> orderList = orderRepository.getOrders();
//        List<Order> result = new ArrayList<>();
//        for (Order item : orderList) {
//            if (item.getDate().compareTo(to) <= 0 && item.getDate().compareTo(from) >= 0) {
//
//                result.add(item);
//            }
//        }
//
//        return result;
//    }
//
//
//    public ArrayList getHotBook(List<OrderItem> orderItemList) {
//        ArrayList<Book> resultArr = new ArrayList<>();
//        for (OrderItem item : orderItemList) {
//            String itemName = item.getBook_name();
//            Integer itemNum = item.getBook_num();
//            Integer itemBookId = item.getBook_id();
//            Integer itemPrice=item.getBook_price();
//            boolean flag = false;
//            for (Book it : resultArr) {
//                if (it.getName().equals(itemName)) {
//                    it.setInventory(it.getInventory() + itemNum);
//                    flag = true;
//                    break;
//                }
//            }
//            if (flag == false) {
//                Book newBook = new Book(itemName, itemNum,itemBookId,itemPrice);
//                resultArr.add(newBook);
//            }
//        }
////        resultArr.sort(Comparator.comparing(Book::getInventory));
//        Collections.sort(resultArr, (Book a1, Book a2) -> a2.getInventory()-a1.getInventory());
//        System.out.println(resultArr);
//        return resultArr;
//    }
//
//    @Override
//    public ArrayList getHotSelling(String from, String to) {
//        List<Order> orderList = getOrderBetween(from, to);
//        List<OrderItem> orderItemList = new ArrayList<>();
//        ArrayList<Book> resultArr = new ArrayList<>();
//        for (Order order : orderList) {
//            List<OrderItem> orderItemListSingle = orderItemRepository.getOrderItemsByOrderId(order.getOrderId());
//            orderItemList.addAll(orderItemListSingle);
//        }
//        return getHotBook(orderItemList);
//    }
//
//    @Override
//    public ArrayList getHotUsers(String from, String to) {
//        List<Order> orderList = getOrderBetween(from, to);
//
//        System.out.println("orderList:");
//        System.out.println(orderList);
//        List<OrderItem> orderItemList = new ArrayList<>();
//        ArrayList<User> resultArr = new ArrayList<>();
//        for (Order order : orderList) {
//            boolean flag=false;
//            Integer userId=order.getUser_id();
//            System.out.println("UserId:");
//            System.out.println(userId);
//            Integer singleOrderNum=0;
//            List<OrderItem> orderItemListSingle = orderItemRepository.getOrderItemsByOrderId(order.getOrderId());
//            for(OrderItem orderItem:orderItemListSingle){
//                singleOrderNum+=orderItem.getBook_num();
//            }
//            for(User user:resultArr){
//                if(user.getUserId().equals(userId)) {
//                    user.setBoughtNum(user.getBoughtNum()+singleOrderNum);
//                    flag=true;
//                    break;
//                }
//            }
//            if(flag==false){
//                User newUser=new User(userId,singleOrderNum);
//                resultArr.add(newUser);
//            }
//        }
//        Collections.sort(resultArr, (User a1, User a2) -> a2.getBoughtNum()-a1.getBoughtNum());
//        return resultArr;
//    }
//
//    @Override
//    public ArrayList getUserHotSelling(String from, String to, Integer user_id) {
//        List<Order> orderList = getOrderBetween(from, to);
//        List<Order> userOrderList=new ArrayList<>();
//        List<OrderItem> orderItemList = new ArrayList<>();
//        for (Order order : orderList) {
//            List<OrderItem> orderItemListSingle = orderItemRepository.getOrderItemsByOrderId(order.getOrderId());
//            orderItemList.addAll(orderItemListSingle);
//        }
//
//        return getHotBook(orderItemList);
//    }
//
//    @Override
//    public OrderItem addOrderItem(Integer order_id, Integer book_id, Integer book_num, String book_name, Integer book_price) {
//        OrderItem orderItem=new OrderItem(order_id,book_id, book_num, book_name, book_price);
//        orderItemRepository.save(orderItem);
//        return orderItem;
//    }

}



