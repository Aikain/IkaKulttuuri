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
                <tr><td>Nimi:</td><td><input type="text" name="user" required></td></tr>
                <tr><td>Määrä:</td><td><input type="number" name="kpl" required></td></tr>
                <tr><td>PlayerId:</td><td><input type="number" name="userId" required></td></tr>
            </table>
            <input type="submit">
        </form>
        <table>
            <tr><td><b>Nimi:</b></td><td><b>Määrä:</b></td><td><b>Aika:</b></td></tr>
            <c:forEach var="kulttuuri" items="${kulttuurit}">
                <tr id="kulttuuri${kulttuuri.id}">
                    <td>${kulttuuri.user}</td>
                    <td>${kulttuuri.kpl}</td>
                    <td>${kulttuuri.time}</td>
                    <td><a target="_blank" href="http://s4-fi.ikariam.gameforge.com/?view=sendIKMessage&msgType=77&receiverId=${kulttuuri.userId}"><img src="http://s4-fi.ikariam.gameforge.com/skin/interface/icon_message_write.png" /></a></td>
                    <td><button onclick="poista(${kulttuuri.id})"><img src="http://s4-fi.ikariam.gameforge.com/skin/interface/cross.png" /></button></td>
                </tr>
            </c:forEach>
        </table>
        <footer>
            Copyright © Aikain - gosu.fi 
        </footer>
    </body>
</html>
