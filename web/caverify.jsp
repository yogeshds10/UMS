<%-- 
    Document   : caverify
    Created on : May 14, 2011, 12:53:23 PM
    Author     : Vinnu
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <%
            String u = "";
            try {
                u = session.getAttribute("uid").toString();
                if (u.equals("")) {
                    response.sendRedirect("calogin.jsp");
                }
            } catch (Exception e) {
                response.sendRedirect("calogin.jsp");
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>University Examination Cell  </title>
        <link rel="stylesheet" type="text/css" href="styles/superfish.css" media="screen">
        <link type="text/css" rel="stylesheet" href="styles/main.css" />
        <link type="text/css" rel="stylesheet" href="styles/fonts-min.css" />
        <link type="text/css" rel="stylesheet" href="styles/form.css" />
        <script type="text/javascript" src="scripts/jquery-1.2.6.min.js"></script>
        <script type="text/javascript" src="scripts/hoverIntent.js"></script>
        <script type="text/javascript" src="scripts/superfish.js"></script>
        <script type="text/javascript">

            // initialise plugins
            jQuery(function(){
                jQuery('ul.sf-menu').superfish();
            });

        </script>
        <script type="text/javascript" src="scripts/validation.js"></script>
        <script type="text/javascript">
            window.onload=function(){
                document.getElementById('appid').focus();
                document.getElementById('f1').onsubmit=function(){
                    if(!validateNumber(document.getElementById('appid')))
                    {
                        return false;
                    }
                    return true;
                }
            }
        </script>
    </head>
    <body id="body">
        <div id="header">
            <img src="images/UEC.jpg" alt="Logo" />
            University Examination Cell</div>

        <div id="logout">
            Welcome <%=u%>, <a href="Logout">logout</a>
        </div>
        <div id="Menu">
            <ul class="sf-menu">
                <li class="current">
                    <a href="FindHome">Home</a>
                </li>
                <li>
                    <a href="catasks.jsp">Tasks</a>
                    <ul>
                        <li><a href="caverify.jsp">Process Application</a></li>
                        <li><a href="cainsstu.jsp">Insert New Student</a></li>
                        <li><a href="#">Update Internal Marks</a></li>
                    </ul>
                </li>
                <li>
                    <a href="faq.jsp">FAQ</a>
                </li>	
                <li>
                    <a href="about.jsp">About Us</a>
                </li>	
            </ul>
        </div><br/>
        <div class="content">
            <form action="LoadApplication" method="post" id="f1"> 
                <h1>Application Processing</h1>
                <label>Enter Application No. : </label>
                <input type="text" name="appid" id="appid" />&nbsp;&nbsp;&nbsp;
                <input type="submit" value="Submit"/>
            </form> 
        </div>
    </body>
</html>