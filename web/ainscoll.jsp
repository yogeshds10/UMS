<%-- 
    Document   : ainscoll
    Created on : Mar 19, 2011, 2:00:11 AM
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
        <script type="text/javascript" src="scripts/validation.js"></script>
        <script type="text/javascript">
            window.onload=function(){
                document.getElementById('f1').onsubmit=function(){
                    if(!validateNull(document.getElementById('collname'))){return false;}
                    if(!validateNull(document.getElementById('colladd'))){return false;}
                    if(!validateNull(document.getElementById('cuname'))){return false;}
                    if(!validateNull(document.getElementById('cpasswd'))){return false;}
                }
            }
        </script>
    </head>
    <body  id="body" >
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
            <form action="InsertHandler?type=1" method="post" id="f1">
                <h1>Insert College...</h1><br/>
                <label>College Name : </label><input type="text" name="collname" id="collname" size="60"/><br/><br/>
                <label>College Address :  </label><input type="text" name="colladd" id="colladd" size="60"/><br/><br/>
                <label>Administrator Username :  </label><input type="text" name="cuname" id="cuname" size="60"/><br/><br/>
                <label>Administrator Password :  </label><input type="password" name="cpasswd" id="cpasswd" size="60"/><br/><br/>
                <p>
                    <input type="submit" value="Submit"/>&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="Reset"/>
                </p>
            </form>
        </div>
    </body>
</html>