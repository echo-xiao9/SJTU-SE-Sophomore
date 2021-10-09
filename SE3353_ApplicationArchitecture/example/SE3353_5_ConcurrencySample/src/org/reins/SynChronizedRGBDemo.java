package org.reins;

public class SynChronizedRGBDemo {

    SynchronizedRGB color;

    public SynChronizedRGBDemo() {
        color = new SynchronizedRGB(0, 0, 0, "Pitch Black");
    }

    public void demo() {
        Thread t1 = new Thread(new Runnable() {
            @Override
            public void run() {
                System.out.println(color.getRGB());   //Statement 1
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.println(color.getName());  //Statement 2
            }
        });
        t1.start();

        Thread t2 = new Thread(new Runnable() {
            @Override
            public void run() {
                color.set(255, 0, 0, "Scarlet");
            }
        });
        t2.start();
    }

    public static void main(String args[])
            throws InterruptedException {
        SynChronizedRGBDemo s = new SynChronizedRGBDemo();
        s.demo();
    }
}
