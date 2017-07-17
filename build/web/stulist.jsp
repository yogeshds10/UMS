<%-- 
    Document   : stulist
    Created on : Jun 2, 2011, 1:46:20 PM
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
        <div id="College List"></div>
        <script type="text/javascript">
            YAHOO.util.Event.addListener(window, "load", function() {
                YAHOO.example.XHR_Text = function() {
                    var formatUrl = function(elCell, oRecord, oColumn, sData) {
                        elCell.innerHTML = "<a href='" + oRecord.getData("Url") + "'>" + sData + "</a>";
                    };

                    var myColumnDefs = [
                        {key:"Student Id", formatter:YAHOO.widget.DataTable.formatNumber, sortable:true},
                        //formatter:formatUrl
                        //formatter:YAHOO.widget.DataTable.formatNumber
                        {key:"First Name", formatter:formatUrl, sortable:true},
                        {key:"Last Name", formatter:formatUrl, sortable:true},
                        {key:"Course",sortable:true },
                        {key:"Semester"}
                    ];
                    var rurl="http://localhost:8080/University/StudentData?cuname=<%=session.getAttribute("uid").toString()%>";
//                    alert(rurl);
                    var myDataSource = new YAHOO.util.DataSource(rurl);
                    myDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
                    myDataSource.responseSchema = {
                        recordDelim: "\n",
                        fieldDelim: "|",
                        fields: [{key:"Student Id",parser:"number"},"First Name","Last Name","Course","Semester","Url"]
                    };
                    
                    var myDataTable = new YAHOO.widget.DataTable("College List", myColumnDefs,
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
