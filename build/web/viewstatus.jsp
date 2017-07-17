
<%-- 
    Document   : viewstatus
    Created on : May 22, 2011, 2:47:45 PM
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
            #body #status form label{
                text-align:inherit;
                padding-left: 0;
            }
            #body{
                position: relative;
            }
            fieldset{
                width:500px;
                margin: 0 auto;
                padding: 10px;
                background: #FFF;
                border: 5px #446CD7 solid;
            }
            #body form label{
                text-align: left;
                padding-left: 90px;
                width:110px;
            }
            a:hover{
                cursor: pointer;
            }
        </style>
        <script type="text/javascript">
            function goback(){
                window.history.back();                
            }
        </script>
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
            <form>
                <h1>Application Status</h1>
                <fieldset>
                    <label>Application No. </label><span style="font-weight: bolder;">:&nbsp;&nbsp;&nbsp;&nbsp;</span>${requestScope.appBean.getAppid()}<br/><br/>
                    <label>First Name </label><span style="font-weight: bolder;">:&nbsp;&nbsp;&nbsp;&nbsp;</span>${requestScope.appBean.getFname()}<br/><br/>    
                    <label>Last Name </label><span style="font-weight: bolder;">:&nbsp;&nbsp;&nbsp;&nbsp;</span>${requestScope.appBean.getLname()}<br/><br/>    
                    <label>Gender </label><span style="font-weight: bolder;">:&nbsp;&nbsp;&nbsp;&nbsp;</span>${requestScope.appBean.getGender()}<br/><br/>    
                    <label>Status </label><span style="font-weight: bolder;">:&nbsp;&nbsp;&nbsp;&nbsp;</span>${requestScope.appBean.getStatus()}<br/><br/>    
                </fieldset>
                <a style="margin:30px;display: block;" onclick="goback();">Click here to go back</a>
            </form>
        </div>
    </body>
</html>
