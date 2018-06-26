<%@include file="plantilla/header.jsp" %>
<%@include file="plantilla/menu.jsp" %>
<body background="plantilla/12.jpg">
<center><img src="plantilla/perro2.png"></center>
<div class="container">
 
    <div class="row ">
                                    <div class="col s12"><span class="white-text text-darken-2"><div class="card-panel hoverable orange"><center><h3>Tus Datos</h3></center></div></span></div>
				</div>
    
   <div class="container ">  
    <table class="bordered">
                <tr>
                    <td>Rut</td>
                    <td>Nombre</td>
                    <td>Apellido</td>
                    <td>Email</td>
                    
                </tr>
              
                <tr>
                    <td>${sessionScope.person.rutUser}</td>
                    <td>${sessionScope.person.nombreUser}</td>
                    <td>${sessionScope.person.apellidoUser}</td>
                    <td>${sessionScope.person.emailUser}</td>
                    
                    
                </tr>
               
                
            </table>
                    
   </div>
                    
                    
</div>
</body>
<%@include file="plantilla/footer.jsp" %>
