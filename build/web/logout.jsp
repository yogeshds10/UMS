<%-- 
    Document   : logout
    Created on : Jun 2, 2011, 2:41:12 PM
    Author     : Vinnu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>University Examination Cell  </title>
        <link rel="stylesheet" type="text/css" href="styles/superfish.css" media="screen">
        <link type="text/css" rel="stylesheet" href="styles/main.css" />
        <link type="text/css" rel="stylesheet" href="styles/form.css" />
        <link type="text/css" rel="stylesheet" href="styles/fonts-min.css" />
        <script type="text/javascript" src="scripts/jquery-1.2.6.min.js"></script>
        <script type="text/javascript" src="scripts/hoverIntent.js"></script>
        <script type="text/javascript" src="scripts/superfish.js"></script>
        <script type="text/javascript">

            // initialise plugins
            jQuery(function(){
                jQuery('ul.sf-menu').superfish();
            });

        </script>
        <%
            String Message = request.getParameter("msg");
            try {

                if (Message.equals("null")) {
                    Message = "Action Performed Successfully";
                }
            } catch (Exception e) {
                Message = "Action Performed Successfully";
            }
        %>
        <style type="text/css">
            a:hover{
                cursor: pointer;
            }
        </style>
    </head>
    <body id="body" >
        <div id="header">
            <img src="images/UEC.jpg" alt="Logo" />
            University Examination Cell</div>
        <div id="Menu">
            <ul class="sf-menu">
                <li class="current">
                    <a href="FindHome">Home</a>
                </li>
                <li>
                    <a href="application.jsp">New Admission</a>
                </li>
                <li>
                    <a href="login.jsp">Login</a>
                    <ul>
                        <li><a href="alogin.jsp">University Administrator</a></li>
                        <li><a href="calogin.jsp">College Administrator</a></li>
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
        <div class="content" style="margin: 50px;">
            <fieldset style="border:5px dashed green;">
                <p>
                    <img src="images/UEC.jpg" alt="Task Completed..!!!" style="padding-bottom: 50px;float:left;width:100px;height:100px;"/>
                <h3 style="font-size: 2em;padding-left:10px;overflow: hidden;">Successfully Logged out.</h3><br/><br/><br/>
                <a style="margin-left: 15px;" href="login.jsp">Click here to login again</a>
                </p>
            </fieldset>
        </div>
    </body>
</html>

