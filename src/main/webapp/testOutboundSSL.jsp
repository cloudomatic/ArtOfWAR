<html>
  
  <head>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>


<!-- -Djavax.net.ssl.trustStore=trustStore -->
<!-- https.protocols -->
<!-- 
   https://blogs.oracle.com/java-platform-group/diagnosing-tls,-ssl,-and-https
-->
  <body>

  <form>
    Enter an HTTPS URL to connect to:
      <input type=text name=remoteHost value="https://www.w3c.org"><br>
      <input type=submit name=submit value="connect">
      <br><br>
      <a href="?enaqbleSSLDebugging=true">Set the -Djavax.net.debug=all system property in this JVM</a><br>
  <form>

  <%
    if (request.getParameter("remoteHost") != null) {
      try {
        javax.net.ssl.HttpsURLConnection httpsConnection = (javax.net.ssl.HttpsURLConnection) (
          (new java.net.URL(request.getParameter("remoteHost"))).openConnection()
        );
        java.io.BufferedReader reader = new java.io.BufferedReader(
          new java.io.InputStreamReader(httpsConnection.getInputStream())
        );
        String line;
        while ( (line = reader.readLine()) != null ) {
          out.println(line);
        }
        reader.close();
        out.println("Connection successful<br>");
      } catch (java.net.MalformedURLException mfue) {
        mfue.printStackTrace();
      } catch (java.io.IOException ioe) {
        ioe.printStackTrace();
      }
    }
    
    if ( (new String("true")).equals(request.getParameter("enableSSLDebugging")) ) System.setProperty("javax.net.debug", "all");
    else if ( (new String("false")).equals(request.getParameter("enableSSLDebugging")) ) System.setProperty("javax.net.debug", "none");
  %>
  </body>

</html>
