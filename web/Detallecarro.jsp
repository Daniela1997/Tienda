<%@include file="plantilla/header.jsp" %>
<%@include file="plantilla/menu.jsp" %>
<body background="plantilla/12.jpg">
<center><img src="plantilla/perro2.png"></center>

<c:set var="productos" scope="page" value="<%= servicio.getProductos() %>"/>


<div class="row">
    <div class="col s6 offset-s3">
        <div class="card-panel">
            
            <form action="control.do" method="post">
                <h5>Detalle de compra</h5>
                <button class="btn-floating right pulse" type="submit" name="boton" value="compra">
                    <i class="material-icons">shopping_cart</i>
                </button>
                <input type="text" name="rut" placeholder="Rut del cliente"/>
                <br>
                <table class="bordered">
                    <tr>
                        <td>NOMBRE</td>
                        <td>PRECIO</td>
                        <td>UNIDADES</td>
                        <td></td>
                    </tr>

                    <c:forEach items="${carro}" var="p">
                        <tr>
                            <td>${p.nombreProducto}</td>
                            <td>${p.precioProducto}</td>
                            <td class="col s3">
                                <select name="unidades${p.idProducto}">
                                    
                                    <c:forEach begin="1" end="${p.unidadesProducto}" var="i">
                                        
                                        <option>${i}</option>
                                        
                                  </c:forEach>
                                </select>
                                        
                            </td>
                            
                            
                            <td>
                                
                            
                                <a href="control.do?boton=deletecar&codigo=${p.idProducto}" class="btn-floating red">
                                    <i class="material-icons">delete</i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>

                </table>
                <br>
                ${msg}
            </form>
        </div>
    </div>
</div>



</body>

<%@include file="plantilla/footer.jsp" %>
<script type="text/javascript">
    
    
 $(document).ready(function(){
     $('select')material_select();
 });   
 
</script>
