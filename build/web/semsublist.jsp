<%-- 
    Document   : semsublist
    Created on : Mar 21, 2011, 6:19:56 AM
    Author     : Vinnu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            body {
                margin:0;
                padding:0;
            }
        </style>
        <link rel="stylesheet" type="text/css" href="styles/fonts-min.css" />
        <link rel="stylesheet" type="text/css" href="styles/datatable.css" />
        <script type="text/javascript" src="scripts/yahoo-dom-event.js"></script>
        <script type="text/javascript" src="scripts/connection-min.js"></script>
        <script type="text/javascript" src="scripts/element-min.js"></script>
        <script type="text/javascript" src="scripts/datasource-min.js"></script>
        <script type="text/javascript" src="scripts/datatable-min.js"></script>
    </head>
    <body class="yui-skin-sam" bgcolor="#ccccff">
        <div id="Subject List"></div>
        <script type="text/javascript">
            YAHOO.util.Event.addListener(window, "load", function() {
                YAHOO.example.XHR_Text = function() {

                    var myColumnDefs = [
                        {key:"Subject Id", formatter:YAHOO.widget.DataTable.formatNumber, sortable:true},
                        //formatter:formatUrl
                        //formatter:YAHOO.widget.DataTable.formatNumber
                        {key:"Subject Name", sortable:true},
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
                        fields: [{key:"Subject Id",parser:"number"},"Subject Name","Subject Type"]
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
    </body>
</html>
