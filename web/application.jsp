<%-- 
    Document   : admission
    Created on : Apr 4, 2011, 8:10:24 PM
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
                rs = st.executeQuery("select collid,collname from uec.college");
                subrs = subst.executeQuery("select courseid,coname from uec.course");
        %>
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
                document.getElementById("fname").focus();
                for(i=1980;i<2010;++i)
                {
                    op=document.createElement("option");
                    op.text=i;
                    op.value=i;
                    try{
                        document.getElementById("year").add(op);
                    }catch(e){
                        document.getElementById("year").add(op,null);
                    }
                }
                for(i=1;i<=31;++i)
                {
                    op=document.createElement("option");
                    op.text=i;
                    op.value=i;
                    try{
                        document.getElementById("date").add(op);
                    }catch(e){
                        document.getElementById("date").add(op,null);
                    }
                }
                load();
                document.getElementById("form1").onsubmit=validate;
            };
            function validate(){
                //Validating the First Name....
                if(!validate_name(document.getElementById('fname')))
                    return false;
                //Validating the Last Name....
                if(!validate_name(document.getElementById('lname')))
                    return false;
                //Validating the Year....
                if(!validateSelect(document.getElementById('year'),"Please Choose Valid Year"))
                    return false;
                //Validating the Month....
                if(!validateSelect(document.getElementById('mnth'),"Please Choose Valid Month"))
                    return false;
                //Validating the Date.....
                if(!validateSelect(document.getElementById('date'),"Please Choose Valid Date"))
                    return false;
                //Validating the Gender.....
                if(!((document.getElementById("male").checked)||(document.getElementById('female').checked))){
                    alert("Please Choose among given values...!");
                    document.getElementById("male").focus();
                    return false;
                }
                //Validating the Medium....
                if(!((document.getElementById("kannada").checked)||(document.getElementById('english').checked))){
                    alert("Please Choose among given values...!");
                    document.getElementById("kannada").focus();
                    return false;
                }
                //Validating the Nationality....
                if(!((document.getElementById("indian").checked)||(document.getElementById('other').checked))){
                    alert("Please Choose among given values...!");
                    document.getElementById("indian").focus();
                    return false;
                }
                //Validating the PU College Name....
                if(!validateNull(document.getElementById('pucollname')))
                    return false;
                //Validating the PU Course....
                if(!((document.getElementById("pusci").checked)||(document.getElementById('pucomm').checked)||(document.getElementById("puart").checked)||(document.getElementById('puother').checked))){
                    alert("Please Choose among given values...!");
                    document.getElementById("pusci").focus();
                    return false;
                }
                //Validating the PU Percentage....
                if(!validateNumber(document.getElementById('ppercent')))
                    return false;
                //Validating the SSLC Percentage....
                if(!validateNumber(document.getElementById('spercent')))
                    return false;
                //Validating the Address....
                if(!validateNull(document.getElementById('address')))
                    return false;
                //Validating the Email....
                if(!validate_email(document.getElementById('email'),'Invalid Email Address')){
                    document.getElementById('email').select();
                    return false;
                }
                //Validating the Phone Number....
                if(!validateNumber(document.getElementById('phone')))
                    return false;
                //Validating the Year....
                if(!validateSelect(document.getElementById('collname'),"Please Choose Valid Collge"))
                    return false;
            }

            function load(){
            <%while (rs.next()) {%>
                    x=document.createElement("option");
                    x.text="<%=rs.getString(2)%>";
                    x.value="<%=rs.getString(1)%>";
                    try{
                        document.getElementById("collname").add(x);
                    }catch(e){
                        document.getElementById("collname").add(x,null);
                    }

            <%}%>
                    document.getElementById('fname').focus();
                }
        </script>

        <%
            } catch (Exception e) {
                out.println("Error : " + e);
            }%>

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
            <form action="application2.jsp" method="post" id="form1">
                <h1>Application Form</h1><br/>
                <label>First Name : </label><input type="text" name="fname" id="fname" size="60" maxlength="40"/><br/><br/>
                <label>Last Name :  </label><input type="text" name="lname" id="lname" size="60" maxlength="40"/><br/><br/>
                <label>Date of Birth : </label>
                <select name="year" id="year">
                    <option value="-1">Year</option>
                </select>
                <select name="mnth" id="mnth">
                    <option value="-1">Month</option>
                    <option value="1">January</option>
                    <option value="2">February</option>
                    <option value="3">March</option>
                    <option value="4">April</option>
                    <option value="5">May</option>
                    <option value="6">June</option>
                    <option value="7">July</option>
                    <option value="8">August</option>
                    <option value="9">September</option>
                    <option value="10">October</option>
                    <option value="11">November</option>
                    <option value="12">December</option>
                </select>
                <select name="date" id="date">
                    <option value="-1">Date</option>
                </select>
                <br/><br/>
                <label>Gender : </label> <input type="radio" name="gender" value="Male" id="male"> Male
                <input type="radio" name="gender" value="Female" id="female"> Female
                <br/><br/>
                <label>Medium : </label> <input type="radio" name="medium" value="Kannada" id="kannada"> Kannada
                <input type="radio" name="medium" value="English" id="english"> English
                <br/><br/>
                <label>Nationality : </label> <input type="radio" name="nation" value="Indian" id="indian"> Indian
                <input type="radio" name="nation" value="Other" id="other"> Other
                <br/><br/>
                <label>PUC College Name : </label><input type="text" name="pucollname" id="pucollname" size="60"/><br/><br/>
                <label>PUC Course : </label>
                <input type="radio" name="pucourse" value="1" id="pusci"> PUC Science
                <input type="radio" name="pucourse" value="2" id="pucomm"> PUC Commerce
                <input type="radio" name="pucourse" value="3" id="puart"> PUC Arts
                <input type="radio" name="pucourse" value="4" id="puother"> Other
                <br/><br/>
                <label>Percentage in PUC : </label><input type="text" name="ppercent" id="ppercent" size="2" maxlength="2"/>%<br/><br/>
                <label>Percentage in SSLC : </label><input type="text" name="spercent" id="spercent" size="2" maxlength="2"/>%<br/><br/>
                <label>Address : </label> <input type="text" name="address" id="address" size="60"/><br/><br/>
                <label>Email : </label> <input type="text" name="email" id="email" size="60"/><br/><br/>
                <label>Phone : </label> <input type="text" name="phone" id="phone" size="60" maxlength="10"/><br/><br/>
                <label>College : </label>
                <select name="collname" id="collname">
                    <option value="-1">Choose College</option>
                </select><br/><br/>
                <p>
                    <input type="submit" value="Submit"/>&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="Reset"/>
                </p>
            </form>
        </div>
    </body>
</html>