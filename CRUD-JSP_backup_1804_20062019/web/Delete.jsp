<%-- 
    Document   : Delete
    Created on : 20/06/2019, 15:18:23
    Author     : jonat
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <%
//              CONECTANDO A BASE DE DADOS
                Connection con;
                String url="jdbc:mysql://localhost:3306/registro";
                String Driver="com.mysql.jdbc.Driver";
                String user="root";
                String clave="";
                Class.forName(Driver);
                con=DriverManager.getConnection(url,user,clave);

//                Listando os dados da tabela
                PreparedStatement ps;
                int id = Integer.parseInt(request.getParameter("id"));
                ps = con.prepareStatement("delete from usuario where id="+id);
                ps.executeUpdate();
                response.sendRedirect("index.jsp");

        %>
        
        
        
    </body>
</html>
