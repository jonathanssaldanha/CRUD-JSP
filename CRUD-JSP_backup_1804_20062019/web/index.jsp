<%-- 
    Document   : index
    Created on : 20/06/2019, 13:26:10
    Author     : jonat
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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
                ResultSet rs;
                ps = con.prepareStatement("SELECT * FROM usuario");
                rs = ps.executeQuery();
            
        %>
        
        
        <div class="container buscar">
                <h1>Lista de Registro</h1>
                <a class="btn btn-success btn-lg" href="Agregar.jsp">Novo</a>
                <br>
                
                <form class="form">
                    <br><input type="text" name="txtbuscar" class="form-control"/>
                        <input class="btn btn" type="submit" value="Buscar"/>

                </form>
                <%
                    String nombuscar=request.getParameter("txtbuscar");
                    if(nombuscar!= null){
                        ps = con.prepareStatement("select * from usuario where Nombres Like"+"'%"+nombuscar+"%'");
                        rs=ps.executeQuery();

                    }
                %>
            
            <br>
            <br>
            <table class="table table-bordered">
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">DNI</th>
                    <th class="text-center">NOME</th>
                    <th class="text-center">ACÃO</th>
                </tr>
                <%
                    while(rs.next()){
                %>
                <tr>
                    <td class="text-center"><%=rs.getInt("Id")%></td>
                    <td class="text-center"><%=rs.getString("DNI")%></td>
                    <td><%=rs.getString("Nombres")%></td>
                    <td>
                        <a href="Editar.jsp?id=<%=rs.getInt("Id")%>" class="btn btn-warning btn-sm">Editar</a>
                        <a href="Delete.jsp?id=<%=rs.getInt("Id")%>" class="btn btn-danger btn-sm">Eliminar</a>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
