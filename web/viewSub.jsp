<%-- 
    Document   : viewSub
    Created on : Mar 21, 2011, 7:30:32 PM
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
                if (!u.equals("admin")) {
                    response.sendRedirect("alogin.jsp");
                }
            } catch (Exception e) {
                response.sendRedirect("alogin.jsp");
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
                    <a href="ainsert.jsp">Insert</a>
                    <ul>
                        <li><a href="ainscoll.jsp">College</a></li>
                        <li><a href="ainscourse.jsp">Course</a></li>
                        <li><a href="ainssub.jsp">Subject</a></li>
                    </ul>
                </li>
                <li>
                    <a href="ainsert.jsp">Assign</a>
                    <ul>
                        <li><a href="ainscoldet.jsp">Course to College</a></li>
                        <li><a href="ainscodet.jsp">Subject to Course</a></li>
                    </ul>
                </li>
                <li>
                    <a href="aview.jsp">View</a>
                    <ul>
                        <li><a href="aviewcoll.jsp">College</a></li>
                        <li><a href="aviewcourse.jsp">Course</a></li>
                        <li><a href="aviewsub.jsp">Subject</a></li>
                    </ul>
                </li>
                <li>
                    <a href="atasks.jsp">Tasks</a>
                    <ul>
                        <li><a href="ainsexaminer.jsp">Create Examiner</a></li>
                        <li><a href="#">Update Marks</a></li>
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
            <form action="#" method="post" id="f">
                <h1>Course Details</h1>
                <jsp:useBean id="subject" scope="request" class="uec.Sub" />
                <label>Subject Id : </label>
                <input type="text" name="sid" value='<jsp:getProperty name="subject" property="sid" />' size="1" readonly /><br/><br/>
                <label>Subject Name : </label>
                <input type="text" name="subname" value='<jsp:getProperty name="subject" property="subname" />' size="60" readonly/><br/><br/>
                <label>Type : </label>
                <input type="text" name="Type" id="nos" value='<jsp:getProperty name="subject" property="subtype" />' size="60" readonly/><br/><br/>
                <label>Description : </label>
                <input type="text" name="desc" id="nos" value='<jsp:getProperty name="subject" property="subdesc" />' size="60" readonly/><br/><br/>
            </form>
        </div>
    </body>
</html>
