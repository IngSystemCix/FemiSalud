package pe.edu.utp.femisalud.model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.validation.constraints.NotNull;
import org.hibernate.Hibernate;

import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class UserRoleId implements Serializable {
    private static final long serialVersionUID = -5009023139186442062L;
    @NotNull
    @Column(name = "id_user", nullable = false)
    private Long idUser;

    @NotNull
    @Column(name = "id_role", nullable = false)
    private Long idRole;

    public Long getIdUser() {
        return idUser;
    }

    public void setIdUser(Long idUser) {
        this.idUser = idUser;
    }

    public Long getIdRole() {
        return idRole;
    }

    public void setIdRole(Long idRole) {
        this.idRole = idRole;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        UserRoleId entity = (UserRoleId) o;
        return Objects.equals(this.idUser, entity.idUser) &&
                Objects.equals(this.idRole, entity.idRole);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idUser, idRole);
    }

}