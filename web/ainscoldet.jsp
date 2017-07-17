<%-- 
    Document   : coll-course
    Created on : Mar 20, 2011, 11:32:54 AM
    Author     : Vinnu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
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
            var i=0;
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
        <script type="text/javascript">

            function displaytab(){
                if(i>0){
                    document.getElementById("course").className='displayall';
                }
                else{
                    document.getElementById("course").className='displaynone';
                }
                document.getElementById("nocourse").value=i;
            }
            function addSub(sel){
            <%while (subrs.next()) {%>
                    x=document.createElement("option");
                    x.text="<%=subrs.getString(2)%>";
                    x.value="<%=subrs.getString(1)%>";
                    try{
                        sel.add(x);
                    }
                    catch(e){
                        sel.add(x,null);
                    }
            <%}%>
                }
                function addRow(){
                    r=document.createElement("tr");
                    cell1=document.createElement("td");
                    cell1.innerHTML="Course "+(i+1);
                    r.appendChild(cell1);
                    cell2=document.createElement("td");
                    sel=document.createElement("select");
                    sel.name="course"+i;
                    addSub(sel);
                    cell2.appendChild(sel);
                    r.appendChild(cell2);
                    document.getElementById("course").appendChild(r);
                    i+=1;
                    displaytab();
                }
                function delRow(){
                    if(i>0){
                        document.getElementById("course").removeChild(document.getElementById("course").lastChild);
                        i-=1;
                    }
                    displaytab();
                }
                window.onload=function(){
                    load();
                    document.getElementById('coname').focus();
                    document.getElementById('f1').onsubmit=function(){
                        if(i==0){
                            alert("Atleast one course needs to be added..!");
                            document.getElementById('addcrs').focus();
                            return false;
                        }
                        return true;
                    }
                }
        </script>
        <%
            } catch (Exception e) {
                out.println("Error : " + e);
            }%>

    </head>
    <body  id="body">
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
            <form action="DetailedInsert?type=1" method="post" id="f1">
                <h1>Add Course Details</h1><br/>
                <label>Choose College : </label>
                <select name="coname" id="coname"></select><br/><br/>
                <table id="course" class="displaynone">
                    <tr>
                        <th>Course Code</th>
                        <th style="width: 300px;">Course Name</th>
                    </tr>
                </table>
                <input type="hidden" name="nocourse" id="nocourse"/>
                <p id="addrem"><input type="button" value="Add Course" id="addcrs" onclick="addRow()"/>&nbsp;&nbsp;&nbsp;
                    <input type="button" value="Remove Course" onclick="delRow()"/>&nbsp;&nbsp;&nbsp;
                    <input type="submit" value="Submit"/>&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="Reset"/></p>
            </form>
        </div>
    </body>
</html>