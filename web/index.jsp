<%@include file="plantilla/header.jsp" %>

<div class="col s12"><span class="white-text orange"><div class="card-panel hoverable brown"><h3><center>Tienda Patitas</center></h3></div></span></div>
<div class="container">

<div class="row ">
    
    <div class="container"><div class="col s12"><span class="white-text text-darken-2"><div class="row darken-2"><center><img width="300" height="300"src="plantilla/perro2.png" alt=""/></center></div></span></div>

</div>

 <div class="row">
     <div class="col s6 offset-s3 z-depth-3">
        
        <form action="control.do" method="post">
            <label>Rut</label>
            <input type="text" name="rut"  value="" placeholder="11.111.111-7"/>
            
            <br>
             <label>Clave</label>
            <input type="password" name="clave" placeholder="Ingrese su clave" />
            <br>
            

            <button class="btn brown waves-effect waves-light right" type="submit" name="boton" value="login">Ingresar
                <i class="material-icons left">send</i>
            </button>     
            <br>
        </form>
         
       <br>
       <p class="red-text"> ${requestScope.msg}</p>
       
         
     </div>

     
 </div>
</div>
</div>


<br><br><br><br><br><br><br>
 <div class="col s12"><span class="white-text text-darken-2"><div class="card-panel hoverable brown"><center>Copyright (c) 2018 Tienda Patitas
<br>All Rights Reserved</center></div></span></div>