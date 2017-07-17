<%-- 
    Document   : marks
    Created on : Jun 1, 2011, 7:57:24 PM
    Author     : Vinnu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="uec.Sub"%>
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
                document.getElementById('f1').onsubmit=function(){
                    if(!validateNumber(document.getElementById('marks1'))){return false;}
                    if(!validateNumber(document.getElementById('marks2'))){return false;}
                    if(!validateNull(document.getElementById('euid'))){return false;}
                    if(!validateNull(document.getElementById('epasswd'))){return false;}
                    x=confirm("Are You Sure want to proceed....?\nNote:Marks once entered can't be changed.");
                    if(!x){return false;}
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
            <form action="UpdateMarks" method="post" id="f1"> 
                <h1>Questions</h1>
                <label>Student Id. : </label>
                <input type="text" name="stuid" size="5" id="stuid" value="<%=request.getParameter("stuid")%>" readonly/><br/><br/>
                <label>Subject : </label>
                <input type="text" name="subject" id="subject" value="<%=request.getParameter("subject")%>" readonly/><br/><br/>
                <label>Question 1 : </label>
                <input type="text" name="q1" id="q1" size="70" value="<%=request.getParameter("q1")%>" readonly/><br/><br/>
                <label>Question 2 : </label>
                <input type="text" name="q2" id="q2" size="70" value="<%=request.getParameter("q2")%>" readonly/><br/><br/>
                <label>Marks 1 : </label>
                <input type="text" name="marks1" id="marks1" size="2" maxlength="2"/><br/><br/>
                <label>Marks 2 : </label>
                <input type="text" name="marks2" id="marks2" size="2" maxlength="2"/><br/><br/>
                <label>Examiner UID : </label>
                <input type="text" name="euid" id="euid" /><br/><br/>
                <label>Examiner Password : </label>
                <input type="password" name="epasswd" id="epasswd" />
                <p>
                    <input type="hidden" name="sid" value='<%=request.getParameter("sid")%>'/>
                    <input type="submit" value="Submit"/>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" />
                </p>
            </form> 
        </div>
    </body>
</html>