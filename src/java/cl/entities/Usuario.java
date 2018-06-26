/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.metamodel.SingularAttribute;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author 25597723-7
 */
@Entity
@Table(name = "usuario")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u")
    , @NamedQuery(name = "Usuario.findByRutUser", query = "SELECT u FROM Usuario u WHERE u.rutUser = :rutUser")
    , @NamedQuery(name = "Usuario.findByNombreUser", query = "SELECT u FROM Usuario u WHERE u.nombreUser = :nombreUser")
    , @NamedQuery(name = "Usuario.findByApellidoUser", query = "SELECT u FROM Usuario u WHERE u.apellidoUser = :apellidoUser")
    , @NamedQuery(name = "Usuario.findByEmailUser", query = "SELECT u FROM Usuario u WHERE u.emailUser = :emailUser")
    , @NamedQuery(name = "Usuario.findByClave", query = "SELECT u FROM Usuario u WHERE u.clave = :clave"),
@NamedQuery(name = "Usuario.iniciarSesion", query = "SELECT u FROM Usuario u WHERE u.rutUser = :rutUser and u.clave = :clave")})
public class Usuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "rutUser")
    private String rutUser;
    @Column(name = "nombreUser")
    private String nombreUser;
    @Column(name = "apellidoUser")
    private String apellidoUser;
    @Column(name = "emailUser")
    private String emailUser;
    @Column(name = "clave")
    private String clave;
    @OneToMany(mappedBy = "usuario")
    private List<Venta> ventaList;
    @OneToMany(mappedBy = "usuario")
    private List<Historial> historialList;
    @JoinColumn(name = "perfil", referencedColumnName = "idPerfil")
    @ManyToOne
    private Perfil perfil;

    public Usuario() {
    }

    public Usuario(String rutUser) {
        this.rutUser = rutUser;
    }

    public String getRutUser() {
        return rutUser;
    }

    public void setRutUser(String rutUser) {
        this.rutUser = rutUser;
    }

    public String getNombreUser() {
        return nombreUser;
    }

    public void setNombreUser(String nombreUser) {
        this.nombreUser = nombreUser;
    }

    public String getApellidoUser() {
        return apellidoUser;
    }

    public void setApellidoUser(String apellidoUser) {
        this.apellidoUser = apellidoUser;
    }

    public String getEmailUser() {
        return emailUser;
    }

    public void setEmailUser(String emailUser) {
        this.emailUser = emailUser;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    @XmlTransient
    public List<Venta> getVentaList() {
        return ventaList;
    }

    public void setVentaList(List<Venta> ventaList) {
        this.ventaList = ventaList;
    }

    @XmlTransient
    public List<Historial> getHistorialList() {
        return historialList;
    }

    public void setHistorialList(List<Historial> historialList) {
        this.historialList = historialList;
    }

    public Perfil getPerfil() {
        return perfil;
    }

    public void setPerfil(Perfil perfil) {
        this.perfil = perfil;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (rutUser != null ? rutUser.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Usuario)) {
            return false;
        }
        Usuario other = (Usuario) object;
        if ((this.rutUser == null && other.rutUser != null) || (this.rutUser != null && !this.rutUser.equals(other.rutUser))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "cl.entities.Usuario[ rutUser=" + rutUser + " ]";
    }

    public String setPerfil(String idPerfil) {
        return idPerfil;
    }

    public SingularAttribute<Perfil, Integer> setidPerfil(SingularAttribute<Perfil, Integer> idPerfil) {
        return idPerfil;
    }

    public void setidPerfil(String perfil) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
