<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<jsp:include page="/fragment/Head.jsp">
    <jsp:param name="title" value="Registrar ecografías" />
</jsp:include>
<body class="px-6 py-1 w-full h-full sm:min-h-screen flex flex-col-reverse sm:flex-row justify-center items-center gap-1 sm:gap-4 bg-femisalud-300 overflow-hidden">
<div class="h-screen transition-transform duration-300 ease-in-out py-10">
    <jsp:include page="/fragment/admin/FloatSidebard.jsp" />
    <jsp:include page="/fragment/admin/FloatSidebardHorizontal.jsp" />
</div>

<main class="w-full h-[calc(100vh-14rem)] sm:h-screen flex flex-col md:flex-row justify-center items-start gap-6 overflow-auto py-10">
    <section class="w-full h-[calc(100vh-10rem)] sm:h-[calc(100vh-5rem)] flex flex-col justify-start items-center p-4 md:p-6 bg-gradient-to-r from-white via-white to-transparent overflow-auto gap-6">
        <div class="w-full h-auto flex flex-col tablet-vertical:flex-row justify-center items-center gap-6">
            <div class="w-full h-auto flex justify-center items-center">
                <form action="${pageContext.request.contextPath}/add-ultrasound" method="post" class="w-full h-auto bg-femisalud-300 rounded-lg p-6 flex flex-col gap-6">
                    <h2 class="w-full text-center text-inter text-femisalud-900 text-2xl font-bold">Registro de ecografías</h2>
                    <p class="text-inter">Por favor, completa el formulario del registro de ecografías de la paciente.</p>
                    <div class="w-full flex flex-col gap-3">
                        <label for="dni" class="font-bold text-femisalud-900">DNI de la paciente:</label>
                        <select name="dni" id="dni" class="rounded-lg w-full px-3 py-2" onchange="fetchAttentionDates()" required>
                            <option disabled selected>Selecciona un DNI</option>
                            <c:forEach var="patient" items="${allPatient}">
                                <option value="${patient.dni}">${patient.dni}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="w-full flex flex-col gap-3">
                        <label for="dateAttention" class="font-bold text-femisalud-900">Fechas de atención:</label>
                        <select name="dateAttention" id="dateAttention" class="rounded-lg w-full px-3 py-2" required>
                            <option disabled selected>Selecciona una fecha</option>
                        </select>
                    </div>
                    <div class="w-full flex flex-col gap-3">
                        <label for="date" class="font-bold text-femisalud-900">Fecha y hora de la ecografía:</label>
                        <input type="datetime-local" name="date" id="date" class="rounded-lg w-full">
                    </div>
                    <div class="w-full flex flex-col gap-3">
                        <label for="type_eva" class="font-bold text-femisalud-900">Tipo de evaluación:</label>
                        <select name="type_eva" id="type_eva" class="rounded-lg w-full px-3 py-2" required>
                            <option disabled selected>Selecciona un tipo de evaluación</option>
                            <option value="MORFOLOGICA">Morfológica</option>
                            <option value="GENETICA">Genética</option>
                            <option value="OBSTETRICA">Obstétrica</option>
                        </select>
                    </div>
                    <div class="w-full flex flex-col gap-3">
                        <label for="type_eco" class="font-bold text-femisalud-900">Tipo de ecografía:</label>
                        <select name="type_eco" id="type_eco" class="rounded-lg w-full px-3 py-2" required>
                            <option disabled selected>Selecciona un tipo de ecografía</option>
                            <option value="4D">4D</option>
                            <option value="5D">5D</option>
                            <option value="6D">6D</option>
                        </select>
                    </div>
                    <div class="w-full flex flex-col gap-3">
                        <label for="url" class="font-bold text-femisalud-900">URL de la ecografía:</label>
                        <input type="text" name="url" id="url" class="rounded-lg w-full">
                    </div>
                    <div class="w-full flex flex-col gap-3">
                        <label for="doctor" class="font-bold text-femisalud-900">Nombre del doctor(a):</label>
                        <select name="doctor" id="doctor" class="rounded-lg w-full px-3 py-2" required>
                            <option disabled selected>Seleccionar doctor(a)</option>
                            <option value="Rodolfo Pizarro Távara">Rodolfo Pizarro Távara</option>
                            <option value="Joanssye Guevara Bacalla">Joanssye Guevara Bacalla</option>
                            <option value="Cristian Ramírez Quiliche">Cristian Ramírez Quiliche</option>
                            <option value="Adalberto Rafael Campos">Adalberto Rafael Campos</option>
                        </select>
                    </div>
                    <button type="submit" class="w-full bg-green-600 text-white font-bold text-lg rounded-lg py-2">Registrar ecografía</button>
                </form>
            </div>
            <div class="w-full h-full flex flex-col gap-6">
                <h2 class="w-full text-center text-inter text-femisalud-900 text-2xl font-bold">Ecografías registradas</h2>
                <div class="w-full h-[24rem] max-h-[24rem] overflow-y-auto rounded-lg">
                    <table class="min-w-full bg-white shadow-md rounded-lg">
                        <thead class="bg-femisalud-900 text-white text-left text-sm uppercase font-semibold">
                        <tr>
                            <th class="px-6 py-4 sticky top-0 bg-femisalud-900">Fecha y hora de la ecografía</th>
                            <th class="px-6 py-4 sticky top-0 bg-femisalud-900">URL de la ecografía</th>
                            <th class="px-6 py-4 sticky top-0 bg-femisalud-900">DNI de la paciente</th>
                        </tr>
                        </thead>
                        <tbody id="name-table-body" class="text-gray-700">
                            <c:forEach var="ultrasound" items="${allUltrasound}">
                                <tr>
                                    <td class="px-6 py-4">${ultrasound.dateUltrasound}</td>
                                    <td class="px-6 py-4 truncate-text">
                                        <a href="${ultrasound.url}" target="_blank" class="text-blue-700 hover:text-blue-500">${ultrasound.url}</a>
                                    </td>
                                    <td class="px-6 py-4">${ultrasound.dni}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
</main>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/floatSidebar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/getAttentionByDNI.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/inputDateTimeValidateFormAddUltrasound.js"></script>
</body>
</html>
