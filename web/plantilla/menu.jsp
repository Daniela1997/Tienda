<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav>
    <div class="nav-wrapper brown">
      <a href="bienvenido.jsp" class="brand-logo">
          <c:if test="${not empty sessionScope.admin}">
              Bienvenid@ ${sessionScope.admin.nombreUser}
              
          </c:if>
              
              <c:if test="${not empty sessionScope.person}">
              Bievenid@ ${sessionScope.person.nombreUser}
              <!-- accedemos al atributo del nombre en la base de datos -->
              
          </c:if>
      </a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
          
          <c:if test="${not empty sessionScope.admin}">
              <li><a href="usuarios.jsp">Perfiles</a></li>
               <li> <a href="Categorias.jsp">Categorias</a></li>
               <li> <a href="Producto.jsp">Registro Producto</a></li>
                <li> <a href="catalogo.jsp">Productos</a></li>
           
                  <li> <a href="Salir.jsp">Logout</a></li>
              
          </c:if>
          
           <c:if test="${not empty sessionScope.person}">
              <li><a href="perfilcliente.jsp">Perfil</a></li>
              
              <li><a href="productocliente.jsp">Catalogo</a></li>
              <c:if test="${carro.size()>0}">
              <li><a href="Detallecarro.jsp">Mi Carro(${carro.size()})</a></li>
              </c:if>
                  <li> <a href="Salir.jsp">Logout</a></li>
              
          </c:if>
          
         
         
      </ul>
    </div>
    </nav>