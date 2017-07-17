<%-- 
    Document   : ainssub
    Created on : Mar 19, 2011, 11:52:21 AM
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
        <script type="text/javascript">
            var i=0;
            window.onload=function(){
                document.getElementById('questions').className='displaynone';
                document.getElementById('name').focus();             
                document.getElementById('lab').onchange=function(){
                    var x=document.createElement('input');
                    x.type='button';
                    x.value='Add Question';
                    x.onclick=function(){
                        if(i>=25){alert("You can't add more than 25 subjects...!");return;}
                        t1=document.createElement('tr');
                        t2=document.createElement('td');
                        t2.textContent=++i;
                        t1.appendChild(t2);
                        t2=document.createElement('td');
                        t3=document.createElement('input');
                        t3.type='text';
                        t3.id='question'+i;
                        t3.name='question'+i;
                        t3.size=60;
                        t2.appendChild(t3);
                        t1.appendChild(t2);
                        document.getElementById('questions').appendChild(t1);
                        displaytab();
                    }
                    document.getElementById('para').appendChild(x);
                    x=document.createElement('input');
                    x.type='button';
                    x.value='Remove Question';
                    x.onclick=function(){
                        document.getElementById('questions').removeChild(document.getElementById('questions').lastChild);
                        i--;
                        displaytab();
                    }
                    document.getElementById('para').appendChild(x);
                }
                document.getElementById('theory').onchange=function(){
                    //                    alert(document.getElementById('para').childNodes.length);
                    if(document.getElementById('para').childNodes.length>7){
                        document.getElementById('para').removeChild(document.getElementById('para').lastChild);
                        document.getElementById('para').removeChild(document.getElementById('para').lastChild);
                        document.getElementById('questions').className='displaynone';
                    }
                }
                document.getElementById('f1').onsubmit=function(){
                    if(!validateNull(document.getElementById('name'))){return false;}
                    if(!validateNull(document.getElementById('subdesc'))){return false;}
                    if(!(document.getElementById('theory').checked||document.getElementById('lab').checked)){
                        alert("Choose Subject type...!");
                        document.getElementById('theory').focus();
                    }               
                    if(document.getElementById('lab').checked){
                        if(i<10){
                            alert("Atleast ten questions are needed..!");
                            return false;
                        }
                    }
                    for(j=1;j<=i;++j){
                        if(!validateNull(document.getElementById('question'+j))){
                            return false;
                        }
                    }
                    document.getElementById('noque').value=i;
                    //                    alert(document.getElementById('noque').value);
                }
            }
            function displaytab(){
                if(i>0){document.getElementById('questions').className='displayall';}
                else{document.getElementById('questions').className='displaynone';}
            }
        </script>
    </head>
    <body id="body" >
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
            <form action="InsertHandler?type=3" method="post" id="f1">
                <h1>Insert Subject</h1><br/>
                <label>Subject Name : </label><input type="text" id="name" name="subname" size="60" /><br/><br/> 
                <label>Description : </label><input type="text" id="subdesc" name="subdesc" size="60" /><br/><br/>
                <label>Type : </label><input type="radio" id="theory" name="subtype" value="theory" />Theory&nbsp;&nbsp;&nbsp;
                <input type="radio" id="lab" name="subtype" value="Labo" />Laboratory<br/><br/>
                <table border="2" id="questions">
                    <tr>
                        <th>No.</th>
                        <th>Question</th>
                    </tr>
                </table>
                <p id="para">
                    <input type="hidden" id='noque' name="noque"/>
                    <input type="submit" value="Submit"/>
                    <input type="reset" value="Reset"/>
                </p>
            </form>
        </div>
    </body>
</html>