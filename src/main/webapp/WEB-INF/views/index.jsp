<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ika</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" charset="UTF-8" src="<c:url value='/resources/libraries/jquery-2.1.1.min.js' />"></script>       
        <script type="text/javascript" charset="UTF-8" src="<c:url value='/resources/index.js' />"></script>
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/index.css' />" />
    </head>
    <body>
        <form method="post" action="">
            <table>
                <tr><td>Määrä:</td><td><input type="number" name="kpl"></td></tr>
                <tr><td>PlayerId:</td><td><input type="number" name="userId"></td></tr>
            </table>
            <input type="submit">
        </form>
        <ol>
            <c:forEach var="kulttuuri" items="${kulttuurit}">    
                <li><a href="http://s4-fi.ikariam.gameforge.com/?view=sendIKMessage&msgType=77&receiverId=${kulttuuri.userId}">${kulttuuri.kpl} kpl:tta</a> </li>
                </c:forEach>
        </ol>
        <footer>
            Copyright © Aikain - gosu.fi 
        </footer>
    </body>
</html>
