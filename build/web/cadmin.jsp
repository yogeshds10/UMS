<%-- 
    Document   : cadmin
    Created on : May 13, 2011, 7:01:23 PM
    Author     : Vinnu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <script type="text/javascript" src="scripts/jquery-1.2.6.min.js"></script>
        <script type="text/javascript" src="scripts/hoverIntent.js"></script>
        <script type="text/javascript" src="scripts/superfish.js"></script>
        <script type="text/javascript">

            // initialise plugins
            jQuery(function(){
                jQuery('ul.sf-menu').superfish();
            });

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
                        <li><a href="cagetstulist.jsp">Generate Student List</a></li>
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