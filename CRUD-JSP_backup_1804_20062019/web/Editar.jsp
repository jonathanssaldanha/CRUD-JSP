<%-- 
    Document   : Editar
    Created on : 20/06/2019, 14:52:49
    Author     : jonat
--%>

<%@page import="java.sql.*"%>
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
                int id = Integer.parseInt(request.getParameter("id"));
                ps = con.prepareStatement("SELECT * FROM usuario where id="+id);
                rs = ps.executeQuery();
                while(rs.next()){
                
%>        
                <div class="container">
                    <h1>Editar Registro</h1>
                    <hr>
                    <form action="" method="post" class ="form-control" style="width: 500px; height: 400px">
                    ID:
                    <input type="text" readonly=""  class ="form-control" value="<%= rs.getInt("Id")%>"/>
                    DNI:
                    <input type="text" name="txtDNI"  class ="form-control" value="<%= rs.getString("DNI")%>"/>
                    Nome:
                    <input type="text" name="txtNom" class ="form-control" value="<%= rs.getString("Nombres")%>"/>
                    <br>
                    <input type="submit" value="Salvar" class="btn btn-primary btn-lg"/>
                    <a href="index.jsp">Voltar</a>
                    </form>
<%              }%>
                </div>
        
       
    </body>
</html>

<%

                String dni, nom;
                dni=request.getParameter("txtDNI");
                nom=request.getParameter("txtNom");
                if(nom!=null && dni!=null){
                    ps=con.prepareStatement("update usuario set DNI='"+ dni +"', Nombres='"+ nom +"' where Id="+id);
                    ps.executeUpdate();
                    response.sendRedirect("index.jsp");
                }
%>