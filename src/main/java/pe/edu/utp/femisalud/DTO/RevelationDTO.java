package pe.edu.utp.femisalud.DTO;

import java.util.Objects;

public class RevelationDTO {
    private final String revelationMonth;
    private final Long totalRevelations;

    public RevelationDTO(String revelationMonth, Long totalRevelations) {
        this.revelationMonth = revelationMonth;
        this.totalRevelations = totalRevelations;
    }

    public String getRevelationMonth() {
        return revelationMonth;
    }

    public Long getTotalRevelations() {
        return totalRevelations;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        RevelationDTO that = (RevelationDTO) o;
        return Objects.equals(revelationMonth, that.revelationMonth) && Objects.equals(totalRevelations, that.totalRevelations);
    }

    @Override
    public int hashCode() {
        return Objects.hash(revelationMonth, totalRevelations);
    }

    @Override
    public String toString() {
        return "RevelationDTO{" +
                "revelationMonth='" + revelationMonth + '\'' +
                ", totalRevelations=" + totalRevelations +
                '}';
    }
}
