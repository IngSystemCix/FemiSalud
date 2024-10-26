package pe.edu.utp.femisalud.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "FAQ", schema = "femisalud_db")
public class Faq {
    @Id
    @Column(name = "id_faq", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "dni_patient", nullable = false)
    private Patient dniPatient;

    @Size(max = 255)
    @NotNull
    @Column(name = "question", nullable = false)
    private String question;

    @Size(max = 255)
    @Column(name = "answer")
    private String answer;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Patient getDniPatient() {
        return dniPatient;
    }

    public void setDniPatient(Patient dniPatient) {
        this.dniPatient = dniPatient;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

}