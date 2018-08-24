<html>
  
  <head>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>

  <body>
    This page demonstrates an in-memory cache (using java.util.concurrent.concurrentHashMap) which is localized to a classloader.  In the language of JBoss, dynamic modules (e.g. WAR files in an EAR) will each see their own cache instance.  Moving the classes to the EAR level (e.g. lib/cache.jar) makes the class global to the enterprise application.  The next level "up" is to share the cache across cluster members, which is what the Infinispan/Jboss Enterprise Data Grid is for.

    <br><br>
    Click <a href="?startThreads=true">here</a> to start two logging threads in the cache local to this JVM.<br><br>
    Click <a href="?dumpCache=true">here</a> to show the contents of the local cache.<br><br>
    <%
      if (request.getParameter("startThreads" != null) {
        (new debug.io..cache.CacheUserThread("Thread1")).start();
        (new debug.io.cache.CacheUserThread("Thread2")).start();
      } else if (request.getParameter("putValue") != null) {
        debug.io.cache.SimpleCache.getInstance().put(
          request.getParameter("key"),
          request.getParameter("value")
        );
     }  else if (request.getParameter("dumpCache") != null) {
       out.println("Showing the cache contents...<br>");
       out.println("<pre>");
       out.println(debug.io.cache.SimpleCache.getCacheContents());
       // This dumps the contents to server.log
       // debug.io.cache.SimpleCache.dumpCache();
       out.println("</pre>");
     }
  %>
  </body>

</html>
