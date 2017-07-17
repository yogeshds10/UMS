<%-- 
    Document   : collist
    Created on : Mar 20, 2011, 7:29:09 PM
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
                        {key:"College Id", formatter:YAHOO.widget.DataTable.formatNumber, sortable:true},
                        //formatter:formatUrl
                        //formatter:YAHOO.widget.DataTable.formatNumber
                        {key:"College Name", formatter:formatUrl, sortable:true},
                        {key:"Address"}
                    ];

                    var myDataSource = new YAHOO.util.DataSource("http://localhost:8080/University/CollData");
                    myDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
                    myDataSource.responseSchema = {
                        recordDelim: "\n",
                        fieldDelim: "|",
                        fields: [{key:"College Id",parser:"number"},"College Name","Address","Url"]
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
