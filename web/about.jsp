<%-- 
    Document   : about
    Created on : Jun 2, 2011, 10:08:49 AM
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
            <p align="justify">
                University Examination Cell is a user friendly platform, which enables the students,
                administrators and lab practical examiners to work efficiently and swiftly. This involves - Adoption
                of online practical examination, where questions will be the generated online just before the commencement
                of examination. Entering valued marks by examiner online, this enables result to appear very soon.
                And maintaining, the colleges database efficiently. All the features that have been mentioned above
                and some more are vital in minimizing the mismanagement of education system in a university.<br/><br/>
                UEC Web Application enables -
            <ol>
                <li>The student pursues the admission online, so that no misuse can be committed   by the college authorities.</li>
                <li>During the practical examination , questions will be generated online just before the examination commences
                    and as soon as the exam is finished marks will be entered by the examiner which will enable result to appear very soon.</li>
                <li>Database of Colleges under the University is maintained efficiently.</li>
                <li>Lab Practical Examiner can use this application for updating marks list after finishing the valuation.</li>
                <li>Generation of results within a short period.</li>
            </ol>
        </p>
    </div>
</body>
</html>
