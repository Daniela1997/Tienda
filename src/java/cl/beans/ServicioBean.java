/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.beans;

import cl.entities.Categoria;
import cl.entities.DetalleVenta;
import cl.entities.Producto;
import cl.entities.Usuario;
import cl.entities.Venta;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author 25597723-7
 */
@Singleton
public class ServicioBean implements ServicioBeanLocal {

    @PersistenceContext(unitName = "GestionMascotas2018PU")
    private EntityManager em;
    
    @Override
    public Usuario iniciarSesion(String rut, String clave){
        try{
            return  em.createNamedQuery("Usuario.iniciarSesion", Usuario.class)
            .setParameter("rutUser",rut)
                    .setParameter("clave",clave)
                    .getSingleResult();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void guardar(Object o) {
       em.persist(o);
    }

    @Override
    public List<Usuario> getUsuarios() {
        return em.createNamedQuery("Usuario.findAll").getResultList();
    }
    
    
    @Override
    public List<Categoria> getCategorias() {
        return em.createNamedQuery("Categoria.findAll").getResultList();
    }

    @Override
    public List<Producto> getProductos() {
         return em.createNamedQuery("Producto.findAll").getResultList();
    }

    @Override
    public void sincronizar(Object o) {
        em.merge(o);//actualiza la categoria
        em.flush();//sincroniza
    }

    @Override
    public Categoria buscarCategoria(int id) {
        return em.find(Categoria.class, id);
    }

    @Override
    public Usuario buscarUsuario(String rut) {
        return em.find(Usuario.class, rut);
    }

    @Override
    public void insertar(Categoria newcat) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Producto buscarProducto(int codigo) {
        return em.find(Producto.class, codigo);
    }

    @Override
    public void compra(String rutUser, ArrayList<String> lista) throws TransactionException {
        ArrayList<DetalleVenta>  detallelist = new ArrayList<>();
        
       Usuario user = buscarUsuario(rutUser);
       Venta newventa= new Venta();
       newventa.setUsuario(user);
       newventa.setTotalVenta(1);
       newventa.setFechaVenta(new Date());
       
       
       int codigo,unidad, suma=0;
       for(String s : lista) {
           String []x = s.split(",");
           codigo = Integer.parseInt(x[0]);
           unidad = Integer.parseInt(x[1]);
           
           Producto p = buscarProducto(codigo);
           
           if(p.getUnidadesProducto()< unidad){
               
               throw new TransactionException();
               
               
           }
         p.setUnidadesProducto(p.getUnidadesProducto()-unidad);
         em.merge(p);
           
         DetalleVenta newdetalle = new DetalleVenta();
         
         
         newdetalle.setProducto(p);
         newdetalle.setVenta(newventa);
         newdetalle.setPrecio(p.getPrecioProducto());
         
         
        //asociar la venta . 
       detallelist.add(newdetalle);
        
        suma += p.getPrecioProducto()*unidad;
        
        newventa.setTotalVenta(suma);
        em.persist(newventa);
         newventa.setDetalleVentaList(detallelist);
         em.merge(newventa);
         user.getVentaList().add(newventa);
         em.merge(user);
         em.flush();
         
           
           
       }
       
    }
    

        
        
    
    

 

    

    

 

    

  
   
    
    
}
