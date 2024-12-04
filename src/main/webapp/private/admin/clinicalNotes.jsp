<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<jsp:include page="/fragment/Head.jsp">
    <jsp:param name="title" value="Notas clínicas" />
</jsp:include>
<body class="px-6 py-1 w-full h-full sm:min-h-screen flex flex-col-reverse sm:flex-row justify-center items-center gap-1 sm:gap-4 bg-femisalud-300 overflow-hidden">

<div id="modal" class="modal hidden">
    <div class="modal-content">
        <span class="close-btn">&times;</span>
        <h2 class="text-femisalud-900 font-bold">Nota Clínica</h2>
        <p id="modal-text"></p>
    </div>
</div>

<div class="h-screen transition-transform duration-300 ease-in-out py-10">
    <jsp:include page="/fragment/admin/FloatSidebard.jsp" />
    <jsp:include page="/fragment/admin/FloatSidebardHorizontal.jsp" />
</div>

<main class="w-full h-[calc(100vh-14rem)] sm:h-screen flex tablet-vertical:flex-col flex-row justify-center items-start gap-6 overflow-auto py-10">
    <section class="w-full h-[calc(100vh-10rem)] sm:h-[calc(100vh-5rem)] flex flex-col justify-start items-center p-4 md:p-6 bg-gradient-to-r from-white via-white to-transparent overflow-auto gap-6">
        <div class="w-full h-auto flex flex-col tablet-vertical:flex-row justify-center items-center gap-6">
            <div class="w-full h-auto flex justify-center items-center">
                <form action="${pageContext.request.contextPath}/add-clinical-notes" method="post" class="w-full h-auto bg-femisalud-300 rounded-lg p-6 flex flex-col gap-6">
                    <h2 class="w-full text-center text-inter text-femisalud-900 text-2xl font-bold">Registro de notas clínicas</h2>
                    <p class="text-inter">Por favor, completa el formulario de notas clínicas de la ecografía realizada.</p>
                    <div class="w-full flex flex-col gap-3">
                        <label for="dni" class="font-bold text-femisalud-900">DNI de la paciente:</label>
                        <select name="dni" id="dni" class="rounded-lg w-full px-3 py-2" onchange="loadUltrasoundIDs(this.value)">
                            <option disabled selected>Selecciona un DNI</option>
                            <c:forEach var="patient" items="${allPatientWithUltrasound}">
                                <option value="${patient}">${patient}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="w-full flex flex-col gap-3">
                        <label for="id_eco" class="font-bold text-femisalud-900">ID de la ecografía:</label>
                        <select name="id_eco" id="id_eco" class="rounded-lg w-full px-3 py-2">
                            <option disabled selected>Selecciona un ID</option>
                        </select>
                    </div>
                    <div class="w-full flex flex-col gap-3">
                        <label for="note" class="font-bold text-femisalud-900">Nota clínica de la ecografía:</label>
                        <textarea name="note" id="note" cols="30" rows="10" class="rounded-lg w-full" style="resize: none;" >Paciente gestante de [edad] años, G[gesta]P[paridad]A[abortos]C[cesáreas], con un embarazo de [edad gestacional] semanas, evoluciona favorablemente. Peso materno: [peso], PA: [presión arterial], FCF: [frecuencia cardíaca fetal]. Ecografías obstétricas sin alteraciones. Recién nacido de [sexo] con peso de [peso], talla de [talla] y perímetro cefálico de [perímetro cefálico], Apgar de [puntaje]. Lactancia materna exclusiva. Madre y bebé en buen estado general. Se recomiendan controles prenatales periódicos y una dieta balanceada.</textarea>
                    </div>
                    <button type="submit" class="w-full bg-green-600 text-white font-bold text-lg rounded-lg py-2">Registrar nota clínica</button>
                </form>
            </div>
            <div class="w-full h-full flex flex-col gap-6">
                <div class="w-full flex justify-center items-center gap-6">
                    <label for="patient"></label>
                    <select name="patient" id="patient" class="rounded-lg w-full px-3 py-2">
                        <option disabled selected>Selecciona una paciente</option>
                        <c:forEach var="patient" items="${allPatientWithClinicalNotes}">
                            <option value="${patient[0]}">${patient[1]}</option>
                        </c:forEach>
                    </select>
                    <button type="button" id="search" class="bg-femisalud-900 text-white font-bold text-lg rounded-lg py-2 px-3">Buscar</button>
                </div>
                <h2 class="w-full text-center text-inter text-femisalud-900 text-2xl font-bold">Notas clínicas registradas</h2>
                <div class="w-full h-[24rem] max-h-[24rem] overflow-y-auto rounded-lg">
                    <table class="min-w-full bg-white shadow-md rounded-lg">
                        <thead class="bg-femisalud-900 text-white text-left text-sm uppercase font-semibold">
                        <tr>
                            <th class="px-6 py-4 sticky top-0 bg-femisalud-900">DNI de la paciente</th>
                            <th class="px-6 py-4 sticky top-0 bg-femisalud-900">ID de la ecografía</th>
                            <th class="px-6 py-4 sticky top-0 bg-femisalud-900">Fecha y hora de la ecografía</th>
                            <th class="px-6 py-4 sticky top-0 bg-femisalud-900">Nota clínica</th>
                        </tr>
                        </thead>
                        <tbody id="name-table-body" class="text-gray-700">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
</main>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/floatSidebar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/filterIDsUltrasoundByDNI.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/filterClinicalNotes.js"></script>
</body>
</html>
