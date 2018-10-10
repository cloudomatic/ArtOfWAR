package io.debug.cache;

public class CacheUserThread extends Thread {
 
  private String threadName;

  public CacheUserThread(String name) {
    this.threadName = name;
  }

  public void run() {
    int uniqueInteger = 0;
    while (true) {
      try {
        sleep(3000);
        java.util.Map cacheInstance = SimpleCache.getInstance();
        cacheInstance.put(
                 (new java.util.Date()).toString() + ": " + threadName + ": Sample log entry",
                     "" + uniqueInteger++
        );
        SimpleCache.dumpCache();
      } catch (InterruptedException ie) {
        System.err.println("CacheUserThread.run(): Exception while sleeping " + ie);
      }
    }
  }

  public static void main(String args[]) {
    (new CacheUserThread("Thread1")).start();
    (new CacheUserThread("Thread2")).start();
  }
}
