<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ika</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" charset="UTF-8" src="<c:url value='/resources/libraries/jquery-2.1.1.min.js' />"></script>       
        <script type="text/javascript" charset="UTF-8" src="<c:url value='/resources/libraries/tablesorter.min.js' />"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script type="text/javascript" charset="UTF-8" src="<c:url value='/resources/index.js' />"></script>
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/index.css' />" />
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    </head>
    <body>
        <div id="dialog" title="Vaihda kulttuurien määrä">
            <p class="validateTips">Testauksessa toistaiseksi...</p>
            <form>
                <label for="count">Määrä:</label>
                <input type="number" name="count" id="count" value="0" class="text ui-widget-content ui-corner-all">
                <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
            </form>
        </div>
        <div class="header">
            <h1>Vapaat kultuurit ikariam.fi Delta</h1>
        </div>
        <div class="vasen">
        <table cellspacing="1" class="tablesorter">
            <thead>
                <tr><th>Nimi:</th><th>Määrä:</th><th>Aika:</th></tr>
            </thead>
            <tbody>
            <c:forEach var="kulttuuri" items="${kulttuurit}">
                <tr id="kulttuuri${kulttuuri.id}">
                    <td>${kulttuuri.user}</td>
                    <td onclick="openChangeView(${kulttuuri.id})">${kulttuuri.kpl}</td>
                    <td>${kulttuuri.time}</td>
                    <td><a target="_blank" href="http://s4-fi.ikariam.gameforge.com/?view=sendIKMessage&msgType=77&receiverId=${kulttuuri.userId}"><img src="http://s4-fi.ikariam.gameforge.com/skin/interface/icon_message_write.png" /></a></td>
                    <td><a href="" onclick="poista(${kulttuuri.id}); return false"><img src="http://s4-fi.ikariam.gameforge.com/skin/interface/cross.png" /></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        </div>
        <div class="oikea">
        <form method="post" action="">
            <table>
                <tr><td colspan=2><h2>Lisää ilmoitus:</h2></td><tr>
                <tr><td>Nimi:</td><td><input type="text" name="user" required></td></tr>
                <tr><td>Määrä:</td><td><input type="number" name="kpl" required></td></tr>
                <tr><td>PlayerId:</td><td><input type="number" name="userId" required></td></tr>
            </table>
            <input type="submit">
        </form>
        <h2>Uutta:</h2>
        <ul>
          <li>Sivujen ulkoasua muokataan "paremmaksi"</li>
          <li>Klikkaamalla 'nimi'-, 'päivä'- tai 'aika'-tekstiä taulukkoa järjestyy niiden mukaan.</li>
          <li>Uudelleen klikkaus vaihtaa suunnan</li>  
        </ul>
        </div>
        <footer>
            Copyright © Aikain - gosu.fi 
        </footer>
    </body>
</html>
