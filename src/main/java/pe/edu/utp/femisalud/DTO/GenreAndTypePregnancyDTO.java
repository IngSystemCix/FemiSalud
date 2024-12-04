package pe.edu.utp.femisalud.DTO;

import java.util.Objects;

public class GenreAndTypePregnancyDTO {
    private final String genre;
    private final String typePregnancy;

    public GenreAndTypePregnancyDTO(String genre, String typePregnancy) {
        this.genre = genre;
        this.typePregnancy = typePregnancy;
    }

    public String getGenre() {
        return genre;
    }

    public String getTypePregnancy() {
        return typePregnancy;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        GenreAndTypePregnancyDTO that = (GenreAndTypePregnancyDTO) o;
        return Objects.equals(genre, that.genre) && Objects.equals(typePregnancy, that.typePregnancy);
    }

    @Override
    public int hashCode() {
        return Objects.hash(genre, typePregnancy);
    }

    @Override
    public String toString() {
        return "GenreAndTypePregnancyDTO{" +
                "genre='" + genre + '\'' +
                ", typePregnancy='" + typePregnancy + '\'' +
                '}';
    }
}
