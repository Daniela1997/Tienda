<%@include file="plantilla/header.jsp" %>
<%@include file="plantilla/menu.jsp" %>
<body background="plantilla/3.jpg">
    
    <div class="row">
        <c:forEach items="${listap}"var="p">
            <c:if test="${p.estado eq 1 and p.stock > 0}">
                <div class="col s3">
                    <div class="card-panel">
                        <form action="control.do" method="post">
                            <p>${p.nombreProducto}</p>
                            <h5>$${p.precioProducto}</h5>
                            <button class="btn-floating right" type="submit" name="bt" value="addcar">
                                <i class="material-icons">add</i>
                                
                        </form>
                        
                    </div>
                    
                </div>
                
                
            </c:if>
            
        </c:forEach>
        
    </div>
    
    
    
</body>
    
    <%@include file="plantilla/footer.jsp" %>