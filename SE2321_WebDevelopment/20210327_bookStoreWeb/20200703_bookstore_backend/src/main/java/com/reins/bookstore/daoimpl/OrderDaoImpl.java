package com.reins.bookstore.daoimpl;

import com.alibaba.fastjson.JSONArray;
import com.reins.bookstore.dao.OrderDao;
import com.reins.bookstore.entity.*;
import com.reins.bookstore.repository.BookRepository;
import com.reins.bookstore.repository.OrderItemRepository;
import com.reins.bookstore.repository.OrderRepository;

import com.reins.bookstore.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;


@Repository
public class OrderDaoImpl implements OrderDao {
    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private OrderItemRepository orderItemRepository;
    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private UserRepository userRepository;

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

    @Override
    public List<Order> getUserOrders(Integer user_id) {
        return orderRepository.findByUserId(user_id);
    }

    @Override
    public List<Order> getUserBookOrders(Integer user_id, String bookName) {
        List<Order> userOrder=getUserOrders(user_id);
        List<Order> result = new ArrayList<Order>();
        
        for(Order item:userOrder){
            List<OrderItem> userOrderItemList=item.getOrderItemList();
            for(OrderItem orderItem1:userOrderItemList) {
                if (orderItem1.getBook().getName().equals(bookName)) {
                    result.add(item);
                    break;
                }
            }
        }
        return result;
    }
    @Override
    public List<Order> getAdminBookOrders( String bookName) {
        List<Order> orderList=getOrders();
        List<Order> result = new ArrayList<Order>();

        for(Order item:orderList){
            List<OrderItem> userOrderItemList=item.getOrderItemList();
            for(OrderItem orderItem1:userOrderItemList) {
                if (orderItem1.getBook().getName().equals(bookName)) {
                    result.add(item);
                    break;
                }
            }
        }
        return result;
    }

    @Override
    public Object getAdminDateOrder(String from, String to) {
        List<Order> userOrder=getOrders();
        List<Order> result = new ArrayList<Order>();

        for(Order item:userOrder){
            if(item.getDate().compareTo(from)>=0 && item.getDate().compareTo(to)<=0){
                result.add(item);
            }
        }
        return result;
    }

    @Override
    public List<Order> getUserDateOrder(Integer user_id, String from, String to) {
        List<Order> userOrder=getUserOrders(user_id);
        List<Order> result = new ArrayList<Order>();

        for(Order item:userOrder){
            if(item.getDate().compareTo(from)>=0 && item.getDate().compareTo(to)<=0){
                result.add(item);
            }
        }
        return result;
    }


    @Override
    public Order addOrderFromUser(Integer user_id, Integer order_price, String date) {
        Order newOrder=new Order(user_id,order_price,date);
        orderRepository.save(newOrder);
        return newOrder;
    }

    @Override
    public OrderItem addOrderItem(Integer order_id, Integer book_id, Integer book_num) {
        Book b=bookRepository.findById(book_id).get();
        Order order=orderRepository.findById(order_id).get();
        OrderItem orderItem=new OrderItem(order,b,book_num);
        orderItemRepository.save(orderItem);
        return orderItem;
    }

// can be commit

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
    public List<Order> getOrderBetween(String from, String to) {
        List<Order> orderList = orderRepository.getOrders();
        List<Order> result = new ArrayList<>();
        for (Order item : orderList) {
            if (item.getDate().compareTo(to) <= 0 && item.getDate().compareTo(from) >= 0) {
                result.add(item);
            }
        }
        return result;
    }
//
//
//    public ArrayList getHotBook(List<OrderItem> orderItemList) {
//        ArrayList<Book> resultArr = new ArrayList<>();
//        for (OrderItem item : orderItemList) {
//            String itemName = item.getBook().getName();
//            Integer itemNum = item.getBook_num();
//            Integer itemBookId = item.getBook().getBookId();
//            Integer itemPrice=item.getBook().getPrice();
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
////      resultArr.sort(Comparator.comparing(Book::getInventory));
//        Collections.sort(resultArr, (Book a1, Book a2) -> a2.getInventory()-a1.getInventory());
//        System.out.println(resultArr);
//        return resultArr;
//    }
//
    @Override
    public List<HotSelling> getHotSelling(String from, String to) {
        List<Order> orderList = getOrderBetween(from, to);
        List<HotSelling> hotBooks=new ArrayList<>();
        for (Order order : orderList) {
            List<OrderItem> orderItemList=order.getOrderItemList();
            for(OrderItem item:orderItemList){
                boolean flag=false;
                String bookName=item.getBook().getName();
                for(HotSelling hotSelling:hotBooks){
                    if(hotSelling.getName().equals(bookName)){
                        flag=true;
                        hotSelling.setNum(hotSelling.getNum()+item.getBook_num());
                        break;
                    }
                }
                if(!flag){
                    HotSelling newHotSelling =new HotSelling(bookName,item.getBook_num());
                    hotBooks.add(newHotSelling);
                }
            }
        }
        return hotBooks;
    }

    @Override
    public List<HotSelling> getHotUsers(String from, String to) {
        List<Order> orderList = getOrderBetween(from, to);
        List<HotSelling> hotUsers=new ArrayList<>();
        for (Order order : orderList) {
            Integer userId=order.getUserId();
            User user=userRepository.findById(userId).get();
            boolean find=false;
            for(HotSelling hotSelling: hotUsers){
                if(hotSelling.getName().equals(user.getName())){
                    hotSelling.setNum(hotSelling.getNum()+order.getOrder_price()); // update the price
                    find=true;
                    break;
                }
            }
            if(!find){
                HotSelling newHotSelling=new HotSelling(user.getName(),order.getOrder_price());
                hotUsers.add(newHotSelling);
            }
        }
        Collections.sort(hotUsers,(HotSelling h1,HotSelling h2)-> h2.getNum()-h1.getNum());
        return hotUsers;
    }

    @Override
    public UserHotSelling getUserHotSelling(String from, String to, Integer user_id) {
        List<Order> orderList = getOrderBetween(from, to);
        List<HotSelling> hotBooks=new ArrayList<>();
        Integer totalNum = 0;
        Integer totalPrice = 0;

        for(Order order:orderList ){
            Integer userId=order.getUserId();
            if(userId.equals(user_id)){
                List<OrderItem> orderItemList=order.getOrderItemList();
                for(OrderItem item:orderItemList){
                    totalNum += item.getBook_num();
                    totalPrice += item.getBook().getPrice();
                    boolean flag=false;
                    String bookName=item.getBook().getName();
                    for(HotSelling hotSelling:hotBooks){
                        if(hotSelling.getName().equals(bookName)){
                            flag=true;

                            hotSelling.setNum(hotSelling.getNum()+item.getBook_num());
                            break;
                        }
                    }
                    if(!flag){
                        HotSelling newHotSelling =new HotSelling(bookName,item.getBook_num());
                        hotBooks.add(newHotSelling);
                    }
                }
            }
        }
        return new UserHotSelling(hotBooks,totalPrice,totalNum);
    }
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



