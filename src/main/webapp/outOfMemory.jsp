<html>
  
  <head>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>

  <body>
    <%
      java.util.Vector objectPool = new java.util.Vector();
      for (int i=0; i < 100000, i++) {
        out.println("Iteration number " + i + "...");
        for (int j=0; j < 1000000; j++) {
          String someGenericObject = new String("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
          objectPool.add(someGenericObject);
        }
        Thread.currentThread().sleep(500);
      }
    %>
  </body>

</html>
