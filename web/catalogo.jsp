<%@include file="plantilla/header.jsp" %>
<%@include file="plantilla/menu.jsp" %>
<c:set var="categorias" scope="page" value="<%= servicio.getCategorias() %>"/>
    <c:set var="productos" scope="page" value="<%= servicio.getProductos() %>"/>
    
    <body background="plantilla/3.jpg">
    
     ${requestScope.msg}
     
     <div class="row">
         
         <c:forEach items="${pageScope.productos}" var="p">

        <div class="col s3 ">
            <div class="card-panel orange white-text">
                <form action="control.do" method="post">
                    <p>${p.nombreProducto}</p>
                    <h4>$ ${p.precioProducto}</h4>
                    <h5>${p.categoria.nombreCategoria}</h5>
                         <img src ${p.fotoProducto}>    
                    
                    <br>
                </form>
            </div>
        </div>
    </c:forEach>
</div>
         
         
         
         
         
         
         
         
     </div>
    </body>  