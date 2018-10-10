<%@ page import="java.util.Enumeration" %>

<html>
  
  <head>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>

  <body>
    <h1>Host: <%= java.net.InetAddress.getLocalHost().getHostName() %> </h1><br>
    <h1>IP:    <%= java.net.InetAddress.getLocalHost().getHostAddress() %></h1><br>
    <br>
    <h1>HTTP Headers Received:</h1>
    <blockquote>
      <table border="1" cellpadding="1" cellspacing="0">
        <%
          Enumeration listOfHeaderNames = request.getHeaderNames();
          while (listOfHeaderNames.hasMoreElements()) {
            String headerName = (String)listOfHeaderNames.nextElement();
            %>
              <tr><td><%= headerName %></td><td><%= request.getHeader(headerName) %></td></tr>
            <%
          }
        %>
      </table>
     </blockquote>
     <h1>Environment Variables</h1>
     <blockquote>
       <table border="1" cellpadding="1" cellspacing="0">
       <%
         java.util.Map<String, String> environmentVariables = System.getenv();
         for (String environmentVariableName : environmentVariables.keySet()) {
       %>
           <tr><td><%= environmentVariableName %></td><td><%= environmentVariables.get(environmentVariableName) %></td></tr>
       <%
         }
       %>
       </table>
     </blockquote>

     <h1>System Properties</h1>
     <blockquote>
       <table border="1" cellpadding="1" cellspacing="1">
       <%
         java.util.Properties systemProperties = System.getProperties();
         java.util.Enumeration listOfSystemProperties = systemProperties.propertyNames();
         while (listOfSystemProperties.hasMoreElements()) {
           String systemPropertyName = (String) listOfSystemProperties.nextElement();
           %>
             <tr><td><%= systemPropertyName %></td><td><%= systemProperties.getProperty(systemPropertyName) %></td></tr>
           <%
           }
       %>
       </table>
       </blockquote>
       <br>
  </body>
</html>

    
