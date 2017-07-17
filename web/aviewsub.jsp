<%-- 
    Document   : aviewsub
    Created on : Mar 21, 2011, 7:14:16 PM
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
        <style type="text/css">
            body {
                margin:0;
                padding:0;
            }
        </style>
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
        <link rel="stylesheet" type="text/css" href="styles/datatable.css" />
        <script type="text/javascript" src="scripts/yahoo-dom-event.js"></script>
        <script type="text/javascript" src="scripts/connection-min.js"></script>
        <script type="text/javascript" src="scripts/element-min.js"></script>
        <script type="text/javascript" src="scripts/datasource-min.js"></script>
        <script type="text/javascript" src="scripts/datatable-min.js"></script>
    </head>
    <body id="body" class="yui-skin-sam" >
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
            <div class="extab">
                <h1>List Of Subjects</h1>
                <div id="Subject List"></div>
                <script type="text/javascript">
                    YAHOO.util.Event.addListener(window, "load", function() {
                        YAHOO.example.XHR_Text = function() {
                            var formatUrl = function(elCell, oRecord, oColumn, sData) {
                                elCell.innerHTML = "<a href='" + oRecord.getData("Url") + "'>" + sData + "</a>";
                            };

                            var myColumnDefs = [
                                {key:"Subject Id", formatter:YAHOO.widget.DataTable.formatNumber, sortable:true},
                                //formatter:formatUrl
                                //formatter:YAHOO.widget.DataTable.formatNumber
                                {key:"Subject Name", formatter:formatUrl, sortable:true},
                                {key:"Subject Type", sortable:true}
                            ];

                            if('<%=request.getParameter("courseid")%>'!='null')
                            {
                                var myDataSource = new YAHOO.util.DataSource("http://localhost:8080/University/SemesterData?cid=<%=request.getParameter("courseid")%>&sno=<%=request.getParameter("sem")%>");
                            }
                            else
                            {
                                var myDataSource = new YAHOO.util.DataSource("http://localhost:8080/University/SemesterData");
                            }
                            myDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
                            myDataSource.responseSchema = {
                                recordDelim: "\n",
                                fieldDelim: "|",
                                fields: [{key:"Subject Id",parser:"number"},"Subject Name","Subject Type","Url"]
                            };

                            var myDataTable = new YAHOO.widget.DataTable("Subject List", myColumnDefs,
                            myDataSource);

                            return {
                                oDS: myDataSource,
                                oDT: myDataTable
                            };
                        }();
                    });
                </script>
            </div>
        </div>
    </body>
</html>