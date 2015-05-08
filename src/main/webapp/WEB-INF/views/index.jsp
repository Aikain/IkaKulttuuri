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
            <input type="number" name="kpl">
            <input type="number" name="userId">
            <input type="submit">
        </form>
        ${kulttuurit}
        <footer>
            Copyright © Aikain - gosu.fi 
        </footer>
    </body>
</html>
