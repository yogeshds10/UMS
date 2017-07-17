<%-- 
    Document   : exam
    Created on : Jun 1, 2011, 11:46:29 AM
    Author     : Vinnu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
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
        <script type="text/javascript" src="scripts/validation.js"></script>
        <script type="text/javascript">
            window.onload=function(){
                document.getElementById('stuid').focus();
                document.getElementById('f1').onsubmit=function(){
                    if(!validateNumber(document.getElementById('stuid'))){return false;}
                    if(!validateNull(document.getElementById('euid'))){return false;}
                    if(!validateNull(document.getElementById('epasswd'))){return false;}
                    return true;
                }
            }
        </script>
    </head>
    <body id="body">
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

        <div class="content">
            <form action="GetQuestions" method="post" id="f1"> 
                <h1>Practical Examination</h1>
                <label>Enter Student Id. : </label>
                <input type="text" name="stuid" id="stuid" /><br/><br/>
                <label>Examiner Username : </label>
                <input type="text" name="euid" id="euid" /><br/><br/>
                <label>Examiner Password : </label>
                <input type="password" id="epasswd" name="epasswd" /><br/><br/>
                <p>
                    <input type="submit" value="Submit"/>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" />
                </p>
            </form> 
        </div>
    </body>
</html>