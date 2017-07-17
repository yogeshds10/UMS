<%-- 
    Document   : viewapp
    Created on : May 22, 2011, 9:01:49 AM
    Author     : Vinnu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="uec.Course,uec.ApplicationBean,uec.College"%>
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
        <script type="text/javascript">
            window.onload=function(){
                x=document.getElementsByName('mysubmit');
                for(i=0;i<x.length;++i)
                {
                    x[i].onclick=function(){
                        if(this.value == 'Received'){
                            document.getElementById('form1').action='ProcessApplication?type=Received';
                        }else if(this.value=='Verified'){
                            document.getElementById('form1').action='ProcessApplication?type=Verified';                          
                        }else if(this.value=='Admitted'){
                            document.getElementById('form1').action='ProcessApplication?type=Admitted';                            
                        }else{
                            alert("Sorry, Something went wrong... Unable to process now....!!!");
                        }               
                        document.getElementById('form1').submit();                      
                    }
                }
            }
        </script>
    </head>
    <body id="body" >
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
            <%ApplicationBean ab = (ApplicationBean) request.getAttribute("appBean");%>
            <form action="#" method="post" id="form1">
                <h1>Application Form</h1><br/>
                <label>Application No. : </label>
                <input type="text" name="appid" id="appid" value="${requestScope.appBean.getAppid()}" readonly /><br/><br/>
                <label>First Name : </label>${requestScope.appBean.getFname()}<br/><br/>
                <label>Last Name :  </label>${requestScope.appBean.getLname()}<br/><br/>
                <label>Gender : </label>${requestScope.appBean.getGender()}<br/><br/>
                <label>Medium : </label>${requestScope.appBean.getMedium()}<br/><br/>
                <label>Nationality : </label>${requestScope.appBean.getNation()}<br/><br/>
                <label>PUC College Name : </label>${requestScope.appBean.getPucollname()}<br/><br/>
                <label>PUC Course : </label>${requestScope.appBean.getPucourse()}<br/><br/>
                <label>Percentage in PUC : </label>${requestScope.appBean.getPpercent()}%<br/><br/>
                <label>Percentage in SSLC : </label>${requestScope.appBean.getSpercent()}%<br/><br/>
                <label>Address : </label> ${requestScope.appBean.getAddress()}<br/><br/>
                <label>Email : </label> ${requestScope.appBean.getEmail()}<br/><br/>
                <label>Phone : </label> ${requestScope.appBean.getPhone()}<br/><br/>
                <label>College : </label><%=College.getCollNameById(Integer.parseInt(ab.getCollname()))%><br/><br/>
                <label>Course : </label><%=Course.getCourseNameById(Integer.parseInt(ab.getConame()))%><br/><br/>
                <p>
                    <input type="button" value="Received" name="mysubmit"/>&nbsp;&nbsp;&nbsp;
                    <input type="button" value="Verified" name="mysubmit"/>&nbsp;&nbsp;&nbsp;
                    <input type="button" value="Admitted" name="mysubmit"/>&nbsp;&nbsp;&nbsp;
                </p>
        </div>
    </body>
</html>
