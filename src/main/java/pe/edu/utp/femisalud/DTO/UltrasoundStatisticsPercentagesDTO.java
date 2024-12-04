package pe.edu.utp.femisalud.DTO;

import java.util.Objects;

public class UltrasoundStatisticsPercentagesDTO {
    private final Double percentageViews;
    private final Double percentageNoViews;
    private final Double percentageDownloads;

    public UltrasoundStatisticsPercentagesDTO(Double percentageViews, Double percentageNoViews, Double percentageDownloads) {
        this.percentageViews = percentageViews;
        this.percentageNoViews = percentageNoViews;
        this.percentageDownloads = percentageDownloads;
    }

    public Double getPercentageViews() {
        return percentageViews;
    }

    public Double getPercentageNoViews() {
        return percentageNoViews;
    }

    public Double getPercentageDownloads() {
        return percentageDownloads;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        UltrasoundStatisticsPercentagesDTO that = (UltrasoundStatisticsPercentagesDTO) o;
        return Objects.equals(percentageViews, that.percentageViews) && Objects.equals(percentageNoViews, that.percentageNoViews) && Objects.equals(percentageDownloads, that.percentageDownloads);
    }

    @Override
    public int hashCode() {
        return Objects.hash(percentageViews, percentageNoViews, percentageDownloads);
    }

    @Override
    public String toString() {
        return "UltrasoundStatisticsPercentagesDTO{" +
                "percentageViews=" + percentageViews +
                ", percentageNoViews=" + percentageNoViews +
                ", percentageDownloads=" + percentageDownloads +
                '}';
    }
}
