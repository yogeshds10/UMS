<%-- 
    Document   : addexaminer
    Created on : Jun 1, 2011, 11:53:37 AM
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
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uec", "root", "admin");
                st = con.createStatement();
                rs = st.executeQuery("select collid,collname from uec.college");
        %>

        <script type="text/javascript">
            
            function load(){
            <%while (rs.next()) {%>
                    x=document.createElement("option");
                    x.text="<%=rs.getString(2)%>";
                    x.value="<%=rs.getString(1)%>";
                    try{
                        document.getElementById("coll").add(x);
                    }catch(e){
                        document.getElementById("coll").add(x,null);
                    }

            <%}%>
                }
                window.onload=function(){
                    document.getElementById('f1').onsubmit=function(){
                        if(!validateNull(document.getElementById('euid'))){return false;}
                        if(!validateNull(document.getElementById('epasswd'))){return false;}
                        if(!validateSelect(document.getElementById('course'),"Please Choose valid Course..!")){return false;}
                        if(!validateSelect(document.getElementById('sem'),"Please Choose valid Semester..!")){return false;}
                        if(!validateSelect(document.getElementById('sub'),"Please Choose valid Subject..!")){return false;}
                    }
                    document.getElementById('coll').onchange=function(){
                        var url="GetCourseList?coll="+document.getElementById('coll').value;
                        getDetails(url);
                    }
                    
                    document.getElementById('course').onchange=function(){
                        var url="GetSemList?course="+document.getElementById('course').value;
                        getDetailsSem(url);
                    }
                    document.getElementById('sem').onchange=function(){
                        var url="GetSubList?course="+document.getElementById('course').value+"&sem="+document.getElementById('sem').value;
                        //alert(url);
                        getDetailsSub(url);
                    }
                    document.getElementById('euid').focus();
                    load();
                }
                function createRequest() {
                    try {
                        request = new XMLHttpRequest();
                    } catch (tryMS) {
                        try {
                            request = new ActiveXObject("Msxml2.XMLHTTP");
                        } catch (otherMS) {
                            try {
                                request = new ActiveXObject("Microsoft.XMLHTTP");
                            } catch (failed) {
                                request = null;
                            }
                        }
                    }
                    return request;
                }
                function getDetails(url) {
                    request = createRequest();
                    if (request == null) {
                        alert("Unable to create request");
                        return;
                    }
                    request.open("GET", url, true);
                    request.onreadystatechange = displayDetails;
                    request.send(null);
                }

                function displayDetails() {
                    if (request.readyState == 4) {
                        if (request.status == 200) {
                            loadSelect(request.responseText);
                        }
                    }
                }
                function loadSelect(content){
                    //alert("Loading Content");
                    removeOptions(document.getElementById('course'));
                    removeOptions(document.getElementById('sem'));
                    removeOptions(document.getElementById('sub'));
                    var txt=new Array();
                    txt=content.split("\n");
                    for(i=0;i<txt.length-1;++i){
                        var source=txt[i];
                        var val=new Array();
                        val=source.split("~");
                        node=document.createElement("option");                     
                        node.value=val[0];
                        node.text=val[1];
                        try{
                            document.getElementById("course").add(node);
                        }catch(e){
                            document.getElementById("course").add(node,null);
                        }
                    }
                    document.getElementById('course').disabled=false;
                }

                function getDetailsSem(url) {
                    //alert("Loading Sem");
                    request = createRequest();
                    if (request == null) {
                        alert("Unable to create request");
                        return;
                    }
                    request.open("GET", url, true);
                    request.onreadystatechange = displayDetailsSem;
                    request.send(null);
                }

                function displayDetailsSem() {
                    if (request.readyState == 4) {
                        if (request.status == 200) {
                            loadSelectSem(request.responseText);
                        }
                    }
                }
                function loadSelectSem(content){
                    //alert("Loading Sem Content");
                    removeOptions(document.getElementById('sem'));
                    removeOptions(document.getElementById('sub'));
                    var txt=new Array();
                    txt=content.split("\n");
                    for(i=0;i<txt.length-1;++i){
                        node=document.createElement("option");                     
                        node.value=txt[i];
                        node.text=txt[i];
                        try{
                            document.getElementById("sem").add(node);
                        }catch(e){
                            document.getElementById("sem").add(node,null);
                        }
                    }
                    document.getElementById('sem').disabled=false;
                }

                function getDetailsSub(url) {
                    //alert("get Details Sub");
                    request = createRequest();
                    if (request == null) {
                        alert("Unable to create request");
                        return;
                    }
                    request.open("GET", url, true);
                    request.onreadystatechange = displayDetailsSub;
                    request.send(null);
                }
                function displayDetailsSub() {
                    if (request.readyState == 4) {
                        if (request.status == 200) {
                            loadSelectSub(request.responseText);
                        }
                    }
                }
                function loadSelectSub(content){
                    //alert("Loading Sub Content");
                    removeOptions(document.getElementById('sub'));
                    var txt=new Array();
                    txt=content.split("\n");
                    for(i=0;i<txt.length-1;++i){
                        var source=txt[i];
                        var val=new Array();
                        val=source.split("~");
                        node=document.createElement("option");                     
                        node.value=val[0];
                        node.text=val[1];
                        try{
                            document.getElementById("sub").add(node);
                        }catch(e){
                            document.getElementById("sub").add(node,null);
                        }
                    }
                    document.getElementById('sub').disabled=false;
                }
                function removeOptions(x){
                    // alert(x.length);
                    var l=x.length;
                    for(i=1;i<l;++i){
                        x.removeChild(x.lastChild);
                    }
                }
        </script>

        <%
            } catch (Exception e) {
                out.println("Error : " + e);
            }%>
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
            <form action="InsertHandler?type=4" method="post" id="f1">
                <h1>Define Examiner...</h1><br/>
                <label>Examiner UID : </label><input type="text" id="euid" name="euid" /><br/><br/>
                <label>Examiner Password : </label><input type="text" id="epasswd" name="epasswd" /><br/><br/>
                <label>Choose College : </label><select id="coll" name="coll"></select><br/><br/>
                <label>Choose Course : </label>
                <select id="course" name="course" disabled>
                    <option value="-1">Choose Course</option>
                </select><br/><br/>
                <label>Choose Semester : </label>
                <select id="sem" name="sem" disabled>
                    <option value="-1">Choose Semester</option>
                </select><br/><br/>
                <label>Choose Subjects : </label>
                <select id="sub" name="sub" disabled>
                    <option value="-1">Choose Subject</option>
                </select><br/><br/>
                <p>
                    <input type="submit" value="Submit"/>&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="Reset"/>
                </p>
            </form>
        </div>
    </body>
</html>