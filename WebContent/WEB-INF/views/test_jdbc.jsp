<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Tests JDBC</title>
    </head>
    <body>
        <h1>Tests JDBC</h1>

        <c:forEach items="${ ressources }" var="ressources" varStatus="boucle">
        			<p> ${ressources} </p>
        </c:forEach>
    </body>
</html>