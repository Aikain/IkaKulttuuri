<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="google-site-verification" content="yCVU8hxdqy0nrTI9cGOX6v_y1e5D-CWd5Z-SMHE_VCw">
        <link rel="shortcut icon" href="/favicon.ico">

        <title>ikariam.fi - Delta - Kulttuurit</title>
        <meta name="description" content="Suomen ikariamin Delta-serverin pelaajille kätevä keino etsiä muita kulttuureita tarvitsevia ja ilmoittaa oma vajeensa.">
        <link rel="canonical" href="http://ika.gosu.fi/">

        <meta property="og:site_name" content="ikariam.fi - Delta - Kulttuurit">
        <meta property="og:type" content="website">
        <meta property="og:title" content="ikariam.fi - Delta - Kulttuurit">
        <meta property="og:description" content="Suomen ikariamin Delta-serverin pelaajille kätevä keino etsiä muita kulttuureita tarvitsevia ja ilmoittaa oma vajeensa.">
        <meta property="og:url" content="http://ika.gosu.fi/">

        <meta name="twitter:card" content="summary">
        <meta name="twitter:title" content="ikariam.fi - Delta - Kulttuurit">
        <meta name="twitter:description" content="Suomen ikariamin Delta-serverin pelaajille kätevä keino etsiä muita kulttuureita tarvitsevia ja ilmoittaa oma vajeensa.">
        <meta name="twitter:url" content="http://ika.gosu.fi/">

        <script async="" src="//www.google-analytics.com/analytics.js"></script><script type="application/ld+json">
        {
          "@context": "http://schema.org",
          "@type": "Website",
          "publisher": "ikariam.fi - Delta - Kulttuurit",
          "url": "http://ika.gosu.fi/",
          "description": "Suomen ikariamin Delta-serverin pelaajille kätevä keino etsiä muita kulttuureita tarvitsevia ja ilmoittaa oma vajeensa."
        }
        </script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" charset="UTF-8" src="<c:url value='/resources/libraries/jquery-2.1.1.min.js' />"></script>       
        <script type="text/javascript" charset="UTF-8" src="<c:url value='/resources/libraries/tablesorter.min.js' />"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script type="text/javascript" charset="UTF-8" src="<c:url value='/resources/index.js' />"></script>
        <link rel="stylesheet" type="text/css" href="<c:url value='/resources/index.css' />" />
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script>
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
          ga('create', 'UA-58417001-3', 'auto');
          ga('send', 'pageview');
        </script>
    </head>
    <body>
        <div id="warn" style="display:none"><div id="warn-back"></div><div id="warn-text">Huomioithan, että kun käytät adf.ly-linkkiä tullaksesi tänne sivulle, autat <b>ulkopuolista</b> hyötymään sivun tekijän kustannuksella. Sivun tekijä haluaa tarjota palvelun ilmaisena ja mainoksettomana. Tallentaa suoralinkki (http://ika.gosu.fi/) suosikkeihin tms. <br /><br />Pääset tästä ilmoituksesta eroon kun et tule adf.ly-linkin kautta.<br /><button>10..</button></div></div>
        <div id="dialog" title="Vaihda kulttuurien määrä">
            <p class="validateTips">Anna uusi määrä:</p>
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
                            <td id="kulttuuri${kulttuuri.id}count" class="kulttuuricount" onclick="openChangeView(${kulttuuri.id})">${kulttuuri.kpl}</td>
                            <td id="kulttuuri${kulttuuri.id}time">${kulttuuri.time}</td>
                            <td><a target="_blank" href="http://s4-fi.ikariam.gameforge.com/?view=sendIKMessage&msgType=77&receiverId=${kulttuuri.userId}" onclick="decrease(${kulttuuri.id}); hideOne(this)"><img src="<c:url value='/resources/img/viesti.png' />" /></a></td>
                            <td><a href="" onclick="poista(${kulttuuri.id});return false"><img src="<c:url value='/resources/img/poista.png' />" /></a></td>
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
            <h2>Piilota jo sovitut kulttuurit:</h2>
            <textarea id='nimet' placeholder='Liitä tähän museon "Sopimuskumppani"-välilehdestä koko lista poistaaksesi viereisestä listasta ne, joiden kanssa sinulla on jo sopimus. &#10&#10Voit lisäksi piilottaa museon "Museo"-välilehdessä olevat "Ano kulttuurivarannon jakosopimusta"-listassa olevat vastaavasti.&#10&#10Voit myös piilottaa kirjoittamalle yhden nimen yhdelle riville.' rows='8' cols='70' style='resize:none'></textarea><br />
            <p id='info'></p>
            <button onclick='hide()'>Piilota</button>
            <button onclick='window.open("http://i.gosu.fi/abZ", "_blank")'>Katso malli</button>
            <button onclick='window.open("http://i.gosu.fi/ab1", "_blank")'>Katso malli2</button>
            <button onclick='hideFull()'>Piilota täydet museot</button> 
            <h2>Hiukan vanhempia ominaisuuksia:</h2>
            <ul>
                <li>Vaihdetaan normaali kursori pointeriksi, kun kursori viedään kulttuurimäärän päälle.</li>
                <li>Klikkaamalla taulukon otsikoita, pystyt järjestämään kyseisen sarakkeen mukaan.</li>
                <li>Uudelleen klikkaus vaihtaa suunnan (asc -> desc, desc -> asc).</li>  
                <li>Klikkaamalla nimen vieressä olevaa kulttuurien määrää, voit vaihtaa sitä.</li>
                <li>Järjestetään automaattisesti ajan mukaan niin että tuorein ylimpänä.</li>
                <li>Mahdollisuus rajata pois jo solmitut kulttuurit.</li>
                <li>Viestikuvakkeen painaminen vähentää kulttuurimäärää yhdellä.</li>
                <li>Viestikuvakkeen painaminen poistaa kyseisen ilmoituksen listastasi.</li>
                <li>Mahdollisuus poistaa näkyvistä ne ilmoitukset, joissa määrä on 0.</li>
                <li>Tarkennettu piilotus ominaisuuden ohjetekstiä.</li>
                <li>Lisätty toinen mallikuva.</li>
            </ul>
            <p>Päivitetty 19:20 15.10.2015</p>
            <div><h3>Yhteyttä saapi ottaa:</h3>
                Pelissä wiliam <a target="_blank" href="http://s4-fi.ikariam.gameforge.com/?view=sendIKMessage&receiverId=20878"><img src="<c:url value='/resources/img/viesti.png' />" /></a><br />
                Foorumilla wiliam <a target="_blank" href="http://board.fi.ikariam.gameforge.com/index.php?form=PMNew&userID=6580"><img src="<c:url value='/resources/img/viesti.png' />" /></a><br />
                IRC: wili @Quakenet - wiliam @OGN - Aikain @IRCNet<br />
                Sähköposti: <a href="mailto:aikain@paivola.fi?Subject=Kulttuuri%20Palvelu" target="_top">aikain@paivola.fi</a><br /><br />
<!--                Kävijöitä 15.10.15 asti:<br />
                <img src="http://user:1f162518-c5ae-4363-9cec-fcb28c0a44b9@gosu.fi:8119/counter/aaeee531-e050-4c57-979c-a8ce0c28c852.png" />-->
            </div>
            <footer>
                Copyright © Aikain - gosu.fi 
            </footer>
        </div>
    </body>
</html>
