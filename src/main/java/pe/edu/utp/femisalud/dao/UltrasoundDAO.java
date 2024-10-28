package pe.edu.utp.femisalud.dao;

import java.util.List;

public interface UltrasoundDAO {
    List<Long> getUltrasoundByPatient(String dni);
}
