package pe.edu.utp.femisalud.DTO;

import java.util.Objects;

public class UltrasoundStatisticsDTO {
    private final Long totalViews;
    private final Long totalNoViews;
    private final Long totalDownloads;

    public UltrasoundStatisticsDTO(Long totalViews, Long totalNoViews, Long totalDownloads) {
        this.totalViews = totalViews;
        this.totalNoViews = totalNoViews;
        this.totalDownloads = totalDownloads;
    }

    public Long getTotalViews() {
        return totalViews;
    }

    public Long getTotalNoViews() {
        return totalNoViews;
    }

    public Long getTotalDownloads() {
        return totalDownloads;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        UltrasoundStatisticsDTO that = (UltrasoundStatisticsDTO) o;
        return Objects.equals(totalViews, that.totalViews) && Objects.equals(totalNoViews, that.totalNoViews) && Objects.equals(totalDownloads, that.totalDownloads);
    }

    @Override
    public int hashCode() {
        return Objects.hash(totalViews, totalNoViews, totalDownloads);
    }

    @Override
    public String toString() {
        return "totalViews=" + totalViews +
                ", totalNoViews=" + totalNoViews +
                ", totalDownloads=" + totalDownloads;
    }
}
