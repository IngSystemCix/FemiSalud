<%@ page import="java.util.Map" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<jsp:include page="/fragment/Head.jsp">
    <jsp:param name="title" value="Registrar pacientes" />
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
                <form action="${pageContext.request.contextPath}/add-patient" method="post" class="w-full h-auto bg-femisalud-300 rounded-lg p-6 flex flex-col gap-6" accept-charset="UTF-8">
                    <%
                        Map<String, String> errorMessages = (Map<String, String>) session.getAttribute("errorMessages");
                    %>
                    <h2 class="w-full text-center text-inter text-femisalud-900 text-2xl font-bold">Registro de pacientes</h2>
                    <p class="text-inter">Por favor, completa el formulario del registro de las pacientes.</p>
                    <div class="w-full flex flex-col gap-3">
                        <label for="dni" class="font-bold text-femisalud-900">DNI de la paciente:</label>
                        <input
                                type="text"
                                name="dni"
                                id="dni"
                                class="rounded-lg w-full"
                                oninput="validateDNI(this)"
                                maxlength="8"
                                pattern="\d{8}"
                                title="Debe contener exactamente 8 dígitos"
                                required
                        >
                        <span class="text-red-500 text-inter"><%= errorMessages != null && errorMessages.containsKey("dniError") ? errorMessages.get("dniError") : "" %></span>
                    </div>
                    <div class="w-full flex flex-col gap-3">
                        <label for="tel_patient" class="font-bold text-femisalud-900">Teléfono de la paciente:</label>
                        <input
                                type="tel"
                                name="tel_patient"
                                id="tel_patient"
                                class="rounded-lg w-full"
                                oninput="validatePhone(this)"
                                maxlength="9"
                                pattern="\d{9}"
                                title="Debe contener exactamente 9 dígitos"
                                required
                        >
                        <span class="text-red-500 text-inter"><%= errorMessages != null && errorMessages.containsKey("phoneError") ? errorMessages.get("phoneError") : "" %></span>
                    </div>
                    <div class="w-full flex flex-col gap-3">
                        <label for="email_patient" class="font-bold text-femisalud-900">Correo de la paciente:</label>
                        <input
                                type="email"
                                name="email_patient"
                                id="email_patient"
                                class="rounded-lg w-full"
                                required
                        >
                        <span class="text-red-500 text-inter"><%= errorMessages != null && errorMessages.containsKey("emailError") ? errorMessages.get("emailError") : "" %></span>
                    </div>
                    <div class="w-full flex flex-col gap-3">
                        <label for="name_patient" class="font-bold text-femisalud-900">Nombre de la paciente:</label>
                        <input type="text" name="name_patient" id="name_patient" class="rounded-lg w-full" required>
                        <span class="text-red-500 text-inter"><%= errorMessages != null && errorMessages.containsKey("nameError") ? errorMessages.get("nameError") : "" %></span>
                    </div>
                    <div class="w-full flex flex-col gap-3">
                        <label for="paternal_surname_patient" class="font-bold text-femisalud-900">Apellido paterno de la paciente:</label>
                        <input type="text" name="paternal_surname_patient" id="paternal_surname_patient" class="rounded-lg w-full" required>
                        <span class="text-red-500 text-inter"><%= errorMessages != null && errorMessages.containsKey("paternalSurnameError") ? errorMessages.get("paternalSurnameError") : "" %></span>
                    </div>
                    <div class="w-full flex flex-col gap-3">
                        <label for="maternal_surname_patient" class="font-bold text-femisalud-900">Apellido materno de la paciente:</label>
                        <input type="text" name="maternal_surname_patient" id="maternal_surname_patient" class="rounded-lg w-full" required>
                        <span class="text-red-500 text-inter"><%= errorMessages != null && errorMessages.containsKey("maternalSurnameError") ? errorMessages.get("maternalSurnameError") : "" %></span>
                    </div>
                    <div class="w-full flex flex-col gap-3">
                        <label for="date" class="font-bold text-femisalud-900">Fecha de nacimiento de la paciente:</label>
                        <input type="date" name="date" id="date" class="rounded-lg w-full" required>
                    </div>
                    <div class="w-full flex flex-col gap-3">
                        <label for="date_start_pregnancy" class="font-bold text-femisalud-900">Fecha aproximada de inicio del embarazo:</label>
                        <input type="date" name="date_start_pregnancy" id="date_start_pregnancy" class="rounded-lg w-full" required>
                    </div>
                    <div class="w-full flex flex-col gap-3">
                        <label for="date_end_pregnancy" class="font-bold text-femisalud-900">Fecha aproximada de fin del embarazo:</label>
                        <input type="date" name="date_end_pregnancy" id="date_end_pregnancy" class="rounded-lg w-full" readonly required>
                    </div>
                    <div class="w-full flex flex-col gap-3">
                        <label for="amount_baby" class="font-bold text-femisalud-900">Cantidad de bebés:</label>
                        <input type="number" min="1" max="6" step="1" name="amount_baby" id="amount_baby" class="rounded-lg w-full" required>
                    </div>
                    <div id="baby_table_container" class="w-full flex flex-col gap-3 mt-4"></div>
                    <div class="w-full flex flex-col gap-3">
                        <label for="type_pregnancy" class="font-bold text-femisalud-900">Tipo de embarazo:</label>
                        <select name="type_pregnancy" id="type_pregnancy" class="rounded-lg w-full px-3 py-2" required>
                            <option disabled selected>Seleccionar tipo de embarazo</option>
                            <option value="UNIQUE">Hijo unico</option>
                            <option value="TWINS">Mellizos</option>
                            <option value="CUFFLINKS_M">Gemelos</option>
                            <option value="CUFFLINKS_F">Gemelas</option>
                            <option value="TRIPLETS">Trillizos</option>
                            <option value="MULTIPLE">Multiples hijos</option>
                        </select>
                    </div>
                    <button type="submit" class="w-full bg-green-600 text-white font-bold text-lg rounded-lg py-2">Registrar paciente</button>
                </form>
            </div>
            <div class="w-full h-full flex flex-col gap-6">
                <h2 class="w-full text-center text-inter text-femisalud-900 text-2xl font-bold">Pacientes registradas</h2>
                <div class="w-full flex justify-end items-center">
                    <a href="${pageContext.request.contextPath}/admin/medical-history" class="px-3 py-2 bg-green-600 text-white font-bold text-lg rounded-lg">Agregar historia clínica</a>
                </div>
                <div class="w-full h-[24rem] max-h-[24rem] overflow-y-auto rounded-lg">
                    <table class="min-w-full bg-white shadow-md rounded-lg">
                        <thead class="bg-femisalud-900 text-white text-left text-sm uppercase font-semibold">
                        <tr>
                            <th class="px-6 py-4 sticky top-0 bg-femisalud-900">DNI</th>
                            <th class="px-6 py-4 sticky top-0 bg-femisalud-900">Nombres y apellidos</th>
                            <th class="px-6 py-4 sticky top-0 bg-femisalud-900">Correo</th>
                            <th class="px-6 py-4 sticky top-0 bg-femisalud-900">Teléfono</th>
                        </tr>
                        </thead>
                        <tbody id="name-table-body" class="text-gray-700">
                            <c:forEach var="user" items="${allPatient}">
                                <tr class="text-sm">
                                    <td class="px-6 py-4">${user.dni}</td>
                                    <td class="px-6 py-4">${user.name} ${user.paternalSurname} ${user.maternalSurname}</td>
                                    <td class="px-6 py-4">${user.email}</td>
                                    <td class="px-6 py-4">${user.phoneNumber}</td>
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
<script src="${pageContext.request.contextPath}/assets/js/validRegisterPatient.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/inputDatePregnancy.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/generateTableByAmountBaby.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/inputDateValidateFormAddPatient.js"></script>
</body>
</html>
