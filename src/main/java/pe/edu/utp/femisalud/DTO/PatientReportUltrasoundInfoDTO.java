package pe.edu.utp.femisalud.DTO;

import java.time.LocalDateTime;
import java.util.Objects;

public class PatientReportUltrasoundInfoDTO {
    private final String name;
    private final String paternalSurname;
    private final String maternalSurname;
    private final int age;
    private final LocalDateTime dateUltrasound;
    private final String downloaded;
    private final String Viewed;

    public PatientReportUltrasoundInfoDTO(String name, String paternalSurname, String maternalSurname, int age, LocalDateTime dateUltrasound, String downloaded, String viewed) {
        this.name = name;
        this.paternalSurname = paternalSurname;
        this.maternalSurname = maternalSurname;
        this.age = age;
        this.dateUltrasound = dateUltrasound;
        this.downloaded = downloaded;
        Viewed = viewed;
    }

    public String getName() {
        return name;
    }

    public String getPaternalSurname() {
        return paternalSurname;
    }

    public String getMaternalSurname() {
        return maternalSurname;
    }

    public int getAge() {
        return age;
    }

    public LocalDateTime getDateUltrasound() {
        return dateUltrasound;
    }

    public String getDownloaded() {
        return downloaded;
    }

    public String getViewed() {
        return Viewed;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        PatientReportUltrasoundInfoDTO that = (PatientReportUltrasoundInfoDTO) o;
        return age == that.age && Objects.equals(name, that.name) && Objects.equals(paternalSurname, that.paternalSurname) && Objects.equals(maternalSurname, that.maternalSurname) && Objects.equals(dateUltrasound, that.dateUltrasound) && Objects.equals(downloaded, that.downloaded) && Objects.equals(Viewed, that.Viewed);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, paternalSurname, maternalSurname, age, dateUltrasound, downloaded, Viewed);
    }

    @Override
    public String toString() {
        return "PatientReportUltrasoundInfoDTO{" +
                "name='" + name + '\'' +
                ", paternalSurname='" + paternalSurname + '\'' +
                ", maternalSurname='" + maternalSurname + '\'' +
                ", age=" + age +
                ", dateUltrasound=" + dateUltrasound +
                ", downloaded='" + downloaded + '\'' +
                ", Viewed='" + Viewed + '\'' +
                '}';
    }
}
