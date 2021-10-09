package org.reins;

public class UnSafeMultipleThreads<Static, c> {
    // Display a message, preceded by
    // the name of the current thread
    static void threadMessage(String message) {
        String threadName =
                Thread.currentThread().getName();
        System.out.format("%s: %s%n",
                threadName,
                message);
    }


//    Counter c = new Counter();
//    SynchronizedCounter c = new SynchronizedCounter();
    AtomicCounter c = new AtomicCounter();

    private class CounterLoop implements Runnable {
        private int sleep;
        public void setSleep(int sleep){
            this.sleep = sleep;
        }
        public void run() {
            try {
                for (int i = 0; i < 100; i++) {
                    Thread.sleep(sleep);
                    threadMessage(String.valueOf(c.value()));
                    c.increment();
                }
            } catch (InterruptedException e) {
                threadMessage("I wasn't done!");
            }
        }
    }

    public static void main(String args[])
            throws InterruptedException {

        threadMessage("Starting MessageLoop thread");
        long startTime = System.currentTimeMillis();

        UnSafeMultipleThreads s = new UnSafeMultipleThreads();
        UnSafeMultipleThreads.CounterLoop c1 = s.new CounterLoop();
        c1.setSleep(1000);
        Thread t1 = new Thread(c1);
        t1.start();
        UnSafeMultipleThreads.CounterLoop c2 = s.new CounterLoop();
        c2.setSleep(1000);
        Thread t2 = new Thread(c2);
        t2.start();

        threadMessage("Waiting for MessageLoop thread to finish");
    }
}
