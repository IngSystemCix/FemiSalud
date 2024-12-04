package pe.edu.utp.femisalud.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.time.Instant;

@Entity
@Table(name = "USER", schema = "femisalud_db", uniqueConstraints = {
        @UniqueConstraint(name = "email", columnNames = {"email"}),
        @UniqueConstraint(name = "phone_number", columnNames = {"phone_number"})
})
public class User {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @Size(max = 100)
    @NotNull
    @Column(name = "email", nullable = false, length = 100)
    private String email;

    @Size(max = 9)
    @NotNull
    @Column(name = "phone_number", nullable = false, length = 9)
    private String phoneNumber;

    @NotNull
    @Column(name = "birthday", nullable = false)
    private Instant birthday;

    @NotNull
    @Lob
    @Column(name = "role", nullable = false)
    private String role;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Instant getBirthday() {
        return birthday;
    }

    public void setBirthday(Instant birthday) {
        this.birthday = birthday;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

}