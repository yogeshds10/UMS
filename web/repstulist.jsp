<%-- 
    Document   : repstulist
    Created on : Jun 2, 2011, 2:15:32 PM
    Author     : Vinnu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="application/vnd.ms-excel">
        <title>Student List</title>
        <script type="text/javascript">
            window.onload=function(){
                window.print();
            }
        </script>
    </head>
    <body>
        <h1>List of Student</h1>
        <jsp:include page="stulist.jsp" />
    </body>
</html>
