<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : Jan 1, 2018, 12:17:23 PM
    Author     : alistan
--%>

<sql:query var="doctors" dataSource="jdbc/myDatasource">
    SELECT first_name FROM doctors
</sql:query>

    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <h1>Patient: </h1>

        <table border="0">
            <thead>
                <tr>
                    <th>Create appointment </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Select a doctor below to make an appointment: </td>
                </tr>
                <tr>
                    <td><form action="response.jsp"> 
                            <strong> Please select: </strong> 
                            <select name="doctor_id">
                                <c:forEach var="row" items="${doctors.rowsByIndex}">
                                        <c:forEach var="column" items="${row}">
                                            <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>
                                        </c:forEach>
                                </c:forEach>
                            </select>
                            <input type="submit" value="submit" name="submit" />
                        </form>
                    </td>
                </tr>
            </tbody>
        </table>

    </body>
</html>
