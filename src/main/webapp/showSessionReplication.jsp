<html>
  
  <head>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>

  <body>

    <%
        //String hostname = System.getenv().get("HOSTNAME");
        String hostname = java.net.InetAddress.getLocalHost().getHostName();
        String timestamp = (new java.util.Date()) + "";

        // We wish to set an attribute in the HTTP session that we can continually update each time the page is accessed

        String newSessionAttribute =  session.getAttribute("history") + "<br>access time=" + timestamp + ", host_accessed = " + hostname;
        session.setAttribute( "history", newSessionAttribute );
    %>
    
    Transaction history:<br>
    <br>
    <blockquote>
      <% 
        // Display the "history" session attribute each time the page is reloaded
        // We expect to see a mix of entries from all cluster members as we are load-balanced between nodes

        java.util.Enumeration sessionAttributes = session.getAttributeNames();
        while (sessionAttributes.hasMoreElements()) {
          String name = (String)sessionAttributes.nextElement();
          out.println(name + "=" + session.getAttribute(name) + "<br>");
        }
      %>
    </blockquote>

  </body>
</html>
