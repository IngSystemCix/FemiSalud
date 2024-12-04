package pe.edu.utp.femisalud.DTO;

import java.time.LocalDateTime;
import java.util.Objects;

public class UltrasoundDTO {
    private final LocalDateTime dateUltrasound;
    private final String url;
    private final String dni;

    public UltrasoundDTO(LocalDateTime dateUltrasound, String url, String dni) {
        this.dateUltrasound = dateUltrasound;
        this.url = url;
        this.dni = dni;
    }

    public LocalDateTime getDateUltrasound() {
        return dateUltrasound;
    }

    public String getUrl() {
        return url;
    }

    public String getDni() {
        return dni;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        UltrasoundDTO that = (UltrasoundDTO) o;
        return Objects.equals(dateUltrasound, that.dateUltrasound) && Objects.equals(url, that.url) && Objects.equals(dni, that.dni);
    }

    @Override
    public int hashCode() {
        return Objects.hash(dateUltrasound, url, dni);
    }

    @Override
    public String toString() {
        return "UltrasoundDTO{" +
                "dateUltrasound=" + dateUltrasound +
                ", url='" + url + '\'' +
                ", dni='" + dni + '\'' +
                '}';
    }
}
