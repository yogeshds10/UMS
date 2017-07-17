<%--
Document   : printappform
Created on : Apr 15, 2011, 12:03:00 AM
Author     : Vinnu
--%>

<%@page import="uec.Course"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="uec.ApplicationBean,uec.College"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Print Form</title>
        <style type="text/css">
            #wrapper{
                border:#000000 solid 3px ;
                width: 700px;
                margin: 0 auto; 
            }
            #appnum{
                border:#000000 solid 3px;
                border-top: none;
                border-right: none;
                border-bottom: none;
                width: 400px;
                margin: 0 auto;
                padding:10px;
                text-align: center;
            }
            #photo{
                border:#000 solid 3px;
                border-right: none;
                width:150px;
                height:130px;
                float: right;
                text-align: center;
                padding-top:40px;
            }
            #form{
                border: #000 solid 3px;
                border-left: none;
                border-bottom: none;
                border-right: none;
                width:600px;                
            }
            label{
                font-weight: bold;
                padding: 5px;
                margin: 10px;
                display: inline-block;
            }
            fieldset{
                border:#999 solid 4px;
                margin: 5px;
            }
        </style>
        <script type="text/javascript">
            window.onload=function(){
                window.print();
            }
        </script>
    </head>
    <body>
        <%
            ApplicationBean a = (ApplicationBean) request.getAttribute("app");
            /*ApplicationBean a=new ApplicationBean(); 
            a.setAddress("ajsdhfjkhsdf");
            a.setAppid(55);
            a.setCollname("5");
            a.setConame("5");
            a.setDate("21");
            a.setEmail("asdf@sadf");
            a.setFname("Vinayaak");
            a.setGender("Male");
            a.setLname("Patil");
            a.setYear("5455");
            a.setSpercent("34");
            a.setPucourse("sCICEN");
            a.setPucollname("DRM");
            a.setPpercent("43");
            a.setPhone("4354545");
            a.setNation("INdian");
            a.setMnth("4");
            a.setMedium("English");*/
        %>
        <div id="wrapper">
            <div id="appnum">
                Application Number : <label style="letter-spacing: 2px;font-size: 2em;"><%=a.getAppid()%></label><br/>
                <span style="color:red;padding:0;margin:0;font-size: 0.9em;">Note: Please make note of Application Number for further reference.</span>
            </div>
            <div id="photo">photo here...</div>
            <div id="form">
                <label>First Name : </label><%=a.getFname()%>
                <label>Last Name : </label><%=a.getLname()%><br/>
                <label>Date of Birth : </label><%=a.getDate()%>-<%=a.getMnth()%>-<%=a.getYear()%>
                <label>Gender : </label><%=a.getGender()%>
                <label>Nationality : </label><%=a.getNation()%>
                <label>Medium : </label><%=a.getMedium()%><br/>
                <label>College : </label><%=College.getCollNameById(Integer.parseInt(a.getCollname()))%><br/>
                <label>Course : </label><%=Course.getCourseNameById(Integer.parseInt(a.getConame()))%><br/>
                <fieldset>
                    <legend>Educational Information</legend>
                    <label>PUC College Name : </label><%=a.getPucollname()%><br/>
                    <label>PUC Course : </label><%=a.getPucourse()%>
                    <label>PUC Percentage : </label><%=a.getPpercent()%>%
                    <label>SSLC Percentage : </label><%=a.getSpercent()%>%
                </fieldset>
                <fieldset>
                    <legend>Contact Information</legend>
                    <label>Address : </label><%=a.getAddress()%><br/>
                    <label>Email : </label><%=a.getEmail()%> <br/>
                    <label>Phone : </label><%=a.getPhone()%>
                </fieldset>
            </div>
        </div>
    </body>
</html>
