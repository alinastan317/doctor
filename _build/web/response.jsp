<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : response
    Created on : Jan 1, 2018, 6:31:56 PM
    Author     : alistan
--%>

<sql:query var="doctorDetails" dataSource="jdbc/myDatasource">
    SELECT *  FROM doctors where doctors.first_name = ? <sql:param value="${param.doctor_id}"/> 
</sql:query>    

<c:set var="doctorDetails" value="${doctorDetails.rows[0]}"/>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${doctorDetails.first_name} ${doctorDetails.last_name} </title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <table border="0">
            <thead>
                <tr>
                    <th colspan="2">${doctorDetails.first_name} ${doctorDetails.last_name}</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><strong>Description: </strong></td>
                    <td><span style="font-size:smaller; font-style:italic;">${doctorDetails.first_name} ${doctorDetails.last_name}  </span></td>
                </tr>
                <tr>
                    <td><strong>Doctor: </strong></td>
                    <td>${doctorDetails.first_name} ${doctorDetails.last_name}
                        <br>
                        <span style="font-size:smaller; font-style:italic;">
                            member since: {placeholder}</span>
                    </td>
                </tr>
                <tr>
                    <td><strong>Contact Details: </strong></td>
                    <td><strong>email: </strong>
                        <a href="mailto:{placeholder}">{placeholder}</a>
                        <br><strong>phone: </strong>{placeholder}
                    </td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
