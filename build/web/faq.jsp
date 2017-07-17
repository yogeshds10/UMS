<%-- 
    Document   : faq
    Created on : Jun 2, 2011, 10:16:27 AM
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
        <style type="text/css">
            #status{
                border:4px solid red;
                width: 300px;
                position: absolute;
                top:140px;
                right:50px;
                background: #ffff8c;
                padding:10px;
            }
            #body{
                position: relative;
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
                    <a href="faq.jsp">FAQ</a>
                </li>	
                <li>
                    <a href="about.jsp">About Us</a>
                </li>	
            </ul>
        </div><br/>
        <div id="status">
            <form action="GetStatus">
                Check status of your application<br/>
                <label>Enter your Application No.</label>
                <input name="appid" id="appid" size="5"/>&nbsp;&nbsp;
                <input type="submit" value="Check"/>
            </form>
        </div>
        <div class="content">
            <h1 style="margin-bottom: 0;">Frequently Asked Questions</h1>
            <dl>
                <dt>How does user can sign up?</dt>
                <dd>Sorry, this facility is not available to the user, 
                    because University itself creates and gives login-id and password to the respective people.</dd>
                <dt>How can I Login?</dt>
                <dd>Give your login-id/ register no and password at Login menu’s you relative login page.</dd>
                <dt>Details about me are found to be wrong, what do I need to do?</dt>
                <dd>Inform to your College Administrator manually...</dd>
                <dt>I made some mistakes in entering marks. What could be done now?</dt>
                <dd>Sorry, there's nothing you can do by yourself. Contact the University administrator.</dd>
                <dt>Why the menu doesn't displays all my options?</dt>
                <dd>Yeah. We know and we are working on it. As of now access all your options from menu in the home page.</dd>
            </dl>
        </div>
    </body>
</html>
