<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="cl.entities.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="cl.beans.ServicioBeanLocal"%>

<body background="plantilla/3.jpg">

<%! ServicioBeanLocal servicio;%>

<%
    InitialContext ctx = new InitialContext();
    servicio =(ServicioBeanLocal) ctx.lookup("java:global/GestionMascotas2018/ServicioBean!cl.beans.ServicioBeanLocal");
    List<Categoria> lista = servicio.getCategorias();

%>

<c:set scope="page" var="lista" value="<%=lista%>"/>

<!DOCTYPE html>
  <html>
    <head>
      <!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>

    <body>
<nav>
    <div class="nav-wrapper brown">
      <a href="#" class="brand-logo">
          <c:if test="${not empty sessionScope.admin}">
             Hola ${sessionScope.admin.nombreUser}
              
          </c:if>
              
              <c:if test="${not empty sessionScope.person}">
              Bievenido ${sessionScope.person.nombreUser}
              <!-- accedemos al atributo del nombre en la base de datos -->
              
          </c:if>
      </a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
          
          <c:if test="${not empty sessionScope.admin}">
              <li><a href="usuarios.jsp">Perfiles</a></li>
               <li> <a href="Categorias.jsp">Categorias</a></li>
               <li> <a href="Producto.jsp">Productos</a></li>
                <li> <a href="catalogo.jsp">Catalogo</a></li>
               <li> <a href="#">Ventas</a></li>
                  <li> <a href="Salir.jsp">Logout</a></li>
              
          </c:if>
          
           <c:if test="${not empty sessionScope.person}">
              <li><a href="#">Mis Datos</a></li>
              <li><a href="#">Carrito</a></li>
              <li><a href="#">Mis Compras</a></li>
              <li><a href="#">Productos</a></li>
            
                  <li> <a href="Salir.jsp">Logout</a></li>
              
          </c:if>
          
         
         
      </ul>
    </div>
    </nav>
        
        
        <div class="row">
     <div class="col s6 offset-s3 ">
         <div class="card-panel">
      <div class="row">
          <h3><center>Espécies</center></h3>
        <div class="col s12">
            
            <form action="controcatl.do" method="POST">
                <div class="input-field">
                    <input id="nombre" type="text" name="nombre" placeholder="Ingrese Nombre">
                    <label for="nombre"></label>
                </div>
                
                <c:forEach items="${pageScope.categorias}" var="c">
                          <option value="${c.idCategoria}" var="c">${c.nombreCategoria}</option>
                     </c:forEach>
                
                
                <button class="btn right" name="bt" value="nuevacategoria" type="submit">Guardar</button>
                <button class="btn left" name="bt" value="" type="submit">Borrar</button>
            </form>
            ${requestScope.msg}
            <br><br>
            <table class="bordered">
                <tr>
                    <td>Código</td>
                    <td>Nombre</td>
                </tr>
                <c:forEach items="${lista}" var="c">
                <tr>
                    <td>${c.idCategoria}</td>
                    <td>${c.nombreCategoria}</td>
                </tr>
                </c:forEach>
            </table>
        </div>
    </div>
        </div>
        </div>
        </div>
      <script type="text/javascript" src="js/materialize.min.js"></script>
      <script type="text/javascript">
    $(document).ready(function () {
        $('select').material_select();
    });
</script>
    </body>
  </html>



<footer class="page-footer brown">
          <div class="container">
            <div class="row">
              <div class="col l6 s12">
                <h5 class="white-text">Tienda Patitas</h5>
                
              </div>
              <div class="col l4 offset-l2 s12">
                
                
              </div>
            </div>
          </div>
          <div class="footer-copyright">
            <div class="container">
            © 2014 Copyright Text - Designed by Daniela Espinoza Zavala
            
            </div>
          </div>
        </footer>





</body>





