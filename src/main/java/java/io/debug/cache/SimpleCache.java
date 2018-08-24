package io.debug.cache;

import java.util.Map;
import java.util.Date;
import java.util.concurrent.ConcurrentHashMap;
import java.util.Iterator;

public class SimpleCache {

  private static java.util.concurrent.ConcurrentHashMap<String, String> theCache = null;
  
  public static java.util.concurrent.ConcurrentHashMap getInstance() {
    if (theCache == null) {
      System.out.println("Instantiating the cache.  You should only see this once!");
      theCache = new ConcurrentHashMap<String, String>();
    }
    return theCache;
  }

  public synchronized static void dumpCache() {
    System.out.println("--------------------------- Dumping cache contents ---------------------------");
    Iterator cacheIterator = theCache.entrySet().iterator();
    while (cacheIterator.hasNext()) {
      Map.Entry nameValuePair = (Map.Entry)cacheIterator.next();
      System.out.println(nameValuePair.getKey() + " = " + nameValuePair.getValue());
    }
    System.out.println("------------------------------------------------------------------------------");
  }

  public synchronized static String getCacheContents() {
    String contents = "";
    contents+= "--------------------------- Dumping cache contents ---------------------------";
    Iterator  cacheIterator = theCache.entrySet().iterator();
    while (cacheIterator.hasNext()) {
      Map.Entry nameValuePair = (Map.Entry)cacheIterator.next();
      if (nameValuePair != null) contents+= nameValuePair.getKey() + " = " + nameValuePair.getValue() + "\n";
    }
    contents+= "------------------------------------------------------------------------------";
    return contents;
  }

  public static void main(String args[]) {
    for (int i=0; i < 10; i++) {
      java.util.concurrent.ConcurrentHashMap<String, String> cache = SimpleCache.getInstance();
      cache.put("CurrentTime " + i, "" + (new java.util.Date()).toString() );
    }
    SimpleCache.dumpCache();
  }

}
