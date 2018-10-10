<html>
  
  <head>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>

  <body>
    <%
      boolean weAreLoopingInTheHangCondition = true;
      while (weAreLoopingInTheHangCondition) {
        try {
          Thread.currentThread().sleep(10000);
        } catch (InterruptedException ie) {
          System.err.println("simulateHungApp.jsp: InterruptedException attempting to put the current thread to sleep");
        }
      }
    %>
  </body>

</html>
