<%--
  Created by IntelliJ IDEA.
  User: JONATHAN
  Date: 22/10/2024
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="fragment/head.jsp"/>
    <title>FemiSalud</title>
</head>
<body class="flex w-full h-screen bg-femisalud-300">
<div class="relative h-full w-64">
    <jsp:include page="fragment/sidebar.jsp"/>
</div>
<div class="flex justify-center items-center gap-6 w-full bg-white p-6">
    <div class="max-w-7xl mx-auto">

        <!-- Título principal -->
        <h1 class="text-3xl font-bold mb-2 text-start">Ecografías</h1>
        <!-- Contenedor principal -->
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            <!-- Formulario de notas clínicas -->
            <form action="${pageContext.request.contextPath}/add_notes_clinical" method="post" class="bg-femisalud-200 p-6 rounded-lg shadow-md max-h-screen overflow-y-auto">
                <h4 class="text-xl font-semibold mb-2 text-center">Registro de notas clínicas</h4>
                <p class="text-gray-600 text-start mb-6">Por favor, completa el formulario de notas clínicas de la ecografía realizada.</p>

                <div class="mb-4">
                    <label for="dni-paciente" class="block text-sm font-medium text-gray-700">DNI de la paciente:</label>
                    <input type="text" id="dni-paciente" name="dniPaciente" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500" maxlength="8" />
                </div>

                <div class="mb-4">
                    <label for="id-ecografia" class="block text-sm font-medium text-gray-700">ID de la ecografía:</label>
                    <select id="id-ecografia" name="idEcografia" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                        <option value="" disabled selected>Selecciona una ecografía</option>
                    </select>
                </div>

                <div class="mb-4">
                    <label for="nota-clinica" class="block text-sm font-medium text-gray-700">Nota clínica de la ecografía:</label>
                    <textarea id="nota-clinica" name="notaClinica" rows="5" class="mt-1 block w-full border border-gray-300 no-resize rounded-md shadow-sm p-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"></textarea>
                </div>

                <button type="submit" class="bg-green-400 hover:bg-green-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline justify-center">
                    Guardar datos
                </button>
            </form>

            <!-- Tabla de notas clínicas registradas -->
            <div class="flex flex-col">
                <!-- Nombre paciente -->
                <div class="bg-white p-4 rounded-lg shadow-md mb-4 flex justify-between items-center">
                    <select id="patientSelect" class="ml-4 border border-gray-300 rounded-md p-2">
                        <!-- Opciones de pacientes -->
                        <c:forEach var="patient" items="${patients}">
                            <option value="${patient[1]}">${patient[0]}</option> <!-- 'patient[1]' es el DNI -->
                        </c:forEach>
                    </select>
                    <button id="exportar" class="bg-femisalud-900 hover:bg-blue-800 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline mr-4" onclick="exportClinicalNotes()">
                        Exportar
                    </button>
                </div>

                <!-- Tabla -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h2 class="text-lg font-semibold text-center mb-4">Notas clínicas registradas</h2>
                    <div class="overflow-x-auto">
                        <table class="min-w-full bg-white border border-gray-200">
                            <thead class="bg-femisalud-900 text-white">
                            <tr>
                                <th class="py-2 px-4 border-b">DNI de la paciente</th>
                                <th class="py-2 px-4 border-b">ID de la ecografía</th>
                                <th class="py-2 px-4 border-b">Fecha y hora de la ecografía</th>
                                <th class="py-2 px-4 border-b">Nota clínica</th>
                            </tr>
                            </thead>
                            <tbody id="clinicalNotesBody">
                            <!-- Las notas clínicas se llenarán aquí dinámicamente -->
                            </tbody>
                        </table>
                    </div>

                    <button class="bg-femisalud-900 hover:bg-blue-800 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline mt-4 justify-center">
                        Editar datos
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/filterUltrasound.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/filterClinicalNotes.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/exportExcel.js"></script>
</body>
</html>
