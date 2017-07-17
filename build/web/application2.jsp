<%-- 
    Document   : application2
    Created on : Apr 12, 2011, 11:20:56 PM
    Author     : Vinnu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>University Examination Cell  </title>
        <%
            Connection con = null;
            Statement st = null;
            Statement subst = null;
            ResultSet rs = null;
            ResultSet subrs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uec", "root", "admin");
                st = con.createStatement();
                subst = con.createStatement();
                rs = st.executeQuery("select course.courseid, coname "
                        + "from course, coll_course "
                        + "where course.courseid=coll_course.courseid and collid=" + request.getParameter("collname"));
        %>
        <link rel="stylesheet" type="text/css" href="styles/superfish.css" media="screen">
        <link type="text/css" rel="stylesheet" href="styles/main.css" />
        <link type="text/css" rel="stylesheet" href="styles/form.css" />
        <link type="text/css" rel="stylesheet" href="styles/fonts-min.css" />
        <style type="text/css">
            #agreement{
                width: 700px;
                margin: auto;
                height: 400px;
                text-align: center;
            }
            #agreement ul{
                font-size: 1.2em;
                text-align: left;
                border:none;
                margin: 0;
                padding: 20px;
                padding-left: 50px;
            }
            #agreement fieldset legend{
                margin-left: 20px;
            }
        </style>
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
                document.getElementById("coname").focus();
                load();
                document.getElementById("form1").onsubmit=validate;
            };
            function validate(){
                //Validating the Date.....
                if(!validateSelect(document.getElementById('coname'),"Please Choose Valid Course"))
                    return false;
                //Validating the Agreement.....
                if(!(document.getElementById("chk").checked)){
                    alert("Please accept the terms and conditions...!");
                    document.getElementById("chk").focus();
                    return false;
                }
            }
            function load(){
            <%while (rs.next()) {%>
                    x=document.createElement("option");
                    x.text="<%=rs.getString(2)%>";
                    x.value="<%=rs.getString(1)%>";
                    try{
                        document.getElementById("coname").add(x);
                    }catch(e){
                        document.getElementById("coname").add(x,null);
                    }

            <%}%>
                }
        </script>

        <%
            } catch (Exception e) {
                out.println("Error : " + e);
            }%>

    </head>
    <body id="body">
        <jsp:useBean id="applicationBean" scope="session" class="uec.ApplicationBean" />
        <jsp:setProperty name="applicationBean" property="*"></jsp:setProperty>
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
                        <li><a href="#">Practical Examiner</a></li>
                        <li><a href="#">Student</a></li>
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
            <form action="AdmissionHandler" method="post" id="form1">
                <h1>Application Form</h1><br/>
                <label>Choose Course : </label>
                <select name="coname" id="coname">
                    <option value="-1">Choose Course</option>
                </select><br/><br/>
                <div id="agreement">
                    <fieldset>
                        <legend>Eligibility</legend>
                        <ul>
                            <li>Student must be passed in SSLC.</li>
                            <li>PUC or 10+2 (CBSE) with Science, Electronics, Computer Science, Commerce, Job Orientation Course 
                                in Computer Science, Diploma in Electronics or Computer Science with a minimum aggregate of 35%.</li>
                        </ul>
                    </fieldset>
                    <fieldset>
                        <legend>Conditions</legend>
                        <ul>
                            <li>Application form must be filled with correct information.</li>
                            <li>If the student is from BPL family, at admission time only he/she has to submit the BPL Certificate.</li>
                            <li>Student must submit Migration Certificate.</li>
                            <li>Student must follow the rules and regulations of college.</li>
                        </ul>
                    </fieldset>
                    <input type="checkbox" id="chk" />
                    I accept Terms & Conditions.
                </div>
                <p>
                    <input type="submit" value="Submit"/>&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="Reset"/>
                </p>
            </form>
        </div>
    </body>
</html>