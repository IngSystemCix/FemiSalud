<%@ page import="java.util.Map" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<jsp:include page="/fragment/Head.jsp">
    <jsp:param name="title" value="Registrar Call Center" />
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
                <form action="${pageContext.request.contextPath}/addUserCallCenter" method="post" class="w-full h-auto bg-femisalud-300 rounded-lg p-6 flex flex-col gap-6">
                    <%
                        Map<String, String> errorMessages = (Map<String, String>) session.getAttribute("errorMessagesCallCenter");
                    %>
                    <h2 class="w-full text-center text-inter text-femisalud-900 text-2xl font-bold">Registro de Call Center</h2>
                    <p class="text-inter">Por favor, completa el formulario del registro de usuarios del Call Center.</p>

                    <!-- DNI -->
                    <div class="w-full flex flex-col gap-3">
                        <label for="dni" class="font-bold text-femisalud-900">DNI del usuario:</label>
                        <input
                                type="text"
                                name="dni"
                                id="dni"
                                class="rounded-lg w-full ${errorMessages != null && errorMessages.containsKey('dniError') ? 'border-red-500' : ''}"
                                oninput="validateDNI(this)"
                                maxlength="8"
                                pattern="\d{8}"
                                title="Debe contener exactamente 8 dígitos"
                                value="<%= request.getParameter("dni") != null ? request.getParameter("dni") : "" %>"
                        >
                        <%
                            if (errorMessages != null && errorMessages.containsKey("dniError")) {
                        %>
                        <div class="text-red-500 text-sm"><%= errorMessages.get("dniError") %></div>
                        <%
                            }
                        %>
                    </div>

                    <!-- Teléfono -->
                    <div class="w-full flex flex-col gap-3">
                        <label for="tel" class="font-bold text-femisalud-900">Teléfono del usuario:</label>
                        <input
                                type="tel"
                                name="tel"
                                id="tel"
                                class="rounded-lg w-full ${errorMessages != null && errorMessages.containsKey('phoneError') ? 'border-red-500' : ''}"
                                oninput="validatePhone(this)"
                                maxlength="9"
                                pattern="\d{9}"
                                title="Debe contener exactamente 9 dígitos"
                                value="<%= request.getParameter("tel") != null ? request.getParameter("tel") : "" %>"
                        >
                        <%
                            if (errorMessages != null && errorMessages.containsKey("phoneError")) {
                        %>
                        <div class="text-red-500 text-sm"><%= errorMessages.get("phoneError") %></div>
                        <%
                            }
                        %>
                    </div>

                    <!-- Correo electrónico -->
                    <div class="w-full flex flex-col gap-3">
                        <label for="email" class="font-bold text-femisalud-900">Correo del usuario:</label>
                        <input
                                type="email"
                                name="email"
                                id="email"
                                class="rounded-lg w-full ${errorMessages != null && errorMessages.containsKey('emailError') ? 'border-red-500' : ''}"
                                value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>"
                        >
                        <%
                            if (errorMessages != null && errorMessages.containsKey("emailError")) {
                        %>
                        <div class="text-red-500 text-sm"><%= errorMessages.get("emailError") %></div>
                        <%
                            }
                        %>
                    </div>

                    <!-- Nombre -->
                    <div class="w-full flex flex-col gap-3">
                        <label for="name_call_center" class="font-bold text-femisalud-900">Nombre del usuario:</label>
                        <input
                                type="text"
                                name="name_call_center"
                                id="name_call_center"
                                class="rounded-lg w-full ${errorMessages != null && errorMessages.containsKey('nameError') ? 'border-red-500' : ''}"
                                value="<%= request.getParameter("name_call_center") != null ? request.getParameter("name_call_center") : "" %>"
                        >
                        <%
                            if (errorMessages != null && errorMessages.containsKey("nameError")) {
                        %>
                        <div class="text-red-500 text-sm"><%= errorMessages.get("nameError") %></div>
                        <%
                            }
                        %>
                    </div>

                    <!-- Apellido Paterno -->
                    <div class="w-full flex flex-col gap-3">
                        <label for="paternal_surname" class="font-bold text-femisalud-900">Apellido paterno del usuario:</label>
                        <input
                                type="text"
                                name="paternal_surname"
                                id="paternal_surname"
                                class="rounded-lg w-full ${errorMessages != null && errorMessages.containsKey('paternalSurnameError') ? 'border-red-500' : ''}"
                                value="<%= request.getParameter("paternal_surname") != null ? request.getParameter("paternal_surname") : "" %>"
                        >
                        <%
                            if (errorMessages != null && errorMessages.containsKey("paternalSurnameError")) {
                        %>
                        <div class="text-red-500 text-sm"><%= errorMessages.get("paternalSurnameError") %></div>
                        <%
                            }
                        %>
                    </div>

                    <!-- Apellido Materno -->
                    <div class="w-full flex flex-col gap-3">
                        <label for="maternal_surname" class="font-bold text-femisalud-900">Apellido materno del usuario:</label>
                        <input
                                type="text"
                                name="maternal_surname"
                                id="maternal_surname"
                                class="rounded-lg w-full ${errorMessages != null && errorMessages.containsKey('maternalSurnameError') ? 'border-red-500' : ''}"
                                value="<%= request.getParameter("maternal_surname") != null ? request.getParameter("maternal_surname") : "" %>"
                        >
                        <%
                            if (errorMessages != null && errorMessages.containsKey("maternalSurnameError")) {
                        %>
                        <div class="text-red-500 text-sm"><%= errorMessages.get("maternalSurnameError") %></div>
                        <%
                            }
                        %>
                    </div>

                    <!-- Fecha de nacimiento -->
                    <div class="w-full flex flex-col gap-3">
                        <label for="date" class="font-bold text-femisalud-900">Fecha de nacimiento del usuario:</label>
                        <input
                                type="date"
                                name="date"
                                id="date"
                                class="rounded-lg w-full ${errorMessages != null && errorMessages.containsKey('birthDateError') ? 'border-red-500' : ''}"
                                value="<%= request.getParameter("date") != null ? request.getParameter("date") : "" %>"
                        >
                        <%
                            if (errorMessages != null && errorMessages.containsKey("birthDateError")) {
                        %>
                        <div class="text-red-500 text-sm"><%= errorMessages.get("birthDateError") %></div>
                        <%
                            }
                        %>
                    </div>

                    <button type="submit" class="w-full bg-green-600 text-white font-bold text-lg rounded-lg py-2">Registrar usuario</button>
                </form>
            </div>
            <div class="w-full h-full flex flex-col gap-6">
                <h2 class="w-full text-center text-inter text-femisalud-900 text-2xl font-bold">Usuarios registrados</h2>
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
                        <c:forEach var="user" items="${allUserCallCenter}">
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
</body>
</html>
