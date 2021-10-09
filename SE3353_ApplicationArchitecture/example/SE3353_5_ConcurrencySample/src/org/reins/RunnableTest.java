package org.reins;

public class RunnableTest implements  Runnable{
    public void run() {
        System.out.println(11);
        System.out.println("Love you");
        System.out.println("Hello from a thread!");
    }

    public static void main(String args[]) {
        (new Thread(new RunnableTest())).start();
        (new Thread(new RunnableTest())).start();
    }
}
