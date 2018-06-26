
<%@include file="plantilla/header.jsp" %>
<%@include file="plantilla/menu.jsp" %>
<body background="plantilla/3.jpg">

   <c:set var="categorias" scope="page" value="<%= servicio.getCategorias() %>"/>
    <c:set var="productos" scope="page" value="<%= servicio.getProductos() %>"/>
 
 <div class="row">
     <div class="col s6 offset-s3 ">
          <h3><center>Animales</center></h3>
         <div class="card-panel">
             
             <form action="control.do" method="POST" enctype="multipart/form-data">
                 <label> Nombre </label>
                 <input type="text" name="nombre"/>
                 
                 <label> Precio</label>
                 <input type="text" name="precio"/>
                 
                 <label> Unidad</label>
                 <input type="text" name="unidad"/>
                 
                 <label> Descripcion</label>
                 <textarea name="descripcion" class="materialize-textarea"></textarea>
                 <select name="idcategoria">
                     <c:forEach items="${pageScope.categorias}" var="c">
                          <option value="${c.idCategoria}" var="c">${c.nombreCategoria}</option>
                          
                     </c:forEach>
                          
                    
                     
                 </select>
                 <div class="file-field input-field">
                     <div class="btn right">
                         <span>Buscar fotografia</span>
                         <input type="file" name="foto">
                     </div>
                     <div class="file-path-wrapper">
                         <input class="file-path validate" type="text">
                     </div>
                 </div>
                 
                 
                 
                 
                 
                 <button name="boton" value="nuevoproducto" class="boton">Crear</button>
                 <br>

             </form>
                   
             ${requestScope.msg}
             <hr>
             <table class="striped centered">
                 <thead>
                     <tr><th>ID</th>
                         <th>Nombre</th>
                         <th>Unidad</th>
                         <th>Precio</th>
                         <th>Categoria</th>
                         <th>Foto</th>
                     
                     </tr>
                     
                 </thead>
                 <tbody>
                     <c:forEach items="${pageScope.productos}" var="p">
                         <tr>
                             <td>${p.idProducto}</td> 
                             <td>${p.nombreProducto}</td>
                             <td>${p.unidadesProducto}</td>
                             <td>${p.precioProducto}</td>
                             <td>${p.categoria.nombreCategoria}</td>
                           
                       <td><xx:TagImage array="${p.fotoProducto}" tam= "50"/>
                          </td>
                         </tr>
                     </c:forEach>
                     
                 </tbody>
                 
             </table>
             
             
         </div>
       
       
      
         
         
     </div>
     
     
 </div>
</body>
   <%@include file="plantilla/footer.jsp" %>
