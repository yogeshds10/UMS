<%-- 
    Document   : courselist
    Created on : Mar 21, 2011, 12:59:17 AM
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
    <body class="yui-skin-sam">
        <div id="Course List"></div>
        <script type="text/javascript">
            YAHOO.util.Event.addListener(window, "load", function() {
                YAHOO.example.XHR_Text = function() {
                    var formatUrl = function(elCell, oRecord, oColumn, sData) {
                        elCell.innerHTML = "<a href='" + oRecord.getData("Url") + "'>" + sData + "</a>";
                    };

                    var myColumnDefs = [
                        {key:"Course Id", formatter:YAHOO.widget.DataTable.formatNumber, sortable:true},
                        //formatter:formatUrl
                        //formatter:YAHOO.widget.DataTable.formatNumber
                        {key:"Course Name", formatter:formatUrl, sortable:true},
                        {key:"Duration"}
                    ];
                    if('<%=request.getParameter("cid")%>'!='null')
                    {
                        var myDataSource = new YAHOO.util.DataSource("http://localhost:8080/University/CourseData?cid=<%=request.getParameter("cid")%>");
                        //alert("With Cid");
                    }
                    else
                    {
                        var myDataSource = new YAHOO.util.DataSource("http://localhost:8080/University/CourseData");
                        //alert("Without Cid");
                    }
                    myDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
                    myDataSource.responseSchema = {
                        recordDelim: "\n",
                        fieldDelim: "|",
                        fields: [{key:"Course Id",parser:"number"},"Course Name","Duration","Url"]
                    };

                    var myDataTable = new YAHOO.widget.DataTable("Course List", myColumnDefs,
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
