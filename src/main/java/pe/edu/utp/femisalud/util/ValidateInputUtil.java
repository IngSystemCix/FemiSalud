package pe.edu.utp.femisalud.util;

import com.google.common.base.Preconditions;

import java.time.LocalDate;
import java.util.List;

public class ValidateInputUtil {
    public static void checkByAddingCallCenter(String dni, String name, String paternalSurname, String maternalSurname, String email, String phoneNumber, LocalDate birthDate) {
        Preconditions.checkNotNull(dni, "dni cannot be null");
        Preconditions.checkNotNull(name, "name cannot be null");
        Preconditions.checkNotNull(paternalSurname, "paternalSurname cannot be null");
        Preconditions.checkNotNull(maternalSurname, "maternalSurname cannot be null");
        Preconditions.checkNotNull(email, "email cannot be null");
        Preconditions.checkNotNull(phoneNumber, "phoneNumber cannot be null");
        Preconditions.checkNotNull(birthDate, "birthDate cannot be null");
    }

    public static void checkByAddingPatient(String dni, String name, String paternalSurname, String maternalSurname, String email, String phoneNumber, LocalDate birthDate, LocalDate dateStartPregnancy, LocalDate dateEndPregnancy, int amountBaby, String typePregnancy, List<Integer> babyGenres) {
        checkByAddingCallCenter(dni, name, paternalSurname, maternalSurname, email, phoneNumber, birthDate);
        Preconditions.checkNotNull(dateStartPregnancy, "dateStartPregnancy cannot be null");
        Preconditions.checkNotNull(dateEndPregnancy, "dateEndPregnancy cannot be null");
        Preconditions.checkNotNull(amountBaby, "amountBaby cannot be null");
        Preconditions.checkNotNull(typePregnancy, "typePregnancy cannot be null");
        Preconditions.checkNotNull(babyGenres, "babyGenres cannot be null");
    }
}
