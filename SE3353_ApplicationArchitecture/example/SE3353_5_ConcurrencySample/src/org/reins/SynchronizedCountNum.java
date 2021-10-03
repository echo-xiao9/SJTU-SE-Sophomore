package org.reins;



public class SynchronizedCountNum {

    public static void main (String[] args) {

        int i = 0;
        while (i < 10) {
            Thread test = new CountThread();
            test.start();
            i++;
        }
        //SleepUtil.sleep(10000);
        //System.out.println(Test.num);
    }

    static  class CountThread extends  Thread {
        @Override
        public void run () {
            try {
                Test.doSomething();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    static class Test {

        public  static  int num = 0;
        public  synchronized static void doSomething() throws InterruptedException {
            num++;
            Thread.sleep(1000);// 模拟做事
            System.out.println(num);
        }
    }
}