<%-- 
    Document   : Agregar
    Created on : 20/06/2019, 14:19:41
    Author     : jonat
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <h1>Novo Registro</h1>
            <hr>
            <form action="" method="post" class ="form-control" style="width: 500px; height: 400px">
                DNI:
                <input type="text" name="txtDNI"  class ="form-control"/>
                Nome:
                <input type="text" name="txtNom" class ="form-control"/>
                <br>
                <input type="submit" value="Salvar" class="btn btn-primary btn-lg"/>
                <a href="index.jsp">Voltar</a>
            </form>
        </div>
    
    
    </body>
</html>
<%
//              CONECTANDO A BASE DE DADOS
                Connection con;
                String url="jdbc:mysql://localhost:3306/registro";
                String Driver="com.mysql.jdbc.Driver";
                String user="root";
                String clave="";
                Class.forName(Driver);
                con=DriverManager.getConnection(url,user,clave);
                PreparedStatement ps;
                String dni, nom;
                dni=request.getParameter("txtDNI");
                nom=request.getParameter("txtNom");
                if(nom!=null && dni!=null){
                    ps=con.prepareStatement("insert into usuario(DNI, Nombres) values('"+ dni +"','"+ nom +"')");
                    ps.executeUpdate();
                    response.sendRedirect("index.jsp");
                }
%>