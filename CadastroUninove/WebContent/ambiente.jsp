<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="br.com.uninove.factory.ConexaoFactory"%>
<%@page import="java.sql.Connection"%>
<%@page import="br.com.uninove.domain.Cadastro"%>
<%@page import="java.util.List"%>
<%@page import="br.com.uninove.dao.CadastroDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!--Import Google Icon Font-->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet" href="css/materialize.min.css"
	media="screen,projection" />

<!-- Meu JS -->
<script type="text/javascript" src="resources/javascript/efeitor.js"></script>
<!-- Meu css -->
<link rel="stylesheet" href="resources/css/dados.css">
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.js"
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
	crossorigin="anonymous"></script>

<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>AMBIENTE</title>
</head>
<body>
	<%
		Cadastro c = new Cadastro();
		String valor = String.valueOf(session.getAttribute("info2"));
		c.setRa(valor);
		
		try {
			
			if(valor != null ){
				
				Connection conexao = ConexaoFactory.conectar();
				String sql = "SELECT nome, ra FROM cadastro WHERE ra='"+c.getRa()+"' ";
				PreparedStatement ps = conexao.prepareStatement(sql);
				
				ps.setString(1, c.getNome());
				ps.setString(2, c.getRa());
				
				ResultSet rs = ps.executeQuery();
				
				if(rs.next()){
					
					out.println(valor);
					
				}else{
					out.println("erro");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("erro de DB");
		}
		
			
	%>
	<nav>
	<ul>
		<li><h5>NOME: </h5></li>
		<li>RA:</li>
	</ul>
	<h1>Out</h1>
	</nav>
	

	<center id="dados1">
		<a href="index.jsp">Sair</a>
	</center>



</body>
</html>