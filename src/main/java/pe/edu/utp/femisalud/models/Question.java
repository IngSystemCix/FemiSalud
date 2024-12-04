package pe.edu.utp.femisalud.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "QUESTIONS", schema = "femisalud_db", indexes = {
        @Index(name = "id_survey", columnList = "id_survey")
})
public class Question {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_survey", nullable = false)
    private Survey idSurvey;

    @Size(max = 100)
    @NotNull
    @Column(name = "question", nullable = false, length = 100)
    private String question;

    @NotNull
    @Lob
    @Column(name = "type_question", nullable = false)
    private String typeQuestion;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Survey getIdSurvey() {
        return idSurvey;
    }

    public void setIdSurvey(Survey idSurvey) {
        this.idSurvey = idSurvey;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getTypeQuestion() {
        return typeQuestion;
    }

    public void setTypeQuestion(String typeQuestion) {
        this.typeQuestion = typeQuestion;
    }

}