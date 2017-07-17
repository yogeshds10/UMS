<%-- 
    Document   : index
    Created on : Mar 17, 2011, 2:11:43 PM
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
                right:40px;
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
        <div id="status">
            <form action="GetStatus">
                Check status of your application<br/>
                <label>Enter your Application No.</label>
                <input name="appid" id="appid" size="5"/>&nbsp;&nbsp;
                <input type="submit" value="Check"/>
            </form>
        </div>
        <div class="content">
            <img src="images/UEC.jpg" alt="LOGO"
                 style="float:right; margin-left: 20px; margin-right: 50px; width: 150px; height: 150px; border: 5px solid grey;" >
            <p align="justify">University Examination Cell is a user friendly platform,
                which enables the students, lecturers, administrators and examiners to work efficiently and swiftly.
                This involves - Adoption of online practical examination, where questions will be the generated online just before the commencement of examination.
                Entering of marks secured by the student by examiner online, which will enable result to appear very soon And avoiding difficulties in distribution
                of examiner examination duty time table to examiners personal email account. All the features that have been mentioned above and some more are vital
                in minimizing the mismanagement of education system in a university.</p>
        </div>
    </body>
</html>
